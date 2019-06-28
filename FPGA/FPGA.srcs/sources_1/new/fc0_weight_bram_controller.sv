`timescale 1ns / 1ps

`include "sys_defs.vh"

module fc0_weight_bram_controller (
    input                                               clk,
    input                                               rst,

    input  [`FC0_ADDR - 1: 0]                           addr_a,
    input  [`FC0_PORT_WIDTH - 1: 0][`PREC - 1: 0]       data_in_a,
    input                                               en_a,
    input                                               we_a,

    input  [`FC0_ADDR - 1: 0]                           addr_b,
    input  [`FC0_PORT_WIDTH - 1: 0][`PREC - 1: 0]       data_in_b,
    input                                               en_b,
    input                                               we_b,
    
    output logic [`FC0_PORT_WIDTH - 1: 0][`PREC - 1: 0] data_out_a,
    output logic [`FC0_PORT_WIDTH - 1: 0][`PREC - 1: 0] data_out_b,
    output logic [`FC0_PORT_WIDTH - 1: 0][6: 0]         neuron_id
    
    );
    
    bit [6: 0]  i, j;
    always_ff @(posedge clk) begin
        for (i = 0; i < `FC0_PORT_WIDTH; i=i+1) begin
            neuron_id[i]    <= i; 
        end
    end

    fc0_weights_bram fc0_weights_bram_i (
        .addra(addr_a),
        .clka(clk),
        .dina(data_in_a),
        .douta(data_out_a),
        .ena(en_a),
        .wea(we_a),
        
        .addrb(addr_b),
        .clkb(clk),
        .dinb(data_in_b),
        .doutb(data_out_b),
        .enb(en_b),
        .web(we_b)
    );    
    
endmodule
