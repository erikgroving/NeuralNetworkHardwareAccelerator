`timescale 1ns / 1ps
`include "sys_defs.vh"

module fc_kernel #(
    parameter FAN_IN = 0,
    parameter ID_WIDTH = 0
)(
    input                           clk,
    input                           rst,
    input   [`PREC - 1: 0]          activation_i,
    input   [`PREC - 1: 0]          weight,
    input   [`PREC - 1: 0]          bias,
    input   [ID_WIDTH - 1: 0]       neuron_id_i,
    input                           has_bias,
    input                           valid_i,
    input                           b_valid_i,
    
    output logic [`PREC - 1: 0]     b_gradient_o,
    output logic                    b_valid_o,
    output logic [`PREC - 1: 0]     activation_o,
    output logic [ID_WIDTH - 1: 0]  neuron_id_o,
    output logic                    valid_o
);
    
    logic [31: 0]               dsp_o;
    
    logic [ID_WIDTH - 1: 0]     neuron_id;
    logic [ID_WIDTH - 1: 0]     prev_neuron_id_i;
    logic                       valids;
    logic [31: 0]               kernel_in;
    
    
    logic [45: 0]               mult_res;
    logic [37: 0]               mac_res;
    
    logic                       last;
    logic                       prev_valid_i;
    logic [8: 0]                cnt;

    always_ff @(posedge clk) begin
        if (valid_i) begin
            cnt     <= (cnt == FAN_IN - 1) ? 0 : cnt + 1'b1;
            last    <= cnt == FAN_IN - 1;
        end
        else begin
            cnt     <= 0;
            last    <= cnt == FAN_IN - 1;
        end
    end
    
    always_ff @(posedge clk) begin
        prev_neuron_id_i    <= neuron_id_i;
    end
    
    always_ff @(posedge clk) begin
        if ({mult_res[45], &mult_res[44: 39]} == 2'b10) begin // negative saturation
            b_gradient_o    <= `MIN_VAL;
        end
        else if ({mult_res[45], |mult_res[44: 39]} == 2'b01) begin // positive saturation
            b_gradient_o    <= `MAX_VAL;
        end
        else begin
            b_gradient_o    <= mult_res[39: 17];
        end

        b_valid_o       <= b_valid_i;
    end
    
    
    
    always_ff @(posedge clk) begin
        if (last) begin
            activation_o    <= dsp_o[31: 9];
            neuron_id_o     <= prev_neuron_id_i;
            valid_o         <= 1'b1;
        end
        else begin
            valid_o         <= 1'b0;
        end
    end
    
    assign kernel_in    = has_bias ? {bias, 9'b0} : dsp_o;
    assign mult_res     = $signed(weight) * $signed(activation_i);
    assign mac_res      = $signed(mult_res[45:8]) + $signed(kernel_in);
    
    always_ff @(posedge clk) begin
        if ({mac_res[37], &mac_res[36: 31]} == 2'b10) begin // negative saturation
            dsp_o   <= 32'h8000_0000;
        end
        else if ({mac_res[37], |mac_res[36: 31]} == 2'b01) begin // positive saturation
            dsp_o   <= 32'h7FFF_FFFF;
        end
        else begin
            dsp_o   <= mac_res[31: 0]; 
        end
    end
    
    `ifdef DEBUG
    always_ff @(posedge clk) begin
       /* if (FAN_IN == 784) begin
        $display("--- INTERNAL KERNEL ---");
        $display("neuron_id: %02d\t\tweight: %04h\t\tactivation_i: %04h\t\tkernel_in: %06h\t\tdsp_o:%06h\t\tvalid_i: %01b, _o: %01b cnt: %03d", neuron_id_i, weight, activation_i, kernel_in, dsp_o, valid_i, valid_o, cnt);
        end*/
    end
    `endif


    
endmodule
