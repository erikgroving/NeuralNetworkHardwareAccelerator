`timescale 1ns / 1ps

module neural_net_top(
    input                   clk,
    input                   reset,
    input           [7: 0]  sw_i,
    output  logic   [7: 0]  led_o
    );

    logic forward;
    
    assign forward = 1'b1;

    logic   [11: 0] fc1_iter;
    logic   [11: 0] fc1_buf_offset;
    logic   [11: 0] fc1_buf_ptr;
    logic   [15: 0] fc1_buf_act_i;
    logic           fc1_buf_valid_i;
    
    always_ff @(posedge clk) begin
        if (reset) begin
            fc1_iter    <= 0;
        end
        else if (fc1_iter == `FC1_FAN_IN - 1'b1) begin
            fc1_iter    <= 0;
        end
        else begin
            fc1_iter    <= fc1_iter + 1'b1;
        end
    end
    
    assign fc1_buf_offset   =   sw_i[0] ? 0         :
                                sw_i[1] ? 12'd392   :
                                sw_i[2] ? 12'd784   :
                                sw_i[3] ? 12'd1176  :
                                sw_i[4] ? 12'd1568  :
                                sw_i[5] ? 12'd1960  :
                                sw_i[6] ? 12'd2352  :
                                sw_i[7] ? 12'd2744  : 0;
                                
    assign fc1_buf_ptr      = fc1_iter + fc1_buf_offset;
    
    // FC0 --> FC1 BRAM activation buffer
    fc1_fc2_rand_activation_buff fc1_fc2_rand_activation_buff_i(
        .addra(),
        .clka(clk),
        .dina(),
        .ena(1'b1),
        .wea(),
        
        .addrb(fc1_buf_ptr),
        .clkb(clk),
        .doutb(fc1_buf_act_i),
        .enb(1'b1)
    );
    
    // Logics for the fc1 layer
    logic [`FC1_N_KERNELS - 1: 0][15: 0]    fc1_activation_i;
    logic [`FC1_N_KERNELS - 1: 0]           fc1_valid_i;    
 
    logic [`FC1_N_KERNELS - 1: 0][15: 0]    fc1_activation_o;
    logic [`FC1_N_KERNELS - 1: 0][4: 0]     fc1_neuron_id_o;
    logic [`FC1_N_KERNELS - 1: 0]           fc1_valid_act_o;
    
    assign fc1_activation_i = {`FC1_N_KERNELS{fc1_buf_act_i}};
    assign fc1_valid_i      = {`FC1_N_KERNELS{!reset}};
    // FC1   
    fc1_layer fc1_layer_i (
        // inputs
        .clk(clk),
        .rst(reset),    
        .forward(forward), 
        .activations_i(fc1_activation_i),
        .valid_i(fc1_valid_i),
        
        // outputs
        .activation_o(fc1_activation_o),
        .neuron_id_o(fc1_neuron_id_o),
        .valid_act_o(fc1_valid_act_o)    
    );
    
    // FC1 --> FC2 buffer   
    // Stored in fabric since only 32 activations for the layer
    logic [`FC2_FAN_IN - 1: 0][15: 0]   fc1_fc2_buff;
    logic                               fc1_fc2_rdy;
    logic [8: 0]                        fc1_fc2_buff_ptr;
    logic                               fc2_start;

        
    bit [6: 0]  j;
    always_ff @(posedge clk) begin
        if (reset) begin
            fc1_fc2_buff        <= 0;
            fc1_fc2_rdy         <= 0;
        end
        else if(&fc1_valid_act_o) begin
            for (j = 0; j < `FC1_N_KERNELS; j=j+1) begin
                fc1_fc2_buff[fc1_neuron_id_o[j]]    <= fc1_activation_o[j];
            end
            
            if (fc1_neuron_id_o[`FC1_N_KERNELS - 1] == 5'd31 && !fc2_start) begin
                fc1_fc2_rdy <= 1'b1;
            end
            else begin
                fc1_fc2_rdy <= 1'b0;
            end
        end
    end
     
    always_ff @(posedge clk) begin
        if (reset) begin
            fc1_fc2_buff_ptr    <= 0;
            fc2_start           <= 0;
        end
        else if (fc1_fc2_rdy && !fc2_start) begin
            fc1_fc2_buff_ptr    <= 0;
            fc2_start           <= 1'b1;            
        end
        else if (fc1_fc2_buff_ptr == 8'd`FC2_FAN_IN - 1) begin
            fc1_fc2_buff_ptr    <= 1'b0;
            fc2_start           <= 1'b0;
        end
        else if (fc2_start) begin
            fc1_fc2_buff_ptr    <= fc1_fc2_buff_ptr + 1'b1;
            fc2_start           <= fc2_start;
        end    
    end
    
    // Logics for the fc2 layer (the last fc layer)
    logic [`FC2_N_KERNELS - 1: 0][15: 0]    fc2_activation_i;
    logic [`FC2_N_KERNELS - 1: 0]           fc2_valid_i;
    
    logic [`FC2_N_KERNELS - 1: 0][15: 0]    fc2_activation_o;
    logic [`FC2_N_KERNELS - 1: 0][3: 0]     fc2_neuron_id_o;
    logic [`FC2_N_KERNELS - 1: 0]           fc2_valid_o;    
    bit [3: 0]  k;
    always_ff @(posedge clk) begin
        if (reset) begin
            fc2_activation_i    <= 0;
            fc2_valid_i         <= 0;
        end
        else begin
            for (k = 0; k < `FC2_N_KERNELS; k=k+1) begin
                fc2_activation_i[k] <= fc1_fc2_buff[fc1_fc2_buff_ptr];
                fc2_valid_i[k]      <= fc2_start;
            end
        end
    end
    
    
    

    
    // FC2, fed directly from FC1 due to the small size
    fc2_layer fc2_layer_i (
        // inputs
        .clk(clk),
        .rst(reset),
        .forward(forward),
        .activations_i(fc2_activation_i),
        .valid_i(fc2_valid_i),
        
        // outputs
        .activation_o(fc2_activation_o),
        .neuron_id_o(fc2_neuron_id_o),
        .valid_act_o(fc2_valid_o)  
    );



    logic [`FC2_NEURONS - 1: 0][15: 0]  fc2_act_o_buf;
    logic                               fc2_buf_valid;
    bit [6: 0] m;
    always_ff @(posedge clk) begin
        if (reset) begin
            fc2_act_o_buf   <= 0;
        end
        else begin
            for (m = 0; m < `FC1_N_KERNELS; m=m+1) begin
                if (fc2_valid_o[m]) begin
                    fc2_act_o_buf[fc2_neuron_id_o[m]]  <= fc2_activation_o[m];
                end 
            end
        end
        
        if (reset) begin
            fc2_buf_valid   <= 1'b0;
        end
        else if (&fc2_valid_o) begin
            fc2_buf_valid   <= fc2_neuron_id_o[`FC1_N_KERNELS - 1] == `FC2_FAN_IN - 1;
        end
    end



    // Logic to display max on LED
    logic   [3: 0]      max_idx;
    logic   [15: 0]     max_val;
    bit     [3: 0]      i;
    always_comb begin
        max_idx = 4'b0;
        max_val = fc2_act_o_buf[0];
        for (i = 4'b1; i < `FC2_NEURONS; i=i+1) begin
            if (fc2_act_o_buf[i] > max_val) begin // note: since relu, do not need to worry about negative numbers in the comparions
                max_idx = i;
                max_val = fc2_act_o_buf[i];
            end
        end
    end
    
    
    logic [7: 0]    led;
    // Gets the max idx and sets the LED accordingly
    always_ff @(posedge clk) begin
        case(max_idx)
            4'd0:
                led     <= 8'h01;
            4'd1:
                led     <= 8'h02;
            4'd2:
                led     <= 8'h04;
            4'd3:
                led     <= 8'h08;
            4'd4:
                led     <= 8'h10;
            4'd5:
                led     <= 8'h20;
            4'd6:
                led     <= 8'h40;
            4'd7:
                led     <= 8'h80;
            4'd8:
                led     <= 8'h03;
            4'd9:
                led     <= 8'h05;
            default:
                led     <= 8'hF0;
        endcase
        
        if (reset) begin
            led_o   <= 8'b00;
        end
        else if (fc2_buf_valid) begin
            led_o   <= led;
        end
    end
    
    
endmodule
