`timescale 1ns / 1ps

module previous_layer_gradient_adder (
        input                                       clk,
        input                                       rst,
        input [`FC1_N_KERNELS - 1: 0][15: 0]        grad_i,
        input [6: 0]                                neuron_id,
        input                                       valid_i,
        input                                       bp_mode_i,
        
        output logic [`FC0_NEURONS - 1: 0][15: 0]   pl_gradients,
        output logic                                pl_grad_valid
);
    
    localparam WEIGHT_MODE = 0;
    localparam NEURON_MODE = 1;  
    
    logic [7: 0][15: 0] stage1_grad;
    logic               stage1_valid;
    logic [6: 0]        stage1_neuron_id;
    
    logic [3: 0][15: 0] stage2_grad;
    logic               stage2_valid;
    logic [6: 0]        stage2_neuron_id;
    
    logic [1: 0][15: 0] stage3_grad;
    logic               stage3_valid;
    logic [6: 0]        stage3_neuron_id;
    
    logic [15: 0]       stage4_grad;
    logic               stage4_valid;
    logic [6: 0]        stage4_neuron_id;
    
    
    bit [3: 0] i, j, m;  
    always_ff @(posedge clk) begin
        // Stage 1 of Adder
        if (rst) begin
            stage1_grad         <= 0;
            stage1_valid        <= 0;
            stage1_neuron_id    <= 0;
        end
        else begin
            for (i = 0; i < 8; i = i + 2) begin
                stage1_grad <= $signed(grad_i[i]) + $signed(grad_i[i + 1]);
            end
            stage1_valid        <= valid_i;
            stage1_neuron_id    <= neuron_id_i;
        end
        
        // Stage 2 of Adder
        
        // Stage 3 of Adder
        
        // Stage 4 of Adder
        
        // Calculating gradients for the neurons of the previous layer
        if (rst) begin
            pl_gradients    <= 0;
        end
        else if (&valid_i & bp_mode_i == NEURON_MODE) begin
            pl_gradients[neuron_id]    <= $signed(pl_gradients[b_act_id[3]]) + 
                                            $signed(b_kern_grad_o[0]) + 
                                            $signed(b_kern_grad_o[1]);
        end
        
        if (rst) begin
            pl_grad_valid   <= 0;
        end
        else if ({prev_b_kern_valid, &b_kern_valid_o} == 2'b10) begin
            pl_grad_valid   <= 1'b1;
        end
        else if (forward) begin
            pl_grad_valid   <= 1'b0;
        end
    end

    

endmodule
