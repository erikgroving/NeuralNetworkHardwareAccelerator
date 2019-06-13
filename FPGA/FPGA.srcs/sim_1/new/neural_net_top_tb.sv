`timescale 1ns / 1ps

module neural_net_top_tb(
    );
    
    logic clock;
    logic reset;
    
    neural_net_top neural_net_top_i (
        .clock_in(clock),
        .rst(reset),
        .sw_in(8'h01),
        .led_o()
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
        @(negedge clock);
        @(negedge clock);
        @(negedge clock);
        @(negedge clock);
        reset = 1'b0;
        
        #100000;
        $finish;
	end
endmodule
