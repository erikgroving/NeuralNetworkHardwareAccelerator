`timescale 1ns / 1ps

module fc2_layer(
        input                                       clk,
        input                                       rst,
        input                                       forward,
        input  [`FC2_N_KERNELS - 1: 0][15: 0]       activations_i,
        input  [`FC2_N_KERNELS - 1: 0]              valid_i,        
        
        output logic [`FC2_N_KERNELS - 1: 0][15: 0] activation_o,
        output logic [`FC2_N_KERNELS - 1: 0][4: 0]  neuron_id_o,
        output logic [`FC2_N_KERNELS - 1: 0]        valid_act_o
    );
    
    
endmodule
