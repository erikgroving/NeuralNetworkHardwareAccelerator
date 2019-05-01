`timescale 1ns / 1ps

module fc1_scheduler(
    input                                                           clk,
    input                                                           rst,
    input                                                           forward,
    input                                                           valid_i,
    
    output logic    [`FC1_ADDR - 1: 0]                              head_ptr,
    output logic    [`FC1_ADDR - 1: 0]                              mid_ptr,
    output logic    [`FC1_BIAS_ADDR - 1: 0]                         bias_ptr,
    output logic                                                    has_bias
    
    );    
    
    logic                               start;
    logic   [`FC1_ADDR - 1: 0]          h_thresh;
    logic   [`FC1_ADDR - 1: 0]          next_head_ptr;
    logic   [`FC1_ADDR - 1: 0]          next_mid_ptr;
    logic   [`FC1_BIAS_ADDR - 1: 0]     next_bias_ptr;
    
    assign h_thresh         = `FC1_MID_PTR_OFFSET - `FC1_ADDR'd2;
    assign next_head_ptr    = (!valid_i) ? head_ptr     :
                                        (!start) ? 0    : head_ptr + 1'b1;
    assign next_mid_ptr     = (!valid_i) ? mid_ptr      :
                                (!start) ? `FC1_ADDR'd`FC1_FAN_IN : mid_ptr + 1'b1;
    assign next_bias_ptr    = (!valid_i) ? bias_ptr     :
                                (!start) ? 0            : bias_ptr + 1'b1;
    
    always_ff @(posedge clk) begin
        if (rst) begin
            head_ptr    <= 0;
            mid_ptr     <= `FC1_ADDR'd`FC1_FAN_IN;
        end
        else begin
            head_ptr    <= next_head_ptr;
            mid_ptr     <= next_mid_ptr;
        end
    end

    always_ff @(posedge clk) begin
        if (rst) begin
            bias_ptr    <= 0;
            has_bias    <= 0;
        end
        else if (valid_i && (next_head_ptr == 0 || next_head_ptr == `FC1_FAN_IN)) begin 
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
