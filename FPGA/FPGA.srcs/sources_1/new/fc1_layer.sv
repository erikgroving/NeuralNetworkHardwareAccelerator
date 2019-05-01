`timescale 1ns / 1ps

module fc1_layer(
        input                                                                   clk,
        input                                                                   rst,
       
        input  [`FC1_N_KERNELS - 1: 0][`FC1_KERNEL_SIZE - 1: 0][15: 0]          activations_i,
        input  [`FC1_N_KERNELS - 1: 0][`FC1_KERNEL_SIZE - 1: 0]                 valid_i,
        
        
        output logic [`FC1_KERNEL_SIZE - 1: 0]                                  activations_used,
        output logic [`FC1_N_KERNELS - 1: 0][15: 0]                             activation_o,
        output logic                                                            valid_act_o
    );
    
    logic   [`FC1_WEIGHT_BRAM - 1: 0][15: 0]                                    data_in_a;
    logic   [`FC1_WEIGHT_BRAM - 1: 0][15: 0]                                    data_in_b;
    logic   [`FC1_N_KERNELS - 1: 0][`FC1_WEIGHT_BRAM - 1: 0][15: 0]             data_out_a;
    logic   [`FC1_N_KERNELS - 1: 0][`FC1_WEIGHT_BRAM - 1: 0][15: 0]             data_out_b;

    logic   [`FC1_N_KERNELS - 1: 0][`FC1_KERNEL_SIZE - 1: 0][15: 0]             weights;
    logic   [`FC1_N_KERNELS - 1: 0][`FC1_KERNEL_SIZE - 1: 0][`FC1_ADDR - 1: 0]  head_ptrs;
    logic   [`FC1_N_KERNELS - 1: 0][`FC1_KERNEL_SIZE - 1: 0][`FC1_ADDR - 1: 0]  mid_ptrs;
    logic   [`FC1_N_KERNELS - 1: 0][`FC1_KERNEL_SIZE - 1: 0][15: 0]             sch_activations;
    logic   [`FC1_N_KERNELS - 1: 0][`FC1_KERNEL_SIZE - 1: 0]                    sch_valid;
    
    logic   [`FC1_N_KERNELS - 1: 0][15: 0]                                      bias;
    logic                                                                       forward;

    
    assign forward = 1'b1;
    
    bit [`FC1_N_KERNELS - 1: 0] k;
    always_comb begin
        for (k = 0; k < `FC1_N_KERNELS; k=k+1) begin
            weights[k] = {data_out_b[k], data_out_a[k]};
        end
    end

    // Scheduler for the fully connected layer
    genvar j;
    generate
        for (j = 0; j < `FC1_N_KERNELS; j=j+1) begin
            fc1_scheduler fc1_scheduler_i (
                //inputs
                .clk(clk),
                .rst(rst),
                .forward(forward),
                .valid_i(valid_i[j]),
                .act_i(activations_i[j]),
                
                //outputs
                .head_ptrs(head_ptrs[j]),
                .mid_ptrs(mid_ptrs[j]),
                .act_o(sch_activations[j]),
                .valid_o(sch_valid[j])
            );
        end
    endgenerate
    

    logic   [`FC1_N_KERNELS - 1: 0][`FC1_KERNEL_SIZE - 1: 0][15: 0]             bram_activations;
    logic   [`FC1_N_KERNELS - 1: 0][`FC1_KERNEL_SIZE - 1: 0]                    bram_valid;
    always_ff @(posedge clk) begin
        if (rst) begin
            bram_activations    <= 0;
            bram_valid          <= 0;
        end
        else begin
            bram_activations    <= sch_activations;
            bram_valid          <= sch_valid;
        end
    end
    
    // BRAM for the weights of the fully connected layer
    fc1_weight_bram_controller fc1_weight_bram_controller_i (
        // inputs
        .clk(clk),
        .rst(rst),
        
        .addrs_a({head_ptrs[1], head_ptrs[0]}),
        .data_in_a(),
        .en_a(1'b1),
        .we_a(~forward),
        
        .addrs_b({mid_ptrs[1], mid_ptrs[0]}),
        .data_in_b(),
        .en_b(1'b1),
        .we_b(~forward),
        
        // outputs
        .data_out_a({data_out_a[1], data_out_a[0]}),
        .data_out_b({data_out_b[1], data_out_b[0]})
    ); 
    
    
    
    biases_fc1_blk_mem_gen_1 biases_fc1_blk_mem_gen_1_i (
        .addra(),
        .clka(clk),
        .dina(),
        .douta(bias[0]),
        .ena(1'b1),
        .wea(1'b0),
        
        .addrb(),
        .clkb(clk),
        .dinb(),
        .doutb(bias[1]),
        .enb(1'b1),
        .web(1'b0)   
    );
    
    
    // Computational kernel for the fully connected layer    
    genvar i;
    generate
        for (i = 0; i < `FC1_N_KERNELS; i=i+1) begin
            fc1_kernel fc1_kernel_i (
                // input
                .clk(clk),
                .rst(rst),
                .activations_i(),
                .weights(),
                .bias(),
                .has_bias(),
                .valid_i(),
                // output
                .activation_o()
            );
        end
    endgenerate    
endmodule
