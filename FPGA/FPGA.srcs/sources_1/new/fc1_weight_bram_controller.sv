`timescale 1ns / 1ps

`include "sys_defs.vh"

module fc1_weight_bram_controller (
    input                                               clk,
    input                                               rst,

    input  [`FC1_ADDR - 1: 0]                           addr_a,
    input  [`FC1_PORT_WIDTH - 1: 0][`PREC - 1: 0]              data_in_a,
    input                                               en_a,
    input                                               we_a,

    input  [`FC1_ADDR - 1: 0]                           addr_b,
    input  [`FC1_PORT_WIDTH - 1: 0][`PREC - 1: 0]              data_in_b,
    input                                               en_b,
    input                                               we_b,
    
    output logic [`FC1_PORT_WIDTH - 1: 0][`PREC - 1: 0] data_out_a,
    output logic [`FC1_PORT_WIDTH - 1: 0][`PREC - 1: 0] data_out_b,
    output logic [`FC1_N_KERNELS - 1: 0][5: 0]          neuron_id
    
    );
    
    bit [`FC1_PORT_WIDTH - 1: 0]  i, j;
    always_ff @(posedge clk) begin
        for (i = 0, j = 8; i < `FC1_PORT_WIDTH; i=i+1, j=j+1) begin 
            if (addr_a < `FC1_FAN_IN) begin
                neuron_id[i]    <= i;
                neuron_id[j]    <= i + `FC1_HALF_NEURONS;
            end
            else if (addr_a < `FC1_STEP2) begin
                neuron_id[i]    <= i + `FC1_PORT_WIDTH;
                neuron_id[j]    <= i + `FC1_PORT_WIDTH + `FC1_HALF_NEURONS;
            end
            else if (addr_a < `FC1_STEP3) begin
                neuron_id[i]    <= i + `FC1_PORT_WIDTH_TIMES2;
                neuron_id[j]    <= i + `FC1_PORT_WIDTH_TIMES2 + `FC1_HALF_NEURONS;                   
            end
            else begin 
                neuron_id[i]    <= i + `FC1_PORT_WIDTH_TIMES3;
                neuron_id[j]    <= i + `FC1_HALF_NEURONS + `FC1_PORT_WIDTH_TIMES3;
            end
        end
    end

    fc1_weights_bram_0 fc1_weights_bram_0_i (
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
