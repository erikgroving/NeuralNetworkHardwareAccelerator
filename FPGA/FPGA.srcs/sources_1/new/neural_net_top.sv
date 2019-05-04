`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/08 16:27:18
// Design Name: 
// Module Name: neural_net_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module neural_net_top(
    input                   clk,
    input                   reset,
    output  logic [7: 0]    led_o
    );

    logic [`FC1_N_KERNELS - 1: 0][15: 0] activation_o;

    // FC1
   
    fc1_layer fc1_layer_i (
        // inputs
        .clk(clk),
        .rst(reset),    
        .forward(1'b1), 
        .activations_i({`FC1_N_KERNELS{16'b1010101101}}),
        .valid_i(`FC1_N_KERNELS'b1),
        
        // outputs
        .activation_o(activation_o),
        .neuron_id_o(),
        .valid_act_o()    
    );

    always_comb begin
        led_o[7:0] = activation_o[0][7:0];
    end
    
    
endmodule
