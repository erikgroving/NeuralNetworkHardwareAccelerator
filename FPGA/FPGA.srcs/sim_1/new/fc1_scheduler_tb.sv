`timescale 1ns / 1ps


module fc1_scheduler_tb(

    );
    
    logic clock;
    logic reset;
    logic forward;
    
    logic           [`FC1_KERNEL_SIZE - 1: 0]                       valid_i;
    logic           [`FC1_KERNEL_SIZE - 1: 0][15: 0]                act_i;
    
    logic    [`FC1_WEIGHT_BRAM - 1: 0][`FC1_ADDR - 1: 0]     head_ptrs;
    logic    [`FC1_WEIGHT_BRAM - 1: 0][`FC1_ADDR - 1: 0]     mid_ptrs;
    logic    [`FC1_KERNEL_SIZE - 1: 0][15: 0]                act_o;
    logic    [`FC1_KERNEL_SIZE - 1: 0]                       valid_o;
    
    
    
    
    fc1_scheduler fc1_scheduler_i (
        .clk(clock),
        .rst(reset),
        .forward(forward),
        .valid_i(valid_i),
        .act_i(act_i),
        

        .head_ptrs(head_ptrs),
        .mid_ptrs(mid_ptrs),
        .act_o(act_o),
        .valid_o(valid_o)
    );
    
    always begin
		#5 clock = ~clock;
	end
	
	integer i;
	
	initial begin
	   clock = 1'b0;
	   reset = 1'b1;
	   forward = 1'b1;
	   valid_i = 0;
	   @(negedge clock);
	   reset = 1'b1;
	   @(negedge clock);
	   reset = 1'b0;
	   act_i[0] = 16'b1;
	   act_i[1] = 16'b10;
	   act_i[2] = 16'b11;
	   act_i[3] = 16'b100;
	   act_i[4] = 16'b101;
	   act_i[5] = 16'b110;
	   act_i[6] = 16'b111;
	   act_i[7] = 16'b1000;
	   
	   valid_i = 8'b0;
	   @(negedge clock);
	   valid_i = 8'b1;
	   
	   for (i = 0; i < 8; i=i+1) begin
	       @(negedge clock);
	       valid_i = {valid_i[6:0], 1'b1};	       
	   end
	end
	
	

endmodule
