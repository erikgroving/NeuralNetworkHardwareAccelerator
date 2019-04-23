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
    
    logic   [(2 * `FC1_KERNEL_SIZE) - 1: 0][`FC1_ADDR - 1: 0]          addrs_o;
    logic   [`FC1_WEIGHT_BRAM - 1: 0][`FC1_ADDR - 1: 0]                addrs_a;
    logic   [`FC1_WEIGHT_BRAM - 1: 0][`FC1_ADDR - 1: 0]                addrs_b;
    logic   [`FC1_WEIGHT_BRAM - 1: 0][15: 0]                           data_in_a;
    logic   [`FC1_WEIGHT_BRAM - 1: 0][15: 0]                           data_in_b;
    logic   [`FC1_WEIGHT_BRAM - 1: 0][15: 0]                           data_out_a;
    logic   [`FC1_WEIGHT_BRAM - 1: 0][15: 0]                           data_out_b;
        
        
    logic   [`FC1_N_KERNELS - 1: 0][`FC1_KERNEL_SIZE - 1: 0][15: 0]    activations_i_reg;    
    logic   [`FC1_N_KERNELS - 1: 0][`FC1_KERNEL_SIZE - 1: 0][15: 0]    weights;
    logic   [`FC1_N_KERNELS - 1: 0][15: 0]                             bias;
    logic   [`FC1_N_KERNELS - 1: 0]                                    has_bias;
    logic                                                              forward;
    
    assign forward = 1'b1;    
    assign bias = data_out_a[0];
    assign weights = { data_out_b, data_out_a };
    
    
    
    
    always_ff @(posedge clk) begin
        if (rst) begin
            activations_i_reg <= 0;
        end
        else begin
            activations_i_reg <= activations_i;
        end
    end
 
    
    
    // Scheduler for the fully connected layer
    fc1_scheduler fc1_scheduler_i (
        //inputs
        .clk(clk),
        .rst(rst),
        .valid_i(valid_i),
        .forward(forward),
        // outputs
        .has_bias(has_bias),
        .activations_used(activations_used),
        .addrs_o(addrs_o)
    );
    
    
    genvar i;
    generate
        for (i = 0; i < `FC1_N_KERNELS; i=i+1) begin
            // Computational kernel for the fully connected layer
            fc1_kernel fc1_kernel_i (
                // input
                .clk(clk),
                .rst(rst),
                .activations_i(activations_i_reg[i]),
                .weights(weights[i]),
                .bias(bias[i]),
                .has_bias(has_bias[i]),
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
        
        .addrs_a(addrs_a),
        .data_in_a(),
        .en_a(1'b1),
        .we_a(~forward),
        
        .addrs_b(addrs_b),
        .data_in_b(),
        .en_b(1'b1),
        .we_b(~forward),
        
        // outputs
        .data_out_a(data_out_a),
        .data_out_b(data_out_b)
    ); 
    
    
    
    
endmodule
