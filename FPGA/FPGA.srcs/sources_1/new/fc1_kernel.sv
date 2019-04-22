`timescale 1ns / 1ps
`include "sys_defs.vh"

/* 8 stage addition kernel */
module fc1_kernel(
    input                                           clk,
    input                                           rst,
    input   [`FC1_KERNEL_SIZE - 1: 0]  [15: 0]      in_act,         
    input   [`FC1_KERNEL_SIZE - 1: 0]  [15: 0]      weights,
    input   [`FC1_KERNEL_SIZE - 1: 0]               bias,
    output logic    [15: 0]                         activation_o
);
    
    logic [`FC1_KERNEL_SIZE - 1: 0][15: 0]     inter_mac;
    
    
    logic [`FC1_KERNEL_SIZE - 1: 0][15: 0]     sum;
    
    
    assign sum = {inter_mac[`FC1_KERNEL_SIZE - 2: 0], bias};
    assign activation_o = inter_mac[`FC1_KERNEL_SIZE - 1];
   
    genvar i;    
    generate 
		for (i = 0; i < `FC1_KERNEL_SIZE; i=i+1) begin
            // A*B + C
            sixteen_bit_MAC_dsp dsp_i(
                        .CLK(clk), 
                        .A(weights[i]),
                        .B(in_act[i]),
                        .C(sum[i]),
                        .P(inter_mac[i])
            );
		end	
	endgenerate

    
endmodule
