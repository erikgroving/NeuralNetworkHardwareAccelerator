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
    
    logic [27: 0]               dsp_o;
    
    logic [ID_WIDTH - 1: 0]     neuron_id;
    logic [ID_WIDTH - 1: 0]     prev_neuron_id_i;
    logic                       valids;
    logic [27: 0]               kernel_in;
    
    
    logic [31: 0]               mult_res;
    logic [30: 0]               mac_res;
    
    logic                       last;
    logic                       prev_valid_i;
    logic [8: 0]                cnt;

    always_ff @(posedge clk) begin
        if (rst) begin
            cnt     <= 0;
            last    <= 0;
        end
        else if (valid_i) begin
            cnt     <= (cnt == FAN_IN - 1) ? 0 : cnt + 1'b1;
            last    <= cnt == FAN_IN - 1;
        end
        else begin
            cnt     <= cnt;
            last    <= cnt == FAN_IN - 1;
        end
    end
    
    always_ff @(posedge clk) begin
        if (rst) begin
            prev_neuron_id_i    <= 0;
        end
        else begin
            prev_neuron_id_i    <= neuron_id_i;
        end
    end
    
    
    always_ff @(posedge clk) begin
        if (rst) begin
            activation_o    <= 0;
            neuron_id_o     <= 0;
            valid_o         <= 0;
        end
        else if (last) begin
            activation_o    <= dsp_o[27: 12];
            neuron_id_o     <= prev_neuron_id_i;
            valid_o         <= 1'b1;
        end
        else begin
            activation_o    <= activation_o;
            neuron_id_o     <= neuron_id_o;
            valid_o         <= 1'b0;
        end
    end
    
    assign kernel_in    = has_bias ? {bias, 12'b0} : dsp_o;
    assign mult_res     = $signed(weight) * $signed(activation_i);
    assign mac_res      = $signed(mult_res[31:1]) + $signed(kernel_in);
    
    always_ff @(posedge clk) begin
        if (rst) begin
            dsp_o   <= 28'h0;
        end
        else if ({mac_res[30], &mac_res[29:27]} == 2'b10) begin // negative saturation
            dsp_o   <= 28'h800_0000;
        end
        else if ({mac_res[30], |mac_res[29:27]} == 2'b01) begin // positive saturation
            dsp_o   <= 28'h7FF_FFFF;
        end
        else begin
            dsp_o   <= mac_res[27: 0]; 
        end
    end
    
    `ifdef DEBUG
    always_ff @(posedge clk) begin
        if (neuron_id_i == 7'd84) begin
        $display("--- INTERNAL KERNEL ---");
        $display("neuron_id: %02d\t\tweight: %04h\t\tactivation_i: %04h\t\tkernel_in: %06h\t\tdsp_o:%06h\t\tvalid_i: %01b, _o: %01b cnt: %03d", neuron_id_i, weight, activation_i, kernel_in, dsp_o, valid_i, valid_o, cnt);
        end
    end
    `endif


    
endmodule
