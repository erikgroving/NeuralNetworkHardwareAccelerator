`timescale 1ns / 1ps
`include "sys_defs.vh"

/* 8 stage addition kernel */
module fc1_kernel(
    input                                           clk,
    input                                           rst,
    input   [`FC1_KERNEL_SIZE - 1: 0]  [15: 0]      activations_i,         
    input   [`FC1_KERNEL_SIZE - 1: 0]  [15: 0]      weights,
    input   [`FC1_KERNEL_SIZE - 1: 0]               bias,
    input                                           has_bias,
    output logic    [15: 0]                         activation_o
);
    
    logic [`FC1_KERNEL_SIZE - 1: 0][15: 0]     inter_mac;
    
    
    logic [`FC1_KERNEL_SIZE - 1: 0][15: 0]     sum;
    
    logic [15: 0]   kernel_in;
    
    assign kernel_in = has_bias ? bias : activation_o;
    assign sum = {inter_mac[`FC1_KERNEL_SIZE - 2: 0], kernel_in};
    assign activation_o = inter_mac[`FC1_KERNEL_SIZE - 1];
   
    genvar i;    
    generate 
		for (i = 0; i < `FC1_KERNEL_SIZE; i=i+1) begin
            // A*B + C
            sixteen_bit_MAC_dsp dsp_i(
                        .CLK(clk), 
                        .A(weights[i]),
                        .B(activations_i[i]),
                        .C(sum[i]),
                        .P(inter_mac[i])
            );
		end	
	endgenerate

    
endmodule
