`timescale 1ns / 1ps


module fc1_scheduler_tb(

    );
    
    logic clock;
    logic activation_rdy;
    logic reset;
    logic forward;
    
    logic                               bias_o;
    logic    [`FC1_BIAS_ADDR - 1: 0]    bias_ptr;
    logic    [`FC1_ADDR - 1: 0]         head_ptr;
    logic    [`FC1_ADDR - 1: 0]         mid_ptr;
    
    
    
    
    fc1_scheduler fc1_scheduler_i (
        .clk(clock),
        .rst(reset),
        .forward(forward),
        .activation_rdy(activation_rdy),
        
        .bias_o(bias_o),
        .bias_ptr(bias_ptr),
        .head_ptr(head_ptr),
        .mid_ptr(mid_ptr)
    );
    
    always begin
		#5 clock = ~clock;
	end
	
	initial begin
	   clock = 1'b0;
	   reset = 1'b1;
	   activation_rdy = 1'b1;
	   forward = 1'b1;
	   @(negedge clock);
	   reset = 1'b1;
	   @(negedge clock);
	   reset = 1'b0;
	end
	
	

endmodule
