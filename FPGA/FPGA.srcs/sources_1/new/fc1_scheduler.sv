`timescale 1ns / 1ps

module fc1_scheduler(
    input                                                           clk,
    input                                                           rst,
    input                                                           forward,
    input           [`FC1_KERNEL_SIZE - 1: 0]                       valid_i,
    input           [`FC1_KERNEL_SIZE - 1: 0][15: 0]                act_i,
    
    output logic    [`FC1_WEIGHT_BRAM - 1: 0][`FC1_ADDR - 1: 0]     head_ptrs,
    output logic    [`FC1_WEIGHT_BRAM - 1: 0][`FC1_ADDR - 1: 0]     mid_ptrs,
    output logic    [`FC1_KERNEL_SIZE - 1: 0][15: 0]                act_o,
    output logic    [`FC1_KERNEL_SIZE - 1: 0]                       valid_o
    
    );
    
    bit     [`FC1_KERNEL_SIZE - 1: 0]   i, j, k;
    
    
    logic   [`FC1_KERNEL_SIZE - 1: 0]   start;
    logic   [`FC1_ADDR - 1: 0]          h_thresh;
    logic   [`FC1_ADDR - 1: 0]          m_thresh;
    
    assign h_thresh = `FC1_MID_PTR_OFFSET - `FC1_ADDR'd2;
    assign m_thresh = `FC1_MID_PTR_END - `FC1_ADDR'd2;
    
    always_ff @(posedge clk) begin
        if (rst) begin
            act_o   <= 0;
            valid_o <= 0;
        end
        else begin
            act_o   <= act_i;
            valid_o <= valid_i;
        end
    end
    
    always_ff @(posedge clk) begin
        if (rst) begin
            head_ptrs   <= 0;
            mid_ptrs    <= {`FC1_WEIGHT_BRAM{`FC1_ADDR'd`FC1_FAN_IN}};
            start       <= 1'b0;
        end
        else begin
        
            for (i = 0; i < `FC1_WEIGHT_BRAM; i=i+1) begin
                if (valid_i[i] && !start[i]) begin
                    head_ptrs[i]    <= 0;
                end
                else if (valid_i[i] && start[i]) begin
                    head_ptrs[i]    <= head_ptrs[i] + 1'b1;
                end
                
                if (valid_i[i] && !start[i]) begin
                    start[i]    <= 1'b1;
                end
                else if (valid_i[i] && head_ptrs[i] == h_thresh) begin
                    start[i]    <= 1'b0;
                end
            end
            
            for (j = 0, k = `FC1_WEIGHT_BRAM; j < `FC1_WEIGHT_BRAM; j=j+1, k=k+1) begin
                if (valid_i[k] && !start[k]) begin
                    mid_ptrs[j]     <= `FC1_ADDR'd`FC1_FAN_IN;
                end
                else if (valid_i[k] && start[k]) begin
                    mid_ptrs[j]     <= mid_ptrs[j] + 1'b1;
                end
                
                if (valid_i[k] && !start[k]) begin
                    start[k]    <= 1'b1;
                end
                else if (valid_i[k] && mid_ptrs[j] == m_thresh) begin
                    start[k]    <= 1'b0;
                end
            end            
            
        end
    end
    
    
    

endmodule
