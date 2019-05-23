`timescale 1ns / 1ps

`include "sys_defs.vh"

module fc2_weight_bram_controller (
    input                                               clk,
    input                                               rst,

    input  [`FC2_ADDR - 1: 0]                           addr_a,
    input  [`FC2_BRAM - 1: 0][15: 0]                    data_in_a,
    input                                               en_a,
    input                                               we_a,
    
    input  [`FC2_ADDR - 1: 0]                           addr_b,
    input  [`FC2_BRAM - 1: 0][15: 0]                    data_in_b,
    input                                               en_b,
    input                                               we_b,
    
    output logic [`FC2_N_KERNELS - 1: 0][15: 0]         data_out,
    output logic [`FC2_N_KERNELS - 1: 0][3: 0]          neuron_id
    
    );
    
    logic [`FC2_BRAM - 1: 0][15: 0]              data_out_a;
    logic [`FC2_BRAM - 1: 0][15: 0]              data_out_b;
    
    assign data_out = {data_out_b, data_out_a};
   
    bit [`FC2_BRAM - 1: 0]  i, j;
    always_ff @(posedge clk) begin
        if (rst) begin 
            neuron_id       <= 0;
        end
        else begin 
            for (i = 0, j = 1; i < `FC2_BRAM; i=i+1, j=j+1) begin 
                neuron_id[i]    <= addr_a[9: 6];    // abuse the fact that fan in is a power of 2
                neuron_id[j]    <= addr_a[9: 6] + `FC2_HALF_NEURONS;
            end
        end
    end

    fc2_weights_bram fc2_weights_bram_i (
        .addra(addr_a),
        .clka(clk),
        .dina(data_in_a[0]),
        .douta(data_out_a[0]),
        .ena(en_a),
        .wea(we_a),     
        
        .addrb(addr_b),
        .clkb(clk),
        .dinb(data_in_b[0]),
        .doutb(data_out_b[0]),
        .enb(en_b),
        .web(we_b)
    );

endmodule
