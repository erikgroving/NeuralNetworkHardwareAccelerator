`timescale 1ns / 1ps
`include "sys_defs.vh"
module fc1_layer_tb(

    );
    
    logic clock;
    logic reset;
    logic forward;
    
    logic  [`FC1_N_KERNELS - 1: 0][15: 0]        activations_i;
    logic  [`FC1_N_KERNELS - 1: 0]               valid_i;
    logic  [`FC1_N_KERNELS - 1: 0][15: 0]        activation_o;
    logic  [`FC1_N_KERNELS - 1: 0][4: 0]         neuron_id_o;
    logic  [`FC1_N_KERNELS - 1: 0]               valid_act_o;
    
   
   
   
    fc1_layer fc1_layer_i (
        // inputs
        .clk(clock),
        .rst(reset),    
        .forward(forward), 
        .activations_i(activations_i),
        .valid_i(valid_i),
        
        // outputs
        .activation_o(activation_o),
        .neuron_id_o(neuron_id_o),
        .valid_act_o(valid_act_o)    
    );
    
    always begin
        #5
        clock = ~clock;
    end
    
    initial begin
        clock = 1'b0;
        reset = 1'b1;
        forward = 1'b1;
        valid_i = 0;
        @(negedge clock);
        reset = 1'b1;
        @(negedge clock);
        reset = 1'b0;
	    valid_i = {`FC1_N_KERNELS{1'b1}};
	    activations_i = {`FC1_N_KERNELS{16'h2000}};
        
        #100000;
        $finish;
	end
endmodule
