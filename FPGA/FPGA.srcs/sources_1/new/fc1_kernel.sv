`timescale 1ns / 1ps

/* 8 stage addition kernel */
module fc1_kernel(
    input                       clk,
    input                       rst,
    input   [7: 0]  [15: 0]     in_act,         
    input   [7: 0]  [15: 0]     weights,
    input   [15: 0]             bias,
    output logic    [15: 0]     activation
);
    
    logic [7: 0][15: 0]     inter_mac;
    
    
    logic [7: 0][15: 0]     biases;
    logic [7: 0][15: 0]     dsp_in;
    
    always_comb begin
        biases = { {7{16'b0}}, bias};
        dsp_in = {inter_mac[6: 0], 16'b0};
    end 
    
    genvar i;    
    generate 
		for (i = 0; i < 8; i=i+1) begin
           sixteen_bit_MAC_dsp(
                        .CLK(clk), 
                        .A(),
                        .B(biases[i]),
                        .C(weights[i]),
                        .P(inter_mac[i])
            );			
		end	
	endgenerate

    
endmodule
