`timescale 1ns / 1ps


module fc1_scheduler_tb(

    );
    
    logic clock;
    logic reset;
    logic forward;
    logic has_bias;
    
    logic   [`FC1_N_KERNELS - 1: 0]         valid_i;
    
    logic   [`FC1_ADDR - 1: 0]              head_ptr;
    logic   [`FC1_ADDR - 1: 0]              mid_ptr;
    logic   [`FC1_BIAS_ADDR - 1: 0]         bias_ptr;   
    
    
    
    
    fc_scheduler #(.ADDR(`FC1_ADDR), .BIAS_ADDR(`FC1_BIAS_ADDR), .MID_PTR_OFFSET(`FC1_MID_PTR_OFFSET), .FAN_IN(`FC1_FAN_IN)) fc1_scheduler_i (
        .clk(clock),
        .rst(reset),
        .forward(forward),
        .valid_i(&valid_i),   

        .head_ptr(head_ptr),
        .mid_ptr(mid_ptr),
        .bias_ptr(bias_ptr),
        .has_bias(has_bias)
    );
    
    always begin
		#5 clock = ~clock;
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

	end
	
	

endmodule
