`timescale 1ns / 1ps
`include "sys_defs.vh"

module fc1_layer(
        input                                       clk,
        input                                       rst,
        input                                       forward,
        input  [`FC1_N_KERNELS - 1: 0][15: 0]       activations_i,
        input  [`FC1_N_KERNELS - 1: 0]              valid_i,        
        
        output logic [`FC1_N_KERNELS - 1: 0][15: 0] activation_o,
        output logic [`FC1_N_KERNELS - 1: 0][4: 0]  neuron_id_o,
        output logic [`FC1_N_KERNELS - 1: 0]        valid_act_o
    );
    
    logic   [`FC1_BRAM - 1: 0][15: 0]               data_in_a;
    logic   [`FC1_BRAM - 1: 0][15: 0]               data_in_b;
    logic   [`FC1_BRAM - 1: 0][15: 0]               data_out_a;
    logic   [`FC1_BRAM - 1: 0][15: 0]               data_out_b;

    logic   [`FC1_N_KERNELS - 1: 0][15: 0]          weights;
    logic   [`FC1_ADDR - 1: 0]                      head_ptr;
    logic   [`FC1_ADDR - 1: 0]                      mid_ptr;
    logic   [`FC1_BIAS_ADDR - 1: 0]                 bias_ptr;
   
    logic   [`FC1_N_KERNELS - 1: 0][15: 0]          sch_activations;
    logic   [`FC1_N_KERNELS - 1: 0]                 sch_valid;
    logic   [`FC1_N_KERNELS - 1: 0][15: 0]          bram_activations;
    logic   [`FC1_N_KERNELS - 1: 0]                 bram_valid;
    
    logic   [`FC1_N_KERNELS - 1: 0][15: 0]          bias;
    logic   [255: 0]                                bias_container;
    logic                                           sch_has_bias;
    logic                                           bram_has_bias;
    logic   [`FC1_N_KERNELS - 1: 0][4: 0]           neuron_id;
    logic   [`FC1_N_KERNELS - 1: 0]                 last_weight;

    
    assign weights = {data_out_b, data_out_a};    
    
    `ifdef DEBUG
     integer clk_cycle;
     integer it;

     always_ff @(posedge clk) begin
        if (rst) begin
            clk_cycle   <= 0;
        end
        else begin
            clk_cycle   <=  clk_cycle + 1'b1;
        end
        $display("\n\n------ CYCLE %04d ------", clk_cycle);
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
            bram_activations[it], weights[it], bias[it], bram_valid[it]);
        end
            
        $display("\nACT_O\t\tNEURON_ID_O\t\tVALID_ACT_O");
        for (it = 0; it < `FC1_N_KERNELS; it=it+1) begin
            $display("%04h\t\t%02d\t\t\t\t%01b",
            activation_o[it], neuron_id_o[it], valid_act_o[it]);
        end        
     end
    `endif

    
    always_ff @(posedge clk) begin
        if (rst) begin
            sch_activations <= 0;
            sch_valid       <= 0;
        end
        else begin
            sch_activations <= activations_i;
            sch_valid       <= valid_i;
        end
    end

    // Scheduler for the fully connected layer
    fc_scheduler #(.ADDR(`FC1_ADDR), .BIAS_ADDR(`FC1_BIAS_ADDR), .MID_PTR_OFFSET(`FC1_MID_PTR_OFFSET), .FAN_IN(`FC1_FAN_IN)) fc1_scheduler_i (
        //inputs
        .clk(clk),
        .rst(rst),
        .forward(forward),
        .valid_i(&valid_i),
        
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
        end
        else begin
            bram_activations    <= sch_activations;
            bram_valid          <= sch_valid;
            bram_has_bias       <= sch_has_bias;
        end
    end
    
    // BRAM for the weights of the fully connected layer
    fc1_weight_bram_controller fc1_weight_bram_controller_i (
        // inputs
        .clk(clk),
        .rst(rst),
        
        .addr_a(head_ptr),
        .data_in_a(),
        .en_a(1'b1),
        .we_a(~forward),
        
        .addr_b(mid_ptr),
        .data_in_b(),
        .en_b(1'b1),
        .we_b(~forward),
        
        // outputs
        .data_out_a(data_out_a),
        .data_out_b(data_out_b),
        .neuron_id(neuron_id)
    ); 
    
    
    biases_fc1_blk_mem_gen_1 biases_fc1_blk_mem_gen_1_i (
        .addra(bias_ptr),
        .clka(clk),
        .dina(),
        .douta(bias),
        .ena(1'b1),
        .wea(1'b0)
    );


    
    
    // Computational kernel for the fully connected layer    
    genvar i;
    generate
        for (i = 0; i < `FC1_N_KERNELS; i=i+1) begin
            fc_kernel #(.FAN_IN(`FC1_FAN_IN), .ID_WIDTH(5)) fc_kernel_i (
                // input
                .clk(clk),
                .rst(rst),
                .activation_i(bram_activations[i]),
                .weight(weights[i]),
                .bias(bias[i]),
                .neuron_id_i(neuron_id[i]),
                .has_bias(bram_has_bias),
                .valid_i(bram_valid[i]),
                // output
                .activation_o(activation_o[i]),
                .neuron_id_o(neuron_id_o[i]),
                .valid_o(valid_act_o[i])
            );
        end
    endgenerate    

endmodule
