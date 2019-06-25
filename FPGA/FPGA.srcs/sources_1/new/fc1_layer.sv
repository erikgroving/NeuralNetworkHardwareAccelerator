`timescale 1ns / 1ps
`include "sys_defs.vh"

module fc1_layer(
        input                                       clk,
        input                                       rst,
        input                                       forward,
        input                                       update,
        input  [`FC1_N_KERNELS - 1: 0][`PREC - 1: 0]       activations_i,
        input                                       valid_i,        
        input  [4: 0]                               lrate_shifts,    


        input [`FC1_N_KERNELS - 1: 0][`PREC - 1: 0]        b_gradient_i,
        input [`FC1_N_KERNELS - 1: 0][`PREC - 1: 0]        b_activation_i,
        input [6: 0]                                b_activation_id,
        input [`FC1_N_KERNELS - 1: 0][5: 0]         b_neuron_id_i,
        input                                       b_valid_i,
        input                                       bp_mode,

        
        output logic [`FC1_N_KERNELS - 1: 0][`PREC - 1: 0] activation_o,
        output logic [`FC1_N_KERNELS - 1: 0][5: 0]  neuron_id_o,
        output logic                                valid_act_o,
        output logic                                fc1_busy,
        output logic                                bp_done,
        output logic                                update_done,
        
        output logic [`FC0_NEURONS - 1: 0][`PREC - 1: 0]   pl_gradients,
        output logic                                pl_grad_valid

    );
    
    logic   [`FC1_PORT_WIDTH - 1: 0][`PREC - 1: 0]         data_in_a;
    logic   [`FC1_PORT_WIDTH - 1: 0][`PREC - 1: 0]         data_in_b;
    logic   [`FC1_PORT_WIDTH - 1: 0][`PREC - 1: 0]         data_out_a;
    logic   [`FC1_PORT_WIDTH - 1: 0][`PREC - 1: 0]         data_out_b;

    logic   [`FC1_N_KERNELS - 1: 0][`PREC - 1: 0]          weights;
    logic   [`FC1_ADDR - 1: 0]                      head_ptr;
    logic   [`FC1_ADDR - 1: 0]                      mid_ptr;
    logic   [`FC1_BIAS_ADDR - 1: 0]                 bias_ptr;
   
    logic   [`FC1_N_KERNELS - 1: 0][`PREC - 1: 0]          sch_activations;
    logic                                           sch_valid;
    logic   [`FC1_N_KERNELS - 1: 0][`PREC - 1: 0]          bram_activations;
    logic                                           bram_valid;    
    logic   [`FC1_N_KERNELS - 1: 0][`PREC - 1: 0]          kern_activations;
    logic                                           kern_valid;
    
    logic   [`FC1_N_KERNELS - 1: 0][`PREC - 1: 0]          bias;
    logic   [`FC1_N_KERNELS - 1: 0][`PREC - 1: 0]          kern_bias;
    logic   [255: 0]                                bias_container;
    logic                                           sch_has_bias;
    logic                                           bram_has_bias;
    logic                                           kern_has_bias;
    logic   [`FC1_N_KERNELS - 1: 0][5: 0]           neuron_id;
    logic   [`FC1_N_KERNELS - 1: 0][5: 0]           kern_neuron_id;
    logic   [`FC1_N_KERNELS - 1: 0]                 last_weight;

    logic   [`FC1_N_KERNELS - 1: 0]                 valid;
    
    logic [`FC1_N_KERNELS - 1: 0][`PREC - 1: 0]            kern_activation_o;
    
    logic [`FC1_N_KERNELS - 1: 0][`PREC - 1: 0]            b_gradient;
    logic [`FC1_N_KERNELS - 1: 0][`PREC - 1: 0]            b_gradient_pl;
    logic [`FC1_N_KERNELS - 1: 0][`PREC - 1: 0]            b_kern_grad;
    logic [`FC1_N_KERNELS - 1: 0][`PREC - 1: 0]            b_act;   
    logic [`FC1_N_KERNELS - 1: 0][`PREC - 1: 0]            b_act_pl;   
    logic [`FC1_N_KERNELS - 1: 0][`PREC - 1: 0]            b_kern_act;   
    
    logic [`FC1_N_KERNELS - 1: 0][`PREC - 1: 0]            b_kern_grad_o;
    logic [`FC1_N_KERNELS - 1: 0]                   b_kern_valid_o;
    logic [2: 0]                                    b_valid;
    logic [3: 0][6: 0]                              b_act_id;
    logic [3: 0][`FC1_N_KERNELS - 1: 0][5: 0]       b_neuron_id;     
   
    logic                                           b_kern_valid;
    logic                                           b_weight_we;
    
    logic                                           sch_bp_mode;
    logic                                           bram_bp_mode;
    logic                                           kern_bp_mode;
    logic                                           kern_bp_mode_o;
    
    logic [`FC1_N_KERNELS - 1: 0][`PREC - 1: 0]            kern_mult1;
    logic [`FC1_N_KERNELS - 1: 0][`PREC - 1: 0]            kern_mult2;   
    logic [`FC1_N_KERNELS - 1: 0][`PREC - 1: 0]            weight_grad;
    logic [`FC1_N_KERNELS - 1: 0][`PREC - 1: 0]            weight_grad_o;
    logic [1: 0][9: 0]                              fc1_weight_grad_addr;    
    logic [1: 0][9: 0]                              fc1_weight_grad_addr_offset;
    logic [`FC1_NEURONS - 1: 0]                     act_o_sign;
    logic [`FC1_N_KERNELS - 1: 0][`PREC: 0]            update_weights_sat;
    logic [`FC1_N_KERNELS - 1: 0][`PREC - 1: 0]            update_weights;
  
    logic                                           sch_valid_i;
    
    localparam WEIGHT_MODE = 0;
    localparam NEURON_MODE = 1;   

    always_ff @(posedge clk) begin
        if (rst) begin
            sch_valid       <= 0;
            sch_bp_mode     <= 0;
        end
        else begin
            sch_valid       <= valid_i;
            sch_bp_mode     <= bp_mode;
        end
        sch_activations     <= activations_i;
    end
    
    
    assign sch_valid_i = (forward) ? valid_i : b_valid_i & bp_mode == NEURON_MODE;

    // Scheduler for the fully connected layer
    fc_scheduler #(.ADDR(`FC1_ADDR), .BIAS_ADDR(`FC1_BIAS_ADDR), .MID_PTR_OFFSET(`FC1_MID_PTR_OFFSET), .FAN_IN(`FC1_FAN_IN)) fc1_scheduler_i (
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
            fc1_busy            <= 0;
            bram_bp_mode        <= 0;
        end
        else begin
            bram_activations    <= sch_activations;
            bram_valid          <= sch_valid;
            bram_has_bias       <= sch_has_bias;
            fc1_busy            <= valid_i;
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
    
    
    assign update_done      = update_ptr == 11'd783;
    assign update_addr_a    = update_ptr[10: 1] << 1;
    assign update_addr_b    = update_addr_a + 1'b1;
    assign w_addr_a         = (update) ? update_addr_a  : head_ptr;
    assign w_addr_b         = (update) ? update_addr_b  : mid_ptr;
    assign wg_addr_a        = (update) ? update_addr_a  : fc1_weight_grad_addr[0];
    assign wg_addr_b        = (update) ? update_addr_b  : fc1_weight_grad_addr[1];
    assign w_we             = (update) ? update_ptr[0]  : 1'b0;  // write when odd
    assign wg_we            = (update) ? 1'b0           : b_weight_we; 
    
    bit [4: 0] a,c;
    always_comb begin
        for (a = 0, c =`FC1_PORT_WIDTH; a < `FC1_PORT_WIDTH; a = a + 1, c=c+1) begin
            case(lrate_shifts)                
                5'd7: begin
                    weight_grad[a] = {{7{weight_grad_o[a][`PREC - 1]}}, {weight_grad_o[a][`PREC - 1: 7]}};
                    weight_grad[c] = {{7{weight_grad_o[c][`PREC - 1]}}, {weight_grad_o[c][`PREC - 1: 7]}};     
                end  

                5'd9: begin
                    weight_grad[a] = {{9{weight_grad_o[a][`PREC - 1]}}, {weight_grad_o[a][`PREC - 1: 9]}};
                    weight_grad[c] = {{9{weight_grad_o[c][`PREC - 1]}}, {weight_grad_o[c][`PREC - 1: 9]}};     
                end  
                5'd11: begin
                    weight_grad[a] = {{11{weight_grad_o[a][`PREC - 1]}}, {weight_grad_o[a][`PREC - 1: 11]}};
                    weight_grad[c] = {{11{weight_grad_o[c][`PREC - 1]}}, {weight_grad_o[c][`PREC - 1: 11]}};     
                end      
                5'd13: begin
                    weight_grad[a] = {{13{weight_grad_o[a][`PREC - 1]}}, {weight_grad_o[a][`PREC - 1: 13]}};
                    weight_grad[c] = {{13{weight_grad_o[c][`PREC - 1]}}, {weight_grad_o[c][`PREC - 1: 13]}};     
                end        
                default: begin
                    weight_grad[a] = {{8{weight_grad_o[a][`PREC - 1]}}, {weight_grad_o[a][`PREC - 1: 8]}};
                    weight_grad[c] = {{8{weight_grad_o[c][`PREC - 1]}}, {weight_grad_o[c][`PREC - 1: 8]}}; 
                end  
            endcase
            update_weights_sat[a]   = $signed(data_out_a[a]) - $signed(weight_grad[a]);
            update_weights_sat[c]   = $signed(data_out_b[a]) - $signed(weight_grad[c]);
        end 
    end
    
    bit [7: 0] d;
    always_comb begin
        for (d = 0; d < `FC1_N_KERNELS; d=d+1) begin
            if (update_weights_sat[d][`PREC:`PREC - 1] == 2'b01) begin
                update_weights[d]   = `MAX_VAL;
            end
            else if (update_weights_sat[d][`PREC:`PREC - 1] == 2'b10) begin
                update_weights[d]   = `MIN_VAL;
            end
            else begin
                update_weights[d]   = update_weights_sat[d][`PREC - 1: 0];
            end
        end
    end   
         
    // BRAM for the weights of the fully connected layer
    fc1_weight_bram_controller fc1_weight_bram_controller_i (
        // inputs
        .clk(clk),
        .rst(rst),
        
        .addr_a(w_addr_a),
        .data_in_a(update_weights[7: 0]),
        .en_a(1'b1),
        .we_a(w_we),
        
        .addr_b(w_addr_b),
        .data_in_b(update_weights[15: 8]),
        .en_b(1'b1),
        .we_b(w_we),
        
        // outputs
        .data_out_a(data_out_a),
        .data_out_b(data_out_b),
        .neuron_id(neuron_id)
    ); 
    
    
    /*
    biases_fc1_blk_mem_gen_1 biases_fc1_blk_mem_gen_1_i (
        .addra(bias_ptr),
        .clka(clk),
        .dina(256'b0),
        .douta(bias),
        .ena(1'b1),
        .wea(1'b0)
    );*/
    assign bias = 0;
    assign b_weight_we = &b_kern_valid_o & kern_bp_mode_o == WEIGHT_MODE;
    
    assign fc1_weight_grad_addr_offset[0] = ({6'b0, b_neuron_id[3][0][5:3]} << 6) +
                                            ({6'b0, b_neuron_id[3][0][5:3]} << 5) +
                                            ({6'b0, b_neuron_id[3][0][5:3]} << 1);
    assign fc1_weight_grad_addr_offset[1] = ({6'b0, b_neuron_id[3][8][5:3]} << 6) +
                                            ({6'b0, b_neuron_id[3][8][5:3]} << 5) +
                                            ({6'b0, b_neuron_id[3][8][5:3]} << 1);
    
    assign fc1_weight_grad_addr[0] = fc1_weight_grad_addr_offset[0] + b_act_id[3];
    assign fc1_weight_grad_addr[1] = fc1_weight_grad_addr_offset[1] + b_act_id[3];

    fc1_weight_gradients fc1_weight_gradients_i (
        .addra(wg_addr_a),
        .clka(clk),
        .dina(b_kern_grad_o[7: 0]),
        .douta(weight_grad_o[7: 0]),
        .ena(1'b1),
        .wea(wg_we),
        
        .addrb(wg_addr_b),
        .clkb(clk),
        .dinb(b_kern_grad_o[15:8]),
        .doutb(weight_grad_o[15:8]),
        .enb(1'b1),
        .web(wg_we)
    );  
    
    
    previous_layer_gradient_adder previous_layer_gradient_adder_i (
        // inputs
        .clk(clk),
        .rst(rst),
        .forward(forward),
        .grad_i(b_kern_grad_o),
        .neuron_id_i(b_act_id[3]),
        .valid_i(&b_kern_valid_o),
        .bp_mode_i(kern_bp_mode_o),        
        
        // outputs
        .pl_gradients(pl_gradients),
        .pl_grad_valid(pl_grad_valid)        
    );
    
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
        weights             <= {data_out_b, data_out_a};
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
        for (i = 0; i < `FC1_N_KERNELS; i=i+1) begin
            fc_kernel #(.FAN_IN(`FC1_FAN_IN), .ID_WIDTH(6)) fc_kernel_i (
                // input
                .clk(clk),
                .rst(rst),
                .activation_i(kern_mult2[i]),
                .weight(kern_mult1[i]),
                .bias(18'b0/*kern_bias[i]*/),
                .neuron_id_i(kern_neuron_id[i]),
                .has_bias(kern_has_bias),
                .valid_i(kern_valid),
                .b_valid_i(b_valid[2]),                
                .bp_mode(bp_mode),
                // output
                .b_gradient_o(b_kern_grad_o[i]),
                .b_valid_o(b_kern_valid_o[i]),
                .activation_o(kern_activation_o[i]),
                .neuron_id_o(neuron_id_o[i]),
                .valid_o(valid[i])
            );
        end
    endgenerate
    
    bit [6: 0] b;
    always_ff @(posedge clk) begin
        if (rst) begin
            act_o_sign  <= 0;
        end
        else if (&valid) begin
            for (b = 0; b < `FC1_N_KERNELS; b = b + 1) begin
                act_o_sign[neuron_id_o[b]]   <= kern_activation_o[b][`PREC - 1];
            end
        end
    end
    
    bit [10: 0] j;
    always_comb begin
        for (j = 0; j < `FC1_N_KERNELS; j=j+1) begin
            activation_o[j] = kern_activation_o[j][`PREC - 1] ? 0 : kern_activation_o[j];
        end
    end
    
    assign bp_done = wg_we && wg_addr_a == `FC1_MID_PTR_OFFSET - 1;
    assign valid_act_o = &valid;
    

    bit [5: 0] q;
    // Backward pass logic
    always_ff @(posedge clk) begin
        for (q = 0; q < `FC1_N_KERNELS; q = q + 1) begin
            b_gradient[q]   <= act_o_sign[b_neuron_id_i[q]] ? 0 : b_gradient_i[q];
        end
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
    integer it;
    always_ff @(posedge clk) begin
    /*
        $display("\n--- BACKWARD PASS1 ---");
        $display("INPUT");
        $display("Activation id: %02d\t\tValid: %01b", b_activation_id, b_valid_i);
        $display("Gradient\t\tNeuronID\t\tAct_I");
        for (it = 0; it < `FC1_N_KERNELS; it=it+1) begin
            $display("%04h\t\t\t%01d\t\t\t\t%04h", b_gradient_i[it], b_neuron_id_i[it], b_activation_i[it]) ;
        end
        $display("KERNEL INPUT");
        $display("Activation id: %02d\t\tValid: %01b", b_act_id[2], b_valid[2]);
        $display("KernMult1\t\tKernMult2");
        for (it = 0; it < `FC1_N_KERNELS; it=it+1) begin
            $display("%04h\t\t\t%04h", kern_mult1[it], kern_mult2[it]);
        end        
        $display("OUTPUT");
        $display("Mode: %01b", kern_bp_mode_o);
        $display("Gradient\t\tNeuronID\t\tActID\t\tValid");
        for (it = 0; it < `FC1_N_KERNELS; it=it+1) begin
            $display("%04h\t\t\t%01d\t\t\t\t%02d\t\t\t%01b", b_kern_grad_o[it], b_neuron_id[3][it], 
                    b_act_id[3], b_kern_valid_o[it]);
        end*/
/*        $display("--- GBRAM ---");
        $display("kern_bram_bp_mode_o: %01b", kern_bp_mode_o);
        $display("addr_a: %02d\t\tgrad_a: %04h\t\twe: %01b", fc1_weight_grad_addr[0], b_kern_grad_o[0], b_weight_we);
        $display("addr_b: %02d\t\tgrad_b: %04h\t\twe: %01b", fc1_weight_grad_addr[1], b_kern_grad_o[1], b_weight_we);
*//*
        $display("--- UPDATE1 ---");
        $display("update: %01b", update);
        $display("u_addr_a: %03d\t\tu_addr_b: %03d", update_addr_a, update_addr_b);
        $display("w_addr_a: %03d\t\tw_addr_b: %03d", w_addr_a, w_addr_b);
        $display("wg_addr_a: %03d\t\twg_addr_b: %03d", wg_addr_a, wg_addr_b);
        $display("w_we: %01b\t\twg_we: %01b", w_we, wg_we);
        $display("wr_grad[0]: %04h\t\twr_grad[1]: %04h", b_kern_grad_o[0], b_kern_grad_o[1]);
        $display("data_out[0]: %04h\t\tweight_grad_o[0]: %04h", data_out_a[0], weight_grad_o[0]);
        $display("data_out[1]: %04h\t\tweight_grad_o[1]: %04h", data_out_a[1], weight_grad_o[1]);
        $display("update_weights[0]: %04h", update_weights[0]);
        $display("update_weights[1]: %04h", update_weights[1]);
        */        
        localparam sf = 2.0**-17.0;  
/*
        if (pl_grad_valid) begin
            $display("\n--- NEURON GRADIENTS1 ---");
            $display("pl_grad_valid: %01b", pl_grad_valid);
            for (it = 0; it < `FC0_NEURONS; it=it+1) begin
                $display("%02d:\t%f", it, $itor($signed(pl_gradients[it])) * sf);
            end
        end
        
        if (wg_we) begin
            $display("WEIGHT GRADS1");
            $display("Activation ID: %03d", fc1_weight_grad_addr[0]);
            for (it = 0; it < 8; it=it+1) begin
                $display("%02d: %f", b_neuron_id[3][it], $itor($signed(b_kern_grad_o[it])) * sf);
            end
            $display("Activation ID: %03d", fc1_weight_grad_addr[1]);
            for (it = 8; it < `PREC; it=it+1) begin
                $display("%02d: %f", b_neuron_id[3][it], $itor($signed(b_kern_grad_o[it])) * sf);
            end
        end*/
    /*
        $display("\n--- SCHEDULER ---");
        $display("head_ptr: %04d\t\tmid_ptr: %04d\t\tbias_ptr: %01d", head_ptr, mid_ptr, bias_ptr);
        $display("\n--- MEMORY CONTROLLER ---");
        $display("data_out_a\t\tdata_out_b");
        for (it = 0; it < `FC1_BRAM; it = it + 1) begin
            $display("%04h\t\t\t%04h", data_out_a[it], data_out_b[it]);       
        end
        $display("\nBias");
        for (it = 0; it < `FC1_N_KERNELS; it = it + 1) begin
            $display("%04h", bias[it]);
        end
        
        $display("\nneuron_id");
        for (it = 0; it < `FC1_N_KERNELS / 4; it = it + 1) begin
            $display("%01d\t%01d\t%01d\t%01d", neuron_id[4*it], neuron_id[4*it + 1], neuron_id[4*it + 2], neuron_id[4*it + 3]);       
        end
        $display("\n--- KERNELS---");
        $display("has_bias: %01b", bram_has_bias);
        $display("ACT_I\t\tWEIGHT\t\tBIAS\t\tBRAM_VALID");
        for (it = 0; it < `FC1_N_KERNELS; it=it+1) begin
            $display("%04h\t\t%04h\t\t%04h\t\t\t%01b",
            bram_activations[it], weights[it], bias[it], bram_valid);
        end
            
        $display("\nACT_O\t\tNEURON_ID_O\t\tVALID_ACT_O");
        for (it = 0; it < `FC1_N_KERNELS; it=it+1) begin
            $display("%04h\t\t%02d\t\t\t\t%01b",
            activation_o[it], neuron_id_o[it], valid_act_o);
        end  */      
     end
    `endif

endmodule
