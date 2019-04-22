`timescale 1ns / 1ps

module fc1_layer(
        input                                       clk,
        input                                       rst,
        
        input   [`FC1_KERNEL_SIZE - 1: 0][15: 0]    input_activations
    );
    
    logic   [`FC1_KERNEL_SIZE - 1: 0][15: 0]    addrs_a;
    logic   [`FC1_KERNEL_SIZE - 1: 0][15: 0]    addrs_b;
    logic   [`FC1_KERNEL_SIZE - 1: 0][15: 0]    data_in_a;
    logic   [`FC1_KERNEL_SIZE - 1: 0][15: 0]    data_in_b;
    logic   [`FC1_KERNEL_SIZE - 1: 0][15: 0]    data_out_a;
    logic   [`FC1_KERNEL_SIZE - 1: 0][15: 0]    data_out_b;
    
    
    logic   [`FC1_KERNEL_SIZE - 1: 0][15: 0]    weights;
    
    
    
    assign weights = { data_out_b, data_out_a };
    
    
    
    fc1_scheduler fc1_scheduler_i (
        
        // outputs
        
    );
    
    fc1_kernel fc1_kernel_i (
        .clk(clk),
        .rst(rst),
        .in_act(input_activations),
        .weights(weights),
        .bias(),
        .activation_o()
    );
    
    fc1_weight_bram_controller fc1_weight_bram_controller_i (
        // inputs
        .clk(clk),
        .rst(rst),
        
        .addrs_a(addrs_a),
        .data_in_a(),
        .en_a(1'b1),
        .we_a(1'b0),
        
        .addrs_b(addrs_b),
        .data_in_b(),
        .en_b(1'b1),
        .we_b(1'b0),
        
        // outputs
        .data_out_a(data_out_a),
        .data_out_b(data_out_b)
    ); 
    
endmodule
