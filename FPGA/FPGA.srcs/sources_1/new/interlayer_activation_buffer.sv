`timescale 1ns / 1ps

module interlayer_activation_buffer #(
    parameter N_KERNELS_I = 0,
    parameter N_KERNELS_O = 0,
    parameter ID_WIDTH = 0,
    parameter BUFF_SIZE = 0,
    parameter LOOPS = 0
)(
    input                                               clk,
    input                                               rst,
    
    input                                               start,
    input [N_KERNELS_I - 1: 0][`PREC - 1: 0]                   activation_i,
    input [N_KERNELS_I - 1: 0][ID_WIDTH - 1: 0]         neuron_id_i,
    input                                               valid_act_i,
    
    input  [ID_WIDTH - 1: 0]                            b_ptr,
    
    
    output logic [N_KERNELS_O - 1: 0][`PREC - 1: 0]            activation_o,
    output logic                                        valid_o,
    
    output logic [`PREC - 1: 0]                                b_act_o,
        
    output logic                                        buff_rdy
);
    logic   [ID_WIDTH - 1: 0]           buff_ptr;
    logic   [BUFF_SIZE - 1: 0][`PREC - 1: 0]   buffer;
    logic                               read_o;
    logic   [LOOPS: 0]                  loop_cnt;
    bit     [ID_WIDTH: 0]               i;
    
    always_ff @(posedge clk) begin
        if (rst) begin
            buff_rdy    <= 0;
        end
        else if (valid_act_i) begin
            if (!read_o && neuron_id_i[N_KERNELS_I - 1] == BUFF_SIZE - 1) begin
                buff_rdy    <= 1'b1;
            end         
        end
        if (valid_act_i) begin
            for (i = 0; i < N_KERNELS_I; i=i+1) begin
                buffer[neuron_id_i[i]]  <= activation_i[i];
            end
        end
        if (read_o) begin
            buff_rdy        <= 1'b0;
        end
    end
    
    always_ff @(posedge clk) begin
        if (rst) begin
            read_o      <= 1'b0;
            buff_ptr    <= 0;
        end
        else if (buff_rdy && start && !read_o) begin
            read_o      <= 1'b1;
            buff_ptr    <= 0;
        end
        else if (read_o) begin
            read_o      <= ~((buff_ptr == (BUFF_SIZE - 1'b1)) & (loop_cnt == LOOPS - 1));
            buff_ptr    <= (buff_ptr == (BUFF_SIZE - 1'b1)) ? 0 : buff_ptr + 1'b1;            
        end
        
        if (rst) begin
            loop_cnt    <= 0;
        end
        else if(~read_o) begin
            loop_cnt    <= 0;
        end
        else if (buff_ptr == BUFF_SIZE - 1'b1) begin
            loop_cnt    <= loop_cnt + 1'b1;
        end
    end
    
    bit [ID_WIDTH - 1: 0] j;
    always_ff @(posedge clk) begin
        for (j = 0; j < N_KERNELS_O; j=j+1) begin
            activation_o[j] <= buffer[buff_ptr];
        end
        valid_o <= read_o;
    end
    
    always_ff @(posedge clk) begin
        b_act_o <= buffer[b_ptr];
    end
    
    `ifdef DEBUG     
    integer it;
    localparam sf = 2**-12.0;
    logic prev_buff_rdy;
    always_ff @(posedge clk) begin
        prev_buff_rdy <= buff_rdy;
        if ({buff_rdy, prev_buff_rdy} == 2'b10) begin    
        $display("\n---INTERLAYER ACTIVATION BUFFER %01d---", ID_WIDTH);
        $display("buff_ptr: %02d\t\tbuff_rdy: %01b\t\tstart: %01b\t\tread_o: %01b", buff_ptr, buff_rdy, start, read_o);
        $display("Neuron\t\tActivation");
        for (it = 0; it < BUFF_SIZE; it=it+1) begin
            $display("%02d\t\t\t%f", it, $itor($signed(buffer[it])) * sf);
        end
        end
    end
    `endif
    
endmodule
