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
    
    
    logic [31: 0] cntr;
    
    always_ff @(posedge clk) begin
        if (reset) begin
            cntr <= 28'b0;
        end
        else begin
            cntr <= cntr + 1'b1;
        end
    end
    

    always_comb begin
        led_o[7:0] = cntr[31:24];
    end
    
    
endmodule
