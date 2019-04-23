`timescale 1ns / 1ps

`include "sys_defs.vh"

module fc1_weight_bram_controller(
    input                                               clk,
    input                                               rst,
    
    input   [`FC1_WEIGHT_BRAM - 1: 0][15: 0]            addrs_a,
    input   [`FC1_WEIGHT_BRAM - 1: 0][15: 0]            data_in_a,
    input                                               en_a,
    input                                               we_a,
    
    input   [`FC1_WEIGHT_BRAM - 1: 0][15: 0]            addrs_b,
    input   [`FC1_WEIGHT_BRAM - 1: 0][15: 0]            data_in_b,
    input                                               en_b,
    input                                               we_b,
    
    output logic    [`FC1_WEIGHT_BRAM - 1: 0][15: 0]    data_out_a,
    output logic    [`FC1_WEIGHT_BRAM - 1: 0][15: 0]    data_out_b
    
    );
    
    
    genvar i;
    generate 
        for (i = 0; i < `FC1_WEIGHT_BRAM; i=i+1) begin
            fc1_blk_mem_gen_0 fc1_blk_mem_gen_0_i(
                .addra(addrs_a[i]),
                .clka(clk),
                .dina(data_in_a[i]),
                .douta(data_out_a[i]),
                .ena(en_a),
                .wea(we_a),
                
                .addrb(addrs_b[i]),
                .clkb(clk),
                .dinb(data_in_b[i]),
                .doutb(data_out_b[i]),
                .enb(en_b),
                .web(we_b)
            );
       end
    endgenerate
endmodule
