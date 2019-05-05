`timescale 1ns / 1ps
`include "sys_defs.vh"

/* Addition kernel */
module fc_kernel #(
    parameter FAN_IN = 0,
    parameter ID_WIDTH = 0
)(
    input                           clk,
    input                           rst,
    input   [15: 0]                 activation_i,
    input   [15: 0]                 weight,
    input   [15: 0]                 bias,
    input   [ID_WIDTH - 1: 0]       neuron_id_i,
    input                           has_bias,
    input                           valid_i,
    output logic [15: 0]            activation_o,
    output logic [ID_WIDTH - 1: 0]  neuron_id_o,
    output logic                    valid_o
);
    
    logic [15: 0]   dsp_o;
    
    logic [4: 0]    neuron_id;
    logic           valids;
    logic [15: 0]   kernel_in;
    
    logic [8: 0]    cnt;
    logic [8: 0]    next_cnt;
    
    logic [31: 0]   mult_res;
    logic [18: 0]   mac_res;
    

    assign next_cnt     = (cnt == `FC1_FAN_IN - 1'b1) ? 0 : cnt + 1'b1;
    
    always_ff @(posedge clk) begin
        if (rst) begin
            cnt <= 0;
        end
        if (valid_i) begin
            cnt <= next_cnt;
        end
        
        if (valid_i && cnt == `FC1_FAN_IN - 1'b1) begin
            activation_o    <= dsp_o[15] ? 0 : dsp_o;       // ReLU
            neuron_id_o     <= neuron_id;
            valid_o         <= 1'b1;
        end
        else begin
            activation_o    <= activation_o;
            neuron_id_o     <= neuron_id_o;
            valid_o         <= 1'b0;
        end
        
        if (valid_i && cnt == 0) begin
            neuron_id   <= neuron_id_i;
        end
    end
    
    assign kernel_in    = has_bias ? bias : dsp_o;
    assign mult_res     = $signed(weight) * $signed(activation_i);
    assign mac_res      = $signed(mult_res[31:13]) + $signed(kernel_in);
    
    always_ff @(posedge clk) begin
        if (rst) begin
            dsp_o   <= 0;
        end
        else if ({mac_res[18], &mac_res[17:15]} == 2'b10) begin // negative saturation
            dsp_o   <= 16'h8000;
        end
        else if ({mac_res[18], |mac_res[17:15]} == 2'b01) begin // positive saturation
            dsp_o   <= 16'h7FFF;
        end
        else begin
            dsp_o   <= mac_res; 
        end
    end
    // A*B + C
    /*sixteen_bit_MAC_dsp dsp_i(
                .CLK(clk), 
                .A(weight),
                .B(activation_i),
                .C(kernel_in),
                .P(dsp_o)
    );*/
    
    `ifdef DEBUG
    always_ff @(posedge clk) begin
        $display("--- INTERNAL KERNEL ---");
        $display("weight: %04h\t\tactivation_i: %04h\t\tkernel_in: %04h\t\tdsp_o:%04h", weight, activation_i, kernel_in, dsp_o);
    end
    `endif


    
endmodule
