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
    logic           prev_reset;
    
    always_ff @(posedge clk) begin
        prev_reset  <= reset;
    end
    
    always_ff @(posedge clk) begin
        if (reset) begin
            fc1_iter        <= 0;
            fc1_buf_valid_i <= 1'b0;
        end
        else if (fc1_iter == `FC1_FAN_IN - 1'b1 || prev_reset) begin
            fc1_iter        <= 0;
            fc1_buf_valid_i <= 1'b1;
        end
        else begin
            fc1_iter        <= fc1_iter + 1'b1;
            fc1_buf_valid_i <= 1'b1;
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
    
    fc0_fc1_rand_activations fc0_fc1_rand_activations_i (
        .addra(fc1_buf_ptr),
        .clka(clk),
        .douta(fc1_buf_act_i),
        .ena(1'b1)
    );
    
    // Logics for the fc1 layer
    logic [`FC1_N_KERNELS - 1: 0][15: 0]    fc1_activation_i;
    logic                                   fc1_valid_i;    
 
    logic [`FC1_N_KERNELS - 1: 0][15: 0]    fc1_activation_o;
    logic [`FC1_N_KERNELS - 1: 0][4: 0]     fc1_neuron_id_o;
    logic                                   fc1_valid_act_o;
    
    assign fc1_activation_i = {`FC1_N_KERNELS{fc1_buf_act_i}};
    
    always_ff @(posedge clk) begin
        if (reset) begin
            fc1_valid_i <= 0;
        end
        else begin
            fc1_valid_i <= fc1_buf_valid_i;
        end
    end
    
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
    
    // Logics for the fc2 layer (the last fc layer)
    logic                                   fc2_start;
    logic                                   fc2_buff_rdy;
    logic [`FC2_N_KERNELS - 1: 0][15: 0]    fc2_activation_i;
    logic [`FC2_N_KERNELS - 1: 0][4: 0]     fc2_neuron_id_i;
    logic                                   fc2_valid_i;
    logic                                   fc2_busy;
    
    logic [`FC2_N_KERNELS - 1: 0][15: 0]    fc2_activation_o;
    logic [`FC2_N_KERNELS - 1: 0][3: 0]     fc2_neuron_id_o;
    logic                                   fc2_valid_o;    
         
    always_ff @(posedge clk) begin
        if (reset) begin
            fc2_start   <= 1'b0;
        end
        else begin
            $display("fc2_buff_rdy: %01b\tfc2_busy: %01b", fc2_buff_rdy, fc2_busy);
            fc2_start   <= fc2_buff_rdy & ~fc2_busy;
        end
    end 
    
    interlayer_activation_buffer
    #(.N_KERNELS_I(`FC1_N_KERNELS), 
        .N_KERNELS_O(`FC2_N_KERNELS), 
        .ID_WIDTH(5), 
        .BUFF_SIZE(`FC1_NEURONS),
        .LOOPS(`FC2_NEURONS)) 
    interlayer_activations_fc1_fc2 (
        // inputs
        .clk(clk),
        .rst(reset),
        
        .start(fc2_start),
        .activation_i(fc1_activation_o),
        .neuron_id_i(fc1_neuron_id_o),
        .valid_act_i(fc1_valid_act_o),
        // outputs
        .activation_o(fc2_activation_i),
        .neuron_id_o(fc2_neuron_id_i),
        .valid_o(fc2_valid_i),
        
        .buff_rdy(fc2_buff_rdy)
    );


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
        .valid_act_o(fc2_valid_o),
        .fc2_busy(fc2_busy)
    );




    logic [`FC2_NEURONS - 1: 0][15: 0]  fc2_act_o_buf;
    logic                               fc2_buf_valid;
    bit [`FC1_N_KERNELS - 1: 0] m;
    always_ff @(posedge clk) begin
        if (reset) begin
            fc2_act_o_buf   <= 0;
        end
        else begin
            for (m = 0; m < `FC1_N_KERNELS; m=m+1) begin
                if (fc2_valid_o) begin
                    fc2_act_o_buf[fc2_neuron_id_o[m]]  <= fc2_activation_o[m];
                end 
            end
        end
        
        if (reset) begin
            fc2_buf_valid   <= 1'b0;
        end
        else if (fc2_valid_o) begin
            fc2_buf_valid   <= fc2_neuron_id_o[`FC2_N_KERNELS - 1] == `FC2_NEURONS - 1;
        end
    end

    logic [`FC2_NEURONS - 1: 0][15: 0]  fc2_act_o_buf_r;

    logic prev_fc2_buf_valid;
    logic check;
    logic once;
    logic [4: 0] iter;
    logic [15: 0] max_val;
    always_ff @(posedge clk) begin
        if (reset) begin
            prev_fc2_buf_valid  <= 0;
            fc2_act_o_buf_r     <= 0;
        end
        else begin
            prev_fc2_buf_valid  <= fc2_buf_valid;
            fc2_act_o_buf_r     <= fc2_act_o_buf;
        end
        
        if (reset) begin
            check   <= 1'b0;
            iter    <= 0;
            max_val <= 16'h0000;
            once    <= 1'b0;
        end
        else if ({prev_fc2_buf_valid, fc2_buf_valid} == 2'b01 && ~once) begin
            check   <= 1'b1;
            once    <= 1'b1;
            iter    <= 0;
            max_val <= 16'h0000;
        end
        else if (check) begin
            max_val <= (max_val > fc2_act_o_buf_r[iter]) ? max_val : fc2_act_o_buf_r[iter];
            iter    <= iter + 1'b1;
            if (iter == 5'd9) begin
                check   <= 1'b0;
            end
        end
    end
    logic [9: 0] one_hot;
    assign one_hot[0] = (fc2_act_o_buf_r[0] == max_val);
    assign one_hot[1] = (fc2_act_o_buf_r[1] == max_val);
    assign one_hot[2] = (fc2_act_o_buf_r[2] == max_val);
    assign one_hot[3] = (fc2_act_o_buf_r[3] == max_val);
    assign one_hot[4] = (fc2_act_o_buf_r[4] == max_val);
    assign one_hot[5] = (fc2_act_o_buf_r[5] == max_val);
    assign one_hot[6] = (fc2_act_o_buf_r[6] == max_val);
    assign one_hot[7] = (fc2_act_o_buf_r[7] == max_val);    
    assign one_hot[8] = (fc2_act_o_buf_r[6] == max_val);
    assign one_hot[9] = (fc2_act_o_buf_r[7] == max_val);
    
    assign led_o[0] = one_hot[0] || one_hot[8] || one_hot[9];
    assign led_o[1] = one_hot[1] || one_hot[8];
    assign led_o[2] = one_hot[2] || one_hot[9];
    assign led_o[3] = one_hot[3];
    assign led_o[4] = one_hot[4];
    assign led_o[5] = one_hot[5];
    assign led_o[6] = one_hot[6];
    assign led_o[7] = one_hot[7];
    
    
    `ifdef DEBUG
     integer clk_cycle;
     integer it;

     always_ff @(posedge clk) begin
        if (reset) begin
            clk_cycle   <= 0;
        end
        else begin
            clk_cycle   <=  clk_cycle + 1'b1;
        end
        $display("\n\n------ CYCLE %04d ------", clk_cycle);
        $display("FC1_iter: %04d\nFC1_buf_offset: %04d", fc1_iter, fc1_buf_offset);
        $display("FC1_BUF_PTR: %04d\nFC1_ACT_I: %04h", fc1_buf_ptr, fc1_buf_act_i);  
        $display("\n--- FC1 ---");
        $display("FC1_act_i: %04h\t\tFC1_valid_i: %01b", fc1_activation_i[0], fc1_valid_i);
        $display("ACT_O\t\tNEUR_ID\t\tVALID_O");
        for (it = 0; it < `FC1_N_KERNELS; it=it+1) begin
            $display("%04h\t\t%04d\t\t%01b", fc1_activation_o[it], fc1_neuron_id_o[it], fc1_valid_act_o);
        end
        $display("\n--- FC2 ---");
        $display("fc2_act_i: %04h\t\tfc2_valid_i: %01b", fc2_activation_i[0], fc2_valid_i);
        $display("ACT_O\t\tNEUR_ID\t\tVALID_O");
        for (it = 0; it < `FC2_N_KERNELS; it=it+1) begin
            $display("%04h\t\t%04d\t\t%01b", fc2_activation_o[it], fc2_neuron_id_o[it], fc2_valid_o);
        end
        
        $display("--- FC2 OUT ---");        
        $display("fc2_buf_valid: %01b" , fc2_buf_valid);
        for (it= 0; it < `FC2_NEURONS; it=it+1) begin
            $display("%02d: %04h", it, fc2_act_o_buf[it]); 
        end
        $display("LEDS: %08b", led_o);
     end 
    `endif    

    
endmodule
