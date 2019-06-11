`timescale 1ns / 1ps
`include "sys_defs.vh"

module fc2_layer(
        input                                       clk,
        input                                       rst,
        input                                       forward,
        input                                       update,
        input  [`FC2_N_KERNELS - 1: 0][15: 0]       activations_i,
        input                                       valid_i,
        input  [4: 0]                               lrate_shifts,    

   
        input [`FC2_N_KERNELS - 1: 0][15: 0]        b_gradient_i,
        input [`FC2_N_KERNELS - 1: 0][15: 0]        b_activation_i,
        input [5: 0]                                b_activation_id,
        input [`FC2_N_KERNELS - 1: 0][3: 0]         b_neuron_id_i,
        input                                       b_valid_i,
        input                                       bp_mode,
        
        
        output logic [`FC2_N_KERNELS - 1: 0][15: 0] activation_o,
        output logic [`FC2_N_KERNELS - 1: 0][3: 0]  neuron_id_o,
        output logic                                valid_act_o,
        output logic                                fc2_busy,
        output logic                                bp_done,
        output logic                                update_done,
        
        output logic [`FC1_NEURONS - 1: 0][15: 0]   pl_gradients,
        output logic                                pl_grad_valid

    );
    
    logic   [`FC2_N_KERNELS - 1: 0][15: 0]          data_in;
    logic   [`FC2_N_KERNELS - 1: 0][15: 0]          data_out;

    logic   [`FC2_N_KERNELS - 1: 0][15: 0]          weights;
    logic   [`FC2_ADDR - 1: 0]                      head_ptr;
    logic   [`FC2_ADDR - 1: 0]                      mid_ptr;
    logic   [`FC2_BIAS_ADDR - 1: 0]                 bias_ptr;
   
    logic   [`FC2_N_KERNELS - 1: 0][15: 0]          sch_activations;
    logic                                           sch_valid;
    logic   [`FC2_N_KERNELS - 1: 0][15: 0]          bram_activations;
    logic                                           bram_valid;
    logic   [`FC2_N_KERNELS - 1: 0][15: 0]          kern_activations;
    logic                                           kern_valid;
    
    logic   [`FC2_N_KERNELS - 1: 0][15: 0]          bias;
    logic   [`FC2_N_KERNELS - 1: 0][15: 0]          kern_bias;
    logic                                           sch_has_bias;
    logic                                           bram_has_bias;
    logic                                           kern_has_bias;
    logic   [`FC2_N_KERNELS - 1: 0][3: 0]           neuron_id;
    logic   [`FC2_N_KERNELS - 1: 0][3: 0]           kern_neuron_id;
    logic   [`FC2_N_KERNELS - 1: 0]                 last_weight;
    
    
    logic   [`FC2_N_KERNELS - 1: 0]                 valid;
    
    logic [`FC2_N_KERNELS - 1: 0][15: 0]            b_gradient;
    logic [`FC2_N_KERNELS - 1: 0][15: 0]            b_gradient_pl;
    logic [`FC2_N_KERNELS - 1: 0][15: 0]            b_kern_grad;
    logic [`FC2_N_KERNELS - 1: 0][15: 0]            b_act;   
    logic [`FC2_N_KERNELS - 1: 0][15: 0]            b_act_pl;   
    logic [`FC2_N_KERNELS - 1: 0][15: 0]            b_kern_act;   
    
    logic [`FC2_N_KERNELS - 1: 0][15: 0]            b_kern_grad_o;
    logic [`FC2_N_KERNELS - 1: 0]                   b_kern_valid_o;
    logic [2: 0]                                    b_valid;
    logic [3: 0][5: 0]                              b_act_id;
    logic [3: 0][`FC2_N_KERNELS - 1: 0][3: 0]       b_neuron_id;     
   
    logic                                           b_kern_valid;
    logic                                           b_weight_we;
    
    logic                                           sch_bp_mode;
    logic                                           bram_bp_mode;
    logic                                           kern_bp_mode;
    logic                                           kern_bp_mode_o;
    
    logic [`FC2_N_KERNELS - 1: 0][15: 0]            kern_mult1;
    logic [`FC2_N_KERNELS - 1: 0][15: 0]            kern_mult2;   
    logic [`FC2_N_KERNELS - 1: 0][15: 0]            weight_grad;
    logic [`FC2_N_KERNELS - 1: 0][15: 0]            weight_grad_o;
    logic [`FC2_N_KERNELS - 1: 0][9: 0]             fc2_weight_grad_addr;
    
    logic [`FC2_N_KERNELS - 1: 0][16: 0]            update_weights_sat;
    logic [`FC2_N_KERNELS - 1: 0][15: 0]            update_weights;
   
    logic                                           prev_b_kern_valid; 
   
    logic                                           sch_valid_i;
    
    localparam WEIGHT_MODE = 0;
    localparam NEURON_MODE = 1;   
    
    always_ff @(posedge clk) begin
        if (rst) begin
            prev_b_kern_valid   <= 0;
        end
        else begin
            prev_b_kern_valid   <= &b_kern_valid_o;
        end
    end
    
    always_ff @(posedge clk) begin
        if (rst) begin
            sch_activations <= 0;
            sch_valid       <= 0;
            sch_bp_mode     <= 0;
        end
        else begin
            sch_activations <= activations_i;
            sch_valid       <= valid_i;
            sch_bp_mode     <= bp_mode;
        end
    end
    
    
    assign sch_valid_i = (forward) ? valid_i : b_valid_i & bp_mode == NEURON_MODE;
    // Scheduler for the fully connected layer
    fc_scheduler #(.ADDR(`FC2_ADDR), .BIAS_ADDR(`FC2_BIAS_ADDR), .MID_PTR_OFFSET(`FC2_MID_PTR_OFFSET), .FAN_IN(`FC2_FAN_IN)) fc2_scheduler_i (
        //inputs
        .clk(clk),
        .rst(rst),
        .forward(forward),
        .valid_i(sch_valid_i),
        
        //outputs
        .head_ptr(head_ptr),
        .mid_ptr(mid_ptr),      
        .bias_ptr(bias_ptr),
        .has_bias(sch_has_bias)
    );

    


    always_ff @(posedge clk) begin
        if (rst) begin
            bram_activations    <= 0;
            bram_valid          <= 0;
            bram_has_bias       <= 0;
            fc2_busy            <= 0;
            bram_bp_mode        <= 0;
        end
        else begin
            bram_activations    <= sch_activations;
            bram_valid          <= sch_valid;
            bram_has_bias       <= sch_has_bias;
            fc2_busy            <= valid_i;
            bram_bp_mode        <= sch_bp_mode;
        end
    end
   
    logic [10: 0]   update_ptr; 
    logic [9: 0]    update_addr_a;
    logic [9: 0]    update_addr_b;
    logic [9: 0]    w_addr_a;
    logic [9: 0]    w_addr_b;
    logic [9: 0]    wg_addr_a;
    logic [9: 0]    wg_addr_b;
    logic           w_we;
    logic           wg_we;
    

    always_ff @(posedge clk) begin
        if (rst) begin
            update_ptr  <= 0;
        end
        else if (update) begin 
            update_ptr  <= update_ptr + 1'b1;
        end
        else begin
            update_ptr  <= 0;
        end
    end
    
    
    assign update_done      = update_ptr == 11'd639;
    assign update_addr_a    = update_ptr[10: 1] << 1;
    assign update_addr_b    = update_addr_a + 1'b1;
    assign w_addr_a         = (update) ? update_addr_a  : head_ptr;
    assign w_addr_b         = (update) ? update_addr_b  : mid_ptr;
    assign wg_addr_a        = (update) ? update_addr_a  : fc2_weight_grad_addr[0];
    assign wg_addr_b        = (update) ? update_addr_b  : fc2_weight_grad_addr[1];
    assign w_we             = (update) ? update_ptr[0]  : 1'b0;  // write when odd
    assign wg_we            = (update) ? 1'b0           : b_weight_we; 
    
    always_comb begin
        case(lrate_shifts)
            5'd9: begin
                weight_grad[0]  = {{9{weight_grad_o[0][15]}}, weight_grad_o[0][15:9]};
                weight_grad[1]  = {{9{weight_grad_o[1][15]}}, weight_grad_o[1][15:9]};
            end
            5'd10: begin
                weight_grad[0]  = {{10{weight_grad_o[0][15]}}, weight_grad_o[0][15:10]};
                weight_grad[1]  = {{10{weight_grad_o[1][15]}}, weight_grad_o[1][15:10]};
            end
            5'd11: begin
                weight_grad[0]  = {{11{weight_grad_o[0][15]}}, weight_grad_o[0][15:11]};
                weight_grad[1]  = {{11{weight_grad_o[1][15]}}, weight_grad_o[1][15:11]};
            end
            5'd12: begin
                weight_grad[0]  = {{12{weight_grad_o[0][15]}}, weight_grad_o[0][15:12]};
                weight_grad[1]  = {{12{weight_grad_o[1][15]}}, weight_grad_o[1][15:12]};
            end
            default: begin
                weight_grad[0]  = {{8{weight_grad_o[0][15]}}, weight_grad_o[0][15:8]};
                weight_grad[1]  = {{8{weight_grad_o[1][15]}}, weight_grad_o[1][15:8]};
            end
        endcase
        update_weights_sat[0]   = $signed(data_out[0]) - $signed(weight_grad[0]);
        update_weights_sat[1]   = $signed(data_out[1]) - $signed(weight_grad[1]);
    end
    
    bit [7: 0] d;
    always_comb begin
        for (d = 0; d < `FC2_N_KERNELS; d=d+1) begin
            if (update_weights_sat[d][16:15] == 2'b01) begin
                update_weights[d]   = 16'h7FFF;
            end
            else if (update_weights_sat[d][16:15] == 2'b10) begin
                update_weights[d]   = 16'h8000;
            end
            else begin
                update_weights[d]   = update_weights_sat[d][15: 0];
            end
        end
    end       
    
    // BRAM for the weights of the fully connected layer
    fc2_weight_bram_controller fc2_weight_bram_controller_i (
        // inputs
        .clk(clk),
        .rst(rst),
        
        .addr_a(w_addr_a),
        .data_in_a(update_weights[0]),
        .en_a(1'b1),
        .we_a(w_we),
        
        .addr_b(w_addr_b),
        .data_in_b(update_weights[1]),
        .en_b(1'b1),
        .we_b(w_we),
        
        // outputs
        .data_out(data_out),        
        .neuron_id(neuron_id)
        
    ); 
    
     biases_fc2_blk_mem biases_fc2_blk_mem_i (
        .addra(bias_ptr),
        .clka(clk),
        .dina(32'b0),
        .douta({bias[1], bias[0]}),
        .ena(1'b1),
        .wea(1'b0)
    );
    
    assign b_weight_we = &b_kern_valid_o & kern_bp_mode_o == WEIGHT_MODE;
    assign fc2_weight_grad_addr[0] = ({6'b0, b_neuron_id[3][0]} << 6) + b_act_id[3];
    assign fc2_weight_grad_addr[1] = ({6'b0, b_neuron_id[3][1]} << 6) + b_act_id[3];

    fc2_weight_gradients fc2_weight_gradients_i (
        .addra(wg_addr_a),
        .clka(clk),
        .dina(b_kern_grad_o[0]),
        .douta(weight_grad_o[0]),
        .ena(1'b1),
        .wea(wg_we),
        
        .addrb(wg_addr_b),
        .clkb(clk),
        .dinb(b_kern_grad_o[1]),
        .doutb(weight_grad_o[1]),
        .enb(1'b1),
        .web(wg_we)
    );
    
    
    bit [2: 0] z;
    always_ff @(posedge clk) begin
    
       
        // Calculating gradients for the neurons of the previous layer
        if (rst || forward) begin
            pl_gradients    <= 0;
        end
        else if (&b_kern_valid_o & kern_bp_mode_o == NEURON_MODE) begin
            pl_gradients[b_act_id[3]]    <= $signed(pl_gradients[b_act_id[3]]) + 
                                            $signed(b_kern_grad_o[0]) + 
                                            $signed(b_kern_grad_o[1]);
        end

        if (rst) begin
            pl_grad_valid   <= 0;
        end
        else if (&b_kern_valid_o & {kern_bp_mode_o, kern_bp_mode} == 2'b10) begin
            pl_grad_valid   <= 1'b1;
        end
        else if (forward) begin
            pl_grad_valid   <= 1'b0;
        end
    end



    always_ff @(posedge clk) begin
        if (rst) begin
            kern_valid          <= 0;
            kern_has_bias       <= 0;
        end
        else begin
            kern_valid          <= bram_valid;
            kern_has_bias       <= bram_has_bias;
        end            
        kern_activations    <= bram_activations;
        kern_bias           <= 0;//bias;
        kern_neuron_id      <= neuron_id;
        kern_bp_mode        <= bram_bp_mode;
        kern_bp_mode_o      <= kern_bp_mode;
        weights             <= data_out;
    end

    
    
    // 3 modes of use in kernel
    // forward: weight * activations
    // weight gradient: gradient * activations
    // neuron gradient: weight * gradient
    assign kern_mult1   =   (forward)                       ? weights           : 
                            (bram_bp_mode == WEIGHT_MODE)   ? b_kern_grad       : weights;
    
    assign kern_mult2   =   (forward)                       ? kern_activations  : 
                            (bram_bp_mode == WEIGHT_MODE)   ? b_kern_act        : b_kern_grad;

    // Computational kernel for the fully connected layer    
    genvar i;
    generate
        for (i = 0; i < `FC2_N_KERNELS; i=i+1) begin
            fc_kernel #(.FAN_IN(`FC2_FAN_IN), .ID_WIDTH(4)) fc_kernel_i (
                // input
                .clk(clk),
                .rst(rst),
                .activation_i(kern_mult2[i]),
                .weight(kern_mult1[i]),
                .bias(kern_bias[i]),
                .neuron_id_i(kern_neuron_id[i]),
                .has_bias(kern_has_bias),
                .valid_i(kern_valid),
                .b_valid_i(b_valid[2]),
                // output
                .b_gradient_o(b_kern_grad_o[i]),
                .b_valid_o(b_kern_valid_o[i]),
                .activation_o(activation_o[i]),
                .neuron_id_o(neuron_id_o[i]),
                .valid_o(valid[i])
            );
        end
    endgenerate    
    assign bp_done = wg_we && wg_addr_a == `FC2_MID_PTR_OFFSET - 1;
    assign valid_act_o = &valid;
   

   // Backward pass logic
    always_ff @(posedge clk) begin
        b_gradient      <= b_gradient_i;
        b_gradient_pl   <= b_gradient;
        b_kern_grad     <= b_gradient_pl;            
        
        b_act           <= b_activation_i;
        b_act_pl        <= b_act;
        b_kern_act      <= b_act_pl;            
        
        
        b_act_id        <= {b_act_id[2:0], b_activation_id};
        b_neuron_id     <= {b_neuron_id[2:0], b_neuron_id_i};
        b_valid         <= {b_valid[1: 0], b_valid_i};
    end

    `ifdef DEBUG
    integer it, it2;
    always_ff @(negedge clk) begin
        localparam sf = 2.0**-13.0; 
        $display("\n--- BACKWARD PASS2 ---");
        $display("INPUT");
        $display("Activation id: %02d\t\tValid: %01b", b_activation_id, b_valid_i);
        $display("Gradient\t\tNeuronID\t\tAct_I");
        for (it = 0; it < `FC2_N_KERNELS; it=it+1) begin
            $display("%f\t\t\t%01d\t\t\t\t%f", $itor($signed(b_gradient_i[it])), 
            b_neuron_id_i[it], $itor($signed(b_activation_i[it]))) ;
        end
        /*
        $display("KERNEL INPUT");
        $display("Activation id: %02d\t\tValid: %01b", b_act_id[2], b_valid[2]);
        $display("Gradient\t\tWeight");
        for (it = 0; it < `FC2_N_KERNELS; it=it+1) begin
            $display("%04h\t\t\t%04h", b_kern_grad[it], weights[it]);
        end        
        $display("OUTPUT");
        $display("Mode: %01b", kern_bp_mode_o);
        $display("Gradient\t\tNeuronID\t\tActID\t\tValid");
        for (it = 0; it < `FC2_N_KERNELS; it=it+1) begin
            $display("%04h\t\t\t%01d\t\t\t\t%02d\t\t\t%01b", b_kern_grad_o[it], b_neuron_id[3][it], 
                    b_act_id[3], b_kern_valid_o[it]);
        end
        $display("--- GBRAM ---");
        $display("kern_bram_bp_mode_o: %01b", kern_bp_mode_o);
        $display("addr_a: %02d\t\tgrad_a: %04h\t\twe: %01b", fc2_weight_grad_addr[0], b_kern_grad_o[0], b_weight_we);
        $display("addr_b: %02d\t\tgrad_b: %04h\t\twe: %01b", fc2_weight_grad_addr[1], b_kern_grad_o[1], b_weight_we);
*//*
        $display("--- UPDATE ---");
        $display("update: %01b", update);
        $display("u_addr_a: %03d\t\tu_addr_b: %03d", update_addr_a, update_addr_b);
        $display("w_addr_a: %03d\t\tw_addr_b: %03d", w_addr_a, w_addr_b);
        $display("wg_addr_a: %03d\t\twg_addr_b: %03d", wg_addr_a, wg_addr_b);
        $display("w_we: %01b\t\twg_we: %01b", w_we, wg_we);
        $display("wr_grad[0]: %04h\t\twr_grad[1]: %04h", b_kern_grad_o[0], b_kern_grad_o[1]);
        $display("data_out[0]: %04h\t\tweight_grad_o[0]: %04h", data_out[0], weight_grad_o[0]);
        $display("data_out[1]: %04h\t\tweight_grad_o[1]: %04h", data_out[1], weight_grad_o[1]);
        $display("update_weights[0]: %04h", update_weights[0]);
        $display("update_weights[1]: %04h", update_weights[1]);
    

    */    
 

        if (pl_grad_valid) begin
            $display("\n--- NEURON GRADIENTS2 ---");
            for (it = 0; it < `FC1_NEURONS; it=it+1) begin
                $display("%02d:\t%f", it, $itor($signed(pl_gradients[it])) * sf);
            end
        end
        if (wg_we) begin
            $display("WEIGHT GRADS2");
            $display("Activation ID: %03d", fc2_weight_grad_addr[0]);
            for (it = 0; it < 1; it=it+1) begin
                $display("%02d: %f", b_neuron_id[3][it], $itor($signed(b_kern_grad_o[it])) * sf);
            end
            $display("Activation ID: %03d", fc2_weight_grad_addr[1]);
            for (it = 1; it < 2; it=it+1) begin
                $display("%02d: %f", b_neuron_id[3][it], $itor($signed(b_kern_grad_o[it])) * sf);
            end
        end
        /*
        $display("\n--- SCHEDULER ---");
        $display("head_ptr: %04d\t\tmid_ptr: %04d\t\tbias_ptr: %01d\t\tsch_valid_i: %01b", head_ptr, mid_ptr, bias_ptr, sch_valid_i);
        $display("\n--- MEMORY CONTROLLER ---");
        $display("data_out_a\t");
        for (it = 0; it < `FC2_BRAM; it = it + 1) begin
            $display("%04h", data_out[it]);       
        end
        $display("\nBias");
        for (it = 0; it < `FC2_N_KERNELS; it = it + 1) begin
            $display("%04h", bias[it]);
        end
        
        $display("\nneuron_id");
        for (it = 0; it < `FC2_N_KERNELS; it = it + 1) begin
            $display("%01d", neuron_id[it]);       
        end
        $display("\n--- KERNELS---");
        $display("has_bias: %01b", bram_has_bias);
        $display("ACT_I\t\tWEIGHT\t\tBIAS\t\tBRAM_VALID");
        for (it = 0; it < `FC2_N_KERNELS; it=it+1) begin
            $display("%04h\t\t%04h\t\t%04h\t\t\t%01b",
            bram_activations[it], weights[it], bias[it], bram_valid);
        end
            
        $display("\nACT_O\t\tNEURON_ID_O\t\tVALID_ACT_O");
        for (it = 0; it < `FC2_N_KERNELS; it=it+1) begin
            $display("%04h\t\t%02d\t\t\t\t%01b",
            activation_o[it], neuron_id_o[it], valid_act_o);
        end  */      
     end
    `endif   
endmodule
