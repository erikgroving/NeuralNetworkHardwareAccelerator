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


    // FC1
    fc1_layer fc1_layer_i (
        .clk(clk),
        .rst(reset)
    );

    always_comb begin
        led_o[7:0] = 8'hA3;
    end
    
    
endmodule
