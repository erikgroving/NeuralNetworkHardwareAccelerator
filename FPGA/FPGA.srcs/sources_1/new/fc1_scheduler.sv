`timescale 1ns / 1ps

module fc1_scheduler(
    input                                                               clk,
    input                                                               rst,
    input                                                               forward,
    input                                                               activation_rdy,
    
    output logic                                                        has_bias,    

    output logic    [(2 * `FC1_KERNEL_SIZE) - 1: 0][`FC1_ADDR - 1: 0]   addrs_o

    );
    
    bit     [`FC1_WEIGHT_BRAM - 1: 0] i;
    
    logic   [`FC1_WEIGHT_BRAM - 1: 0][`FC1_ADDR - 1: 0]     head_ptrs;
    logic   [`FC1_WEIGHT_BRAM - 1: 0][`FC1_ADDR - 1: 0]     mid_ptrs;
    logic   [`FC1_KERNEL_SIZE - 1: 0]                       active_pe;
    logic   [`FC1_KERNEL_SIZE - 2: 0]                       active_pe_r;

    assign active_pe = {active_pe_r, valid_i};
    assign addrs_o = {head_ptrs, mid_ptrs};
    
    always_ff @ (posedge clk) begin
        if (rst) begin
            active_pe_r         <= 0;
        end
        else begin
            active_pe_r         <= active_pe[`FC1_KERNEL_SIZE - 2: 0];
        end
    end
    
    always_ff @(posedge clk) begin
        if (rst) begin
            head_ptrs   <= 0;
            mid_ptrs    <= `FC1_MID_PTR_OFFSET;
        end
        else begin
            for (i = 0; i < `FC1_WEIGHT_BRAM; i = i + 1) begin
                if (active_pe[i]) begin
                    head_ptrs[i]    <= head_ptrs[i] + 1'b1;
                    mid_ptrs[i]     <= mid_ptrs[i] + 1'b1;
                end
                else if (activation_rdy) begin
                    head_ptrs[i]    <= 0;
                    mid_ptrs[i]     <= `FC1_MID_PTR_OFFSET;
                end
            end
        end
    end

endmodule
