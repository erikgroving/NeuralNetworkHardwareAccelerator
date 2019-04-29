`timescale 1ns / 1ps

module fc1_scheduler(
    input                                   clk,
    input                                   rst,
    input                                   forward,
    input                                   activation_rdy,

    output logic                            bias_o,
    output logic  [`FC1_BIAS_ADDR - 1: 0]   bias_ptr,
    output logic  [`FC1_ADDR - 1: 0]        head_ptr,
    output logic  [`FC1_ADDR - 1: 0]        mid_ptr

    );
    
    logic                                   rdy;
    logic   [2: 0]                          set_bias_pipe;
    logic   [`FC1_ADDR - 1: 0]              next_head_ptr;
    logic   [`FC1_ADDR - 1: 0]              next_mid_ptr;
    logic   [`FC1_BIAS_ADDR - 1: 0]         next_bias_ptr;
    
    assign next_head_ptr    = (head_ptr == `FC1_MID_PTR_OFFSET - 1'b1)  ? 0 : head_ptr + 1'b1;
    assign next_mid_ptr     = (head_ptr == `FC1_MID_PTR_OFFSET - 1'b1)  ? `FC1_MID_PTR_OFFSET : mid_ptr + 1'b1;
    assign next_bias_ptr    = (bias_ptr == `FC1_BIAS_ADDR'd30)          ? 0 : bias_ptr + 2'd2;        
    assign rdy              = activation_rdy;
    
    
    always_ff @(posedge clk) begin
        if (rst) begin
            head_ptr    <= 0;
            mid_ptr     <= `FC1_MID_PTR_OFFSET;
        end
        else if (!rdy) begin
            head_ptr    <= head_ptr;
            mid_ptr     <= mid_ptr;
        end
        else begin
            head_ptr    <= next_head_ptr;
            mid_ptr     <= next_mid_ptr;
        end       
    end
    
    always_ff @(posedge clk) begin
        if (rst) begin
            bias_ptr        <= 0;
            bias_o          <= 1'b0;
            set_bias_pipe   <= 0;
        end
        else if (rdy && (head_ptr == 0 || head_ptr == `FC1_FAN_IN - 1'b1)) begin
            bias_ptr        <= next_bias_ptr;
            bias_o          <= 1'b1;
            set_bias_pipe   <= 3'd7;
        end
        else if (rdy && |set_bias_pipe) begin
            bias_ptr        <= next_bias_ptr;
            bias_o          <= 1'b1;
            set_bias_pipe   <= set_bias_pipe - 1'b1;
        end
        else begin
            bias_ptr        <= bias_ptr;
            bias_o          <= 1'b0;
            set_bias_pipe   <= set_bias_pipe;
        end       
    end


endmodule
