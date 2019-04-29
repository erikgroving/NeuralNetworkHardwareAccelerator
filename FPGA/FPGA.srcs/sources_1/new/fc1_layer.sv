`timescale 1ns / 1ps

module fc1_layer(
        input                                                           clk,
        input                                                           rst,
       
        input  [`FC1_N_KERNELS - 1: 0][`FC1_KERNEL_SIZE - 1: 0][15: 0]  activations_i,
        input                                                           valid_i,
        
        
        output logic [`FC1_KERNEL_SIZE - 1: 0]                          activations_used,
        output logic [`FC1_N_KERNELS - 1: 0][15: 0]                     activation_o,
        output logic                                                    valid_o
    );
    
    logic   [`FC1_WEIGHT_BRAM - 1: 0][15: 0]                            data_in_a;
    logic   [`FC1_WEIGHT_BRAM - 1: 0][15: 0]                            data_in_b;
    logic   [`FC1_WEIGHT_BRAM - 1: 0][15: 0]                            data_out_a;
    logic   [`FC1_WEIGHT_BRAM - 1: 0][15: 0]                            data_out_b;
        
        
    logic   [`FC1_N_KERNELS - 1: 0][`FC1_KERNEL_SIZE - 1: 0][15: 0]     activations_i_reg;    
    logic   [`FC1_N_KERNELS - 1: 0][`FC1_KERNEL_SIZE - 1: 0][15: 0]     activations_i_reg2;    
    logic   [`FC1_N_KERNELS - 1: 0][`FC1_KERNEL_SIZE - 1: 0][15: 0]     weights;
    logic   [`FC1_N_KERNELS - 1: 0][15: 0]                              bias;
    logic                                                               forward;
    
    logic                                                               bias_o;
    logic                                                               bias_o_r;
    logic  [`FC1_BIAS_ADDR - 1: 0]                                      bias_ptr;
    logic  [`FC1_ADDR - 1: 0]                                           head_ptr;
    logic  [`FC1_ADDR - 1: 0]                                           mid_ptr;
    
    assign forward = 1'b1;    
    assign weights = { data_out_b, data_out_a };
    
    
    
    
    always_ff @(posedge clk) begin
        if (rst) begin
            activations_i_reg   <= 0;
            activations_i_reg2  <= 0;
            bias_o_r            <= 0;
        end
        else begin
            activations_i_reg   <= activations_i;
            activations_i_reg2  <= activations_i_reg;
            bias_o_r            <= bias_o;
        end
    end
 
    
    
    // Scheduler for the fully connected layer
    fc1_scheduler fc1_scheduler_i (
        //inputs
        .clk(clk),
        .rst(rst),
        .forward(forward),
        .activation_rdy(valid_i),
        // outputs
        .bias_o(bias_o),
        .bias_ptr(bias_ptr),
        .head_ptr(head_ptr),
        .mid_ptr(mid_ptr)
    );
    
    
    genvar i;
    generate
        for (i = 0; i < `FC1_N_KERNELS; i=i+1) begin
            // Computational kernel for the fully connected layer
            fc1_kernel fc1_kernel_i (
                // input
                .clk(clk),
                .rst(rst),
                .activations_i(activations_i_reg2[i]),
                .weights(weights[i]),
                .bias(bias[i]),
                .has_bias(bias_o_r),
                // output
                .activation_o(activation_o[i])
            );
        end
    endgenerate
    
    
    // BRAM for the weights of the fully connected layer
    fc1_weight_bram_controller fc1_weight_bram_controller_i (
        // inputs
        .clk(clk),
        .rst(rst),
        
        .addrs_a(head_ptr),
        .data_in_a(),
        .en_a(1'b1),
        .we_a(~forward),
        
        .addrs_b(mid_ptr),
        .data_in_b(),
        .en_b(1'b1),
        .we_b(~forward),
        
        // outputs
        .data_out_a(data_out_a),
        .data_out_b(data_out_b)
    ); 
    
    
    
    biases_fc1_blk_mem_gen_1 biases_fc1_blk_mem_gen_1_i (
        .addra(bias_ptr),
        .clka(clk),
        .dina(),
        .douta(bias[0]),
        .ena(1'b1),
        .wea(1'b0),
        
        .addrb(bias_ptr + 1'b1),
        .clkb(clk),
        .dinb(),
        .doutb(bias[1]),
        .enb(1'b1),
        .web(1'b0)   
    );
    
    
endmodule
