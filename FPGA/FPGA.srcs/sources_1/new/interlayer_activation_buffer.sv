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
    input [N_KERNELS_I - 1: 0][15: 0]                   activation_i,
    input [N_KERNELS_I - 1: 0][ID_WIDTH - 1: 0]         neuron_id_i,
    input                                               valid_act_i,
    
    
    output logic [N_KERNELS_O - 1: 0][15: 0]            activation_o,
    output logic [N_KERNELS_O - 1: 0][ID_WIDTH - 1: 0]  neuron_id_o,
    output logic                                        valid_o,
        
    output logic                                        buff_rdy
);
    logic   [ID_WIDTH - 1: 0]           buff_ptr;
    logic   [BUFF_SIZE - 1: 0][15: 0]   buffer;
    logic                               read_o;
    logic   [LOOPS - 1: 0]              loop_cnt;
    bit     [ID_WIDTH - 1: 0]           i;
    
    always_ff @(posedge clk) begin
        if (rst) begin
            buffer      <= 0;
            buff_rdy    <= 0;
        end
        else if (valid_act_i) begin
            for (i = 0; i < N_KERNELS_I; i=i+1) begin
                buffer[neuron_id_i[i]]  <= activation_i[i];
            end
            
            if (!read_o && neuron_id_i[N_KERNELS_I - 1] == BUFF_SIZE - 1) begin
                buff_rdy    <= 1'b1;
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
            buff_ptr    <= buff_ptr + 1'b1;            
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
        if (rst) begin
            activation_o    <= 0;
            neuron_id_o     <= 0;
            valid_o         <= 0;
        end
        else begin
            for (j = 0; j < N_KERNELS_O; j=j+1) begin
                activation_o[j] <= buffer[buff_ptr];
                neuron_id_o     <= j;
            end
            valid_o <= read_o;
        end
    end
    
    `ifdef DEBUG       
    integer it;
    always_ff @(posedge clk) begin
        $display("\n---INTERLAYER ACTIVATION BUFFER ---");
        $display("buff_rdy: %01b\t\tstart: %01b\t\tread_o: %01b", buff_rdy, start, read_o);
        $display("Neuron\t\tActivation");
        for (it = 0; it < BUFF_SIZE; it=it+1) begin
            $display("%02d\t\t\t%04h", it, buffer[it]);
        end
    end
    `endif
    
endmodule
