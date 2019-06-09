`timescale 1ns / 1ps

module softmax_tb(

    );
    
    logic                               clock;
    logic                               reset;    
    logic                               start;
    logic [15: 0]                       max;
    logic [`FC2_NEURONS - 1: 0][15: 0]  act_in;
    
    logic valid_o;
    logic [`FC2_NEURONS - 1: 0][15: 0]  grad_o;
    
    
    assign act_in = {
        16'h1234,
        16'h0735,
        16'hdf28,
        16'hf801,
        16'hf206,
        16'h1842,
        16'h1842,
        16'h2182,
        16'h0321,
        16'h0a18    
    };
    
    assign max = 16'h2182;
    
    softmax softmax_i (
        .clk(clock),
        .reset(reset),
        .start(start),
        .max(max),
        .act_in(act_in),
        
        .valid_o(),
        .grad_o()
       
    );
  
    always begin
        #5
        clock = ~clock;
    end
    
    initial begin
        clock = 1'b0;
        reset = 1'b1;
        @(negedge clock);
        reset = 1'b1;
        @(negedge clock);
        reset = 1'b0;
        @(negedge clock);
        @(negedge clock);
        start = 1'b1;
        @(negedge clock);
        start = 1'b0;
        
        
        #100000;
        $finish;
	end
endmodule
