`timescale 1ns / 1ps

`include "sys_defs.vh"

module fc2_weight_bram_controller (
    input                                               clk,
    input                                               rst,

    input  [`FC2_ADDR - 1: 0]                           addr_a,
    input  [`FC2_BRAM - 1: 0][15: 0]                    data_in_a,
    input                                               en_a,
    input                                               we_a,
    
    output logic [`FC2_BRAM - 1: 0][15: 0]              data_out_a,
    output logic [`FC2_N_KERNELS - 1: 0][3: 0]          neuron_id
    
    );
    
    bit [`FC2_BRAM - 1: 0]  i, j;
    always_ff @(posedge clk) begin
        if (rst) begin 
            neuron_id       <= 0;
        end
        else begin 
            for (i = 0; i < `FC2_BRAM; i=i+1, j=j+1) begin 
                neuron_id[i]    <= addr_a[8: 5];    // abuse the fact that fan in is a power of 2
            end
        end
    end

    fc2_weights_bram fc2_weights_bram_i (
        .addra(addr_a),
        .clka(clk),
        .dina(data_in_a[0]),
        .douta(data_out_a[0]),
        .ena(en_a),
        .wea(we_a)
    );

endmodule
