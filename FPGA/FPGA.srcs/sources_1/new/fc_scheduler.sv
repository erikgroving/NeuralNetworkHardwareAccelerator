`timescale 1ns / 1ps

module fc_scheduler #(
    parameter ADDR              = 0,
    parameter BIAS_ADDR         = 0,
    parameter MID_PTR_OFFSET    = 0,
    parameter FAN_IN            = 0    
)(
    input                                                           clk,
    input                                                           rst,
    input                                                           forward,
    input                                                           valid_i,
    
    output logic    [ADDR - 1: 0]                                   head_ptr,
    output logic    [ADDR - 1: 0]                                   mid_ptr,
    output logic    [BIAS_ADDR - 1: 0]                              bias_ptr,
    output logic                                                    has_bias
    
);    
    logic                          start;
    logic   [ADDR - 1: 0]          h_thresh;
    logic   [ADDR - 1: 0]          next_head_ptr;
    logic   [ADDR - 1: 0]          next_mid_ptr;
    logic   [BIAS_ADDR - 1: 0]     next_bias_ptr;
    
    assign h_thresh         = MID_PTR_OFFSET - 2;
    
    assign next_head_ptr    = (!valid_i) ? head_ptr     :
                                (!start) ? 0            : head_ptr + 1'b1;
                                        
    assign next_mid_ptr     = (!valid_i) ? mid_ptr      :
                                (!start) ? MID_PTR_OFFSET : mid_ptr + 1'b1;
                                
    assign next_bias_ptr    = (!valid_i) ? bias_ptr     :
                                (!start) ? 0            : bias_ptr + 1'b1;

    
    always_ff @(posedge clk) begin
        if (rst) begin
            head_ptr    <= 0;
            mid_ptr     <= MID_PTR_OFFSET;
        end
        else begin
            head_ptr    <= next_head_ptr;
            mid_ptr     <= next_mid_ptr;
        end
    end

    logic [ADDR - 1: 0] bias_cntr;
    always_ff @(posedge clk) begin
        if (rst) begin
            bias_cntr   <= 0;
        end
        else if (valid_i && forward) begin
            bias_cntr   <= (bias_cntr == FAN_IN - 1) ? 0 : bias_cntr + 1'b1;
        end
        else begin
            bias_cntr   <= 0;
        end
    end
    

    always_ff @(posedge clk) begin
        if (rst) begin
            has_bias    <= 0;
            bias_ptr    <= 0;
        end
        else if (valid_i && bias_cntr == 0) begin 
            has_bias    <= 1'b1;
            bias_ptr    <= next_bias_ptr;
        end
        else begin 
            has_bias    <= 1'b0;
            bias_ptr    <= bias_ptr;
        end
    end

    always_ff @(posedge clk) begin
        if (rst) begin
            start   <= 1'b0;
        end
        else if (valid_i && !start) begin
            start   <= 1'b1;
        end
        else if (valid_i && head_ptr == h_thresh) begin
            start   <= 1'b0;
        end
    end

endmodule
