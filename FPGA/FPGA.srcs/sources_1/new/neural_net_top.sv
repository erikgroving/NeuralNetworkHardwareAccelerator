`timescale 1ns / 1ps

module neural_net_top(
    input                   clk,
    input                   reset,
    input           [7: 0]  sw_i,
    output  logic   [7: 0]  led_o
    );

    logic                                   forward;
    logic                                   prev_reset;    
    // Logics for the fc0 layer
    logic                                   fc0_start;
    logic [`FC0_N_KERNELS - 1: 0][15: 0]    fc0_activation_i;
    logic                                   fc0_valid;
    logic                                   fc0_valid_i;    
    logic [`FC0_NEURONS - 1: 0][15: 0]      fc0_activation_o;
    logic [`FC0_NEURONS - 1: 0][6: 0]       fc0_neuron_id_o;
    logic                                   fc0_valid_act_o; 
    logic                                   fc0_buff_rdy; 
    logic                                   fc0_busy; 
    // Logics for the fc1 layer    
    logic                                   fc1_start;
    logic [`FC1_N_KERNELS - 1: 0][15: 0]    fc1_activation_i;
    logic                                   fc1_valid_i;    
    logic [`FC1_N_KERNELS - 1: 0][6: 0]     fc1_neuron_id_i; 
    logic [`FC1_N_KERNELS - 1: 0][15: 0]    fc1_activation_o;
    logic [`FC1_N_KERNELS - 1: 0][5: 0]     fc1_neuron_id_o;
    logic                                   fc1_valid_act_o;
    logic                                   fc1_buff_rdy; 
    logic                                   fc1_busy;   
     // Logics for the fc2 layer (the last fc layer)
    logic                                   fc2_start;
    logic                                   fc2_buff_rdy;
    logic [`FC2_N_KERNELS - 1: 0][15: 0]    fc2_activation_i;
    logic [`FC2_N_KERNELS - 1: 0][5: 0]     fc2_neuron_id_i;
    logic                                   fc2_valid_i;
    logic                                   fc2_busy;
    
    logic [`FC2_N_KERNELS - 1: 0][15: 0]    fc2_activation_o;
    logic [`FC2_N_KERNELS - 1: 0][3: 0]     fc2_neuron_id_o;
    logic                                   fc2_valid_o;       
    assign forward = 1'b1;

    
    
    logic [9: 0]        input_addr;
    logic [15: 0]       input_data_a;
    logic [15: 0]       input_data_b;

    assign fc0_buff_rdy = 1'b1;
    always_ff @(posedge clk) begin
        prev_reset  <= reset;
        if (reset) begin
            input_addr  <= 0;
            fc0_start   <= 0;
        end
        else if (input_addr == (`FC0_KERNEL_FAN_IN - 1'b1)) begin
            fc0_start   <= 1'b0;
            input_addr  <= 0;
        end
        else if (fc0_start) begin
            input_addr  <= input_addr + 1'b1;
        end
        else if (!fc0_start && !fc0_busy && fc0_buff_rdy) begin
            fc0_start   <= 1'b1;
            input_addr  <= 10'b0;
        end
        else begin
            fc0_start   <= 1'b0;
            input_addr  <= 10'b0;
        end
    end
    
    logic [9: 0] fc0_addr_a;
    logic [9: 0] fc0_addr_b;
    assign fc0_addr_a = input_addr << 1;
    assign fc0_addr_b = fc0_addr_a + 1'b1;
    net_input_bram net_input_bram_i (
        .addra(fc0_addr_a),
        .clka(clk),
        .dina(16'b0),
        .douta(input_data_a),
        .ena(1'b1),
        .wea(~forward),
        
        .addrb(fc0_addr_b),
        .clkb(clk),
        .dinb(16'b0),
        .doutb(input_data_b),
        .enb(1'b1),
        .web(~forward)
    );
    
    always_ff @(posedge clk) begin
        if (reset) begin
            fc0_activation_i    <= 0;
            fc0_valid           <= 0;
            fc0_valid_i         <= 0;
        end
        else begin
            fc0_activation_i    <= {{`FC0_NEURONS{input_data_b}}, {`FC0_NEURONS{input_data_a}}};
            fc0_valid           <= fc0_start;
            fc0_valid_i         <= fc0_valid;
        end
    end

    // FC0  
    fc0_layer fc0_layer_i (
        // inputs
        .clk(clk),
        .rst(reset),    
        .forward(forward), 
        .activations_i(fc0_activation_i),
        .valid_i(fc0_valid_i),
        
        // outputs
        .activation_o(fc0_activation_o),
        .neuron_id_o(fc0_neuron_id_o),
        .valid_act_o(fc0_valid_act_o),
        .fc0_busy(fc0_busy)
    );
    
    always_ff @(posedge clk) begin
        if (reset) begin
            fc1_start   <= 1'b0;
        end
        else begin
            fc1_start   <= fc1_buff_rdy & ~fc1_busy;
        end
    end 
    interlayer_activation_buffer
    #(.N_KERNELS_I(`FC0_NEURONS), 
        .N_KERNELS_O(`FC1_N_KERNELS), 
        .ID_WIDTH(7), 
        .BUFF_SIZE(`FC0_NEURONS),
        .LOOPS(4)) 
    interlayer_activations_fc0_fc1 (
        // inputs
        .clk(clk),
        .rst(reset),
        
        .start(fc1_start),
        .activation_i(fc0_activation_o),
        .neuron_id_i(fc0_neuron_id_o),
        .valid_act_i(fc0_valid_act_o),
        // outputs
        .activation_o(fc1_activation_i),
        .neuron_id_o(fc1_neuron_id_i),
        .valid_o(fc1_valid_i),
        
        .buff_rdy(fc1_buff_rdy)
    );
    
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
        .valid_act_o(fc1_valid_act_o),
        .fc1_busy(fc1_busy)   
    );
    

         
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
        .ID_WIDTH(6), 
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
            for (m = 0; m < `FC2_N_KERNELS; m=m+1) begin
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
    
    
    
    logic [4: 0][15: 0] max1;
    logic [15: 0]       max2;
    logic [15: 0]       max3;
    logic [15: 0]       max4;
    logic [15: 0]       max5;
    bit [3: 0] k;
    bit [3: 0] j;
    always_ff @(posedge clk) begin
        if (reset) begin
            led_o    <= 0;
        end
        else if (fc2_buf_valid) begin
            for (j = 0; j < 8; j=j+1) begin
                led_o[j] = fc2_act_o_buf[j] == max5;
            end        
        end
    end
    
    always_comb begin
        for (k = 0; k < 5; k=k+1) begin
            max1[k] = $signed(fc2_act_o_buf[2*k]) > $signed(fc2_act_o_buf[2*k+1]) ? 
                        fc2_act_o_buf[2*k] : fc2_act_o_buf[2*k + 1];
        end
        max2 = $signed(max1[0]) > $signed(max1[1]) ? max1[0] : max1[1];
        max3 = $signed(max1[2]) > $signed(max1[3]) ? max1[2] : max1[3];
        max4 = $signed(max2) > $signed(max3) ? max2 : max3;
        max5 = $signed(max4) > $signed(max1[4]) ? max4 : max1[4];        
    end

    
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
  
        $display("\n--- FC0 ---");
        $display("FC0_act_i: %04h\t\tFC0_valid_i: %01b", fc0_activation_i[0], fc0_valid_i);
        $display("ACT_O\t\tNEUR_ID\t\tVALID_O");
        for (it = 0; it < 10; it=it+1) begin
            $display("%04h\t\t%04d\t\t%01b", fc0_activation_o[it], fc0_neuron_id_o[it], fc0_valid_act_o);
        end        
        
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
