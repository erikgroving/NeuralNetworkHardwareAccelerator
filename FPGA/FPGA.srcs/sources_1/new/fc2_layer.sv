`timescale 1ns / 1ps

module fc2_layer(
        input                                       clk,
        input                                       rst,
        input                                       forward,
        input  [`FC2_N_KERNELS - 1: 0][15: 0]       activations_i,
        input                                       valid_i,        
        
        output logic [`FC2_N_KERNELS - 1: 0][15: 0] activation_o,
        output logic [`FC2_N_KERNELS - 1: 0][3: 0]  neuron_id_o,
        output logic                                valid_act_o
    );
    
    logic   [`FC2_BRAM - 1: 0][15: 0]               data_in_a;
    logic   [`FC2_BRAM - 1: 0][15: 0]               data_out_a;

    logic   [`FC2_N_KERNELS - 1: 0][15: 0]          weights;
    logic   [`FC2_ADDR - 1: 0]                      head_ptr;
    logic   [`FC2_ADDR - 1: 0]                      mid_ptr;
    logic   [`FC2_BIAS_ADDR - 1: 0]                 bias_ptr;
   
    logic   [`FC2_N_KERNELS - 1: 0][15: 0]          sch_activations;
    logic                                           sch_valid;
    logic   [`FC2_N_KERNELS - 1: 0][15: 0]          bram_activations;
    logic                                           bram_valid;
    
    logic   [`FC2_N_KERNELS - 1: 0][15: 0]          bias;
    logic                                           sch_has_bias;
    logic                                           bram_has_bias;
    logic   [`FC2_N_KERNELS - 1: 0][3: 0]           neuron_id;
    logic   [`FC2_N_KERNELS - 1: 0]                 last_weight;
    
    
    logic   [`FC2_N_KERNELS - 1: 0]                 valid;

    
    assign weights = data_out_a;    
    
    
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
    fc_scheduler #(.ADDR(`FC2_ADDR), .BIAS_ADDR(`FC2_BIAS_ADDR), .MID_PTR_OFFSET(`FC2_MID_PTR_OFFSET), .FAN_IN(`FC2_FAN_IN)) fc2_scheduler_i (
        //inputs
        .clk(clk),
        .rst(rst),
        .forward(forward),
        .valid_i(valid_i),
        
        //outputs
        .head_ptr(head_ptr),
        .mid_ptr(mid_ptr),      // not used in fc2
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
    fc2_weight_bram_controller fc2_weight_bram_controller_i (
        // inputs
        .clk(clk),
        .rst(rst),
        
        .addr_a(head_ptr),
        .data_in_a(0),
        .en_a(1'b1),
        .we_a(~forward),

        
        // outputs
        .data_out_a(data_out_a),
        .neuron_id(neuron_id)
    ); 
    
    
    biases_fc2_blk_mem biases_fc2_blk_mem_i (
        .addra(bias_ptr),
        .clka(clk),
        .dina(0),
        .douta(bias[0]),
        .ena(1'b1),
        .wea(1'b0)
    );

    `ifdef DEBUG
    integer it;
    always_ff @(posedge clk) begin
        $display("\n--- SCHEDULER ---");
        $display("head_ptr: %04d\t\tmid_ptr: %04d\t\tbias_ptr: %01d", head_ptr, mid_ptr, bias_ptr);
        $display("\n--- MEMORY CONTROLLER ---");
        $display("data_out_a\t");
        for (it = 0; it < `FC2_BRAM; it = it + 1) begin
            $display("%04h", data_out_a[it]);       
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
        end        
     end
    `endif

    
    
    // Computational kernel for the fully connected layer    
    genvar i;
    generate
        for (i = 0; i < `FC2_N_KERNELS; i=i+1) begin
            fc_kernel #(.FAN_IN(`FC2_FAN_IN), .ID_WIDTH(4)) fc_kernel_i (
                // input
                .clk(clk),
                .rst(rst),
                .activation_i(bram_activations[i]),
                .weight(weights[i]),
                .bias(bias[i]),
                .neuron_id_i(neuron_id[i]),
                .has_bias(bram_has_bias),
                .valid_i(bram_valid),
                // output
                .activation_o(activation_o[i]),
                .neuron_id_o(neuron_id_o[i]),
                .valid_o(valid)
            );
        end
    endgenerate    
     
    assign valid_act_o = &valid;
   
    
endmodule
