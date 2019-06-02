`timescale 1ns / 1ps

module previous_layer_gradient_adder (
        input                                       clk,
        input                                       rst,
        input                                       forward,
        input [`FC1_N_KERNELS - 1: 0][15: 0]        grad_i,
        input [6: 0]                                neuron_id_i,
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
    logic               stage1_bp_mode;
    
    logic [3: 0][15: 0] stage2_grad;
    logic               stage2_valid;
    logic [6: 0]        stage2_neuron_id;
    logic               stage2_bp_mode;
    
    logic [1: 0][15: 0] stage3_grad;
    logic               stage3_valid;
    logic [6: 0]        stage3_neuron_id;
    logic               stage3_bp_mode;
    
    logic [15: 0]       stage4_grad;
    logic               stage4_valid;
    logic               prev_stage4_valid;
    logic [6: 0]        stage4_neuron_id;
    logic               stage4_bp_mode;
    
    logic               prev_bp_mode_i;
    
    bit [4: 0] i, j, m, n, o, p;  
    always_ff @(posedge clk) begin
        prev_bp_mode_i  <= bp_mode_i;
    
        // Stage 1 of Adder
        if (rst) begin
            stage1_grad         <= 0;
            stage1_valid        <= 0;
            stage1_neuron_id    <= 0;
            stage1_bp_mode      <= 0;
        end
        else begin
            for (i = 0, n = 0; i < 16; i = i + 2, n = n + 1) begin
                stage1_grad[n]  <= $signed(grad_i[i]) + $signed(grad_i[i + 1]);
            end
            stage1_valid        <= valid_i & (bp_mode_i == NEURON_MODE);
            stage1_neuron_id    <= neuron_id_i;
            stage1_bp_mode      <= bp_mode_i;
        end
        
        // Stage 2 of Adder
        if (rst) begin
            stage2_grad         <= 0;
            stage2_valid        <= 0;
            stage2_neuron_id    <= 0;
            stage2_bp_mode      <= 0;
        end
        else begin
            for (j = 0, o = 0; j < 8; j = j + 2, o = o + 1) begin
                stage2_grad[o]  <= $signed(stage1_grad[j]) + $signed(stage1_grad[j + 1]);
            end
            stage2_valid        <= stage1_valid;
            stage2_neuron_id    <= stage1_neuron_id;
            stage2_bp_mode      <= stage1_bp_mode;
        end

        
        // Stage 3 of Adder
        if (rst) begin
            stage3_grad         <= 0;
            stage3_valid        <= 0;
            stage3_neuron_id    <= 0;
            stage3_bp_mode      <= 0;
        end
        else begin
            for (m = 0, p = 0; m < 4; m = m + 2, p = p + 1) begin
                stage3_grad[p]  <= $signed(stage2_grad[m]) + $signed(stage2_grad[m + 1]);
            end
            stage3_valid        <= stage2_valid;
            stage3_neuron_id    <= stage2_neuron_id;
            stage3_bp_mode      <= stage2_bp_mode;
        end

        
        // Stage 4 of Adder
        if (rst) begin
            stage4_grad         <= 0;
            stage4_valid        <= 0;
            prev_stage4_valid   <= 0;
            stage4_neuron_id    <= 0;
            stage4_bp_mode      <= 0;
        end
        else begin
            stage4_grad         <= $signed(stage3_grad[0]) + $signed(stage3_grad[1]);
            stage4_valid        <= stage3_valid;
            prev_stage4_valid   <= stage4_valid;
            stage4_neuron_id    <= stage3_neuron_id;
            stage4_bp_mode      <= stage3_bp_mode;
        end

        
        // Stage 5
        if (rst || forward) begin
            pl_gradients    <= 0;
        end
        else if (stage4_valid & stage4_bp_mode == NEURON_MODE) begin
            pl_gradients[stage4_neuron_id]  <= $signed(pl_gradients[stage4_neuron_id]) + $signed(stage4_grad);
        end
        
        if (rst) begin
            pl_grad_valid   <= 0;
        end
        else if ({prev_stage4_valid, stage4_valid} == 2'b10) begin
            pl_grad_valid   <= 1'b1;
        end
        else if (forward) begin
            pl_grad_valid   <= 1'b0;
        end
    end

    

endmodule
