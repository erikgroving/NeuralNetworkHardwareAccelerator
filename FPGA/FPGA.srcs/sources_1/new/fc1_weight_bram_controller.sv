`timescale 1ns / 1ps

`include "sys_defs.vh"

module fc1_weight_bram_controller (
    input                                               clk,
    input                                               rst,

    input  [`FC1_ADDR - 1: 0]                           addr_a,
    input  [`FC1_BRAM - 1: 0][15: 0]                    data_in_a,
    input                                               en_a,
    input                                               we_a,

    input  [`FC1_ADDR - 1: 0]                           addr_b,
    input  [`FC1_BRAM - 1: 0][15: 0]                    data_in_b,
    input                                               en_b,
    input                                               we_b,
    
    output logic [`FC1_BRAM - 1: 0][15: 0]              data_out_a,
    output logic [`FC1_BRAM - 1: 0][15: 0]              data_out_b,
    output logic [`FC1_N_KERNELS - 1: 0][4: 0]          neuron_id
    
    );
    
    bit [`FC1_BRAM - 1: 0]  i, j;
    always_ff @(posedge clk) begin
        if (rst) begin 
            neuron_id       <= 0;
        end
        else begin 
            for (i = 0, j = 8; i < `FC1_BRAM; i=i+1, j=j+1) begin 
                if (addr_a < `FC1_FAN_IN) begin
                    neuron_id[i]    <= i;
                    neuron_id[j]    <= i + `FC1_HALF_NEURONS;
                end 
                else begin 
                    neuron_id[i]    <= i + `FC1_BRAM;
                    neuron_id[j]    <= i + `FC1_HALF_NEURONS + `FC1_BRAM;
                end
            end
        end
    end

    fc1_weights_bram_0 fc1_weights_bram_0_i (
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
    
     fc1_weights_bram_1 fc1_weights_bram_1_i (
        .addra(addr_a),
        .clka(clk),
        .dina(data_in_a[1]),
        .douta(data_out_a[1]),
        .ena(en_a),
        .wea(we_a),
        
        .addrb(addr_b),
        .clkb(clk),
        .dinb(data_in_b[1]),
        .doutb(data_out_b[1]),
        .enb(en_b),
        .web(we_b)
    );
    
     fc1_weights_bram_2 fc1_weights_bram_2_i (
        .addra(addr_a),
        .clka(clk),
        .dina(data_in_a[2]),
        .douta(data_out_a[2]),
        .ena(en_a),
        .wea(we_a),
        
        .addrb(addr_b),
        .clkb(clk),
        .dinb(data_in_b[2]),
        .doutb(data_out_b[2]),
        .enb(en_b),
        .web(we_b)
    );
    
     fc1_weights_bram_3 fc1_weights_bram_3_i (
        .addra(addr_a),
        .clka(clk),
        .dina(data_in_a[3]),
        .douta(data_out_a[3]),
        .ena(en_a),
        .wea(we_a),
        
        .addrb(addr_b),
        .clkb(clk),
        .dinb(data_in_b[3]),
        .doutb(data_out_b[3]),
        .enb(en_b),
        .web(we_b)
    );
    
     fc1_weights_bram_4 fc1_weights_bram_4_i (
        .addra(addr_a),
        .clka(clk),
        .dina(data_in_a[4]),
        .douta(data_out_a[4]),
        .ena(en_a),
        .wea(we_a),
        
        .addrb(addr_b),
        .clkb(clk),
        .dinb(data_in_b[4]),
        .doutb(data_out_b[4]),
        .enb(en_b),
        .web(we_b)
    );
    
     fc1_weights_bram_5 fc1_weights_bram_5_i (
        .addra(addr_a),
        .clka(clk),
        .dina(data_in_a[5]),
        .douta(data_out_a[5]),
        .ena(en_a),
        .wea(we_a),
        
        .addrb(addr_b),
        .clkb(clk),
        .dinb(data_in_b[5]),
        .doutb(data_out_b[5]),
        .enb(en_b),
        .web(we_b)
    );
    
     fc1_weights_bram_6 fc1_weights_bram_6_i (
        .addra(addr_a),
        .clka(clk),
        .dina(data_in_a[6]),
        .douta(data_out_a[6]),
        .ena(en_a),
        .wea(we_a),
        
        .addrb(addr_b),
        .clkb(clk),
        .dinb(data_in_b[6]),
        .doutb(data_out_b[6]),
        .enb(en_b),
        .web(we_b)
    );
    
     fc1_weights_bram_7 fc1_weights_bram_7_i (
        .addra(addr_a),
        .clka(clk),
        .dina(data_in_a[7]),
        .douta(data_out_a[7]),
        .ena(en_a),
        .wea(we_a),
        
        .addrb(addr_b),
        .clkb(clk),
        .dinb(data_in_b[7]),
        .doutb(data_out_b[7]),
        .enb(en_b),
        .web(we_b)
    );
    
    
endmodule
