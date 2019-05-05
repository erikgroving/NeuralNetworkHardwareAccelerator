`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/08 16:27:18
// Design Name: 
// Module Name: neural_net_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module neural_net_top(
    input                   clk,
    input                   reset,
    output  logic [7: 0]    led_o
    );

    logic forward;
    
    assign forward = 1'b1;

    
    
    // FC0 --> FC1 BRAM activation buffer
    
    
    // Logics for the fc1 layer
    logic [`FC1_N_KERNELS - 1: 0][15: 0]    fc1_activation_i;
    logic [`FC1_N_KERNELS - 1: 0]           fc1_valid_i;    
 
    logic [`FC1_N_KERNELS - 1: 0][15: 0]    fc1_activation_o;
    logic [`FC1_N_KERNELS - 1: 0][4: 0]     fc1_neuron_id_o;
    logic [`FC1_N_KERNELS - 1: 0]           fc1_valid_act_o;
    // FC1   
    fc1_layer fc1_layer_i (
        // inputs
        .clk(clk),
        .rst(reset),    
        .forward(forward), 
        .activations_i(fc1_activation_i),
        .valid_i(fc1_valid_i),
        
        // outputs
        .activation_o(fc1_activation_o),
        .neuron_id_o(fc1_neuron_id_o),
        .valid_act_o(fc1_valid_act_o)    
    );
    
    // FC1 --> FC2 buffer   
    // Stored in fabric since only 32 activations for the layer
    logic [`FC2_FAN_IN - 1: 0][15: 0]   fc1_fc2_buff;
    logic                               fc1_fc2_rdy;
    
    bit [6: 0]  j;
    always_ff @(posedge clk) begin
        if (reset) begin
            fc1_fc2_buff    <= 0;
            fc1_fc2_rdy     <= 0;
        end
        else if(&fc1_valid_act_o) begin
            for (j = 0; j < `FC1_N_KERNELS; j=j+1) begin
                fc1_fc2_buff[fc1_neuron_id_o[j]]    <= fc1_activation_o[j];
            end
            
            if (fc1_neuron_id_o[`FC1_N_KERNELS - 1] == 5'd31) begin
                fc1_fc2_rdy <= 1'b1;
            end
        end
    end
    
    // Logics for the fc2 layer (the last fc layer)
    logic [`FC2_FAN_IN - 1: 0][15: 0]   fc2_activation_i;
    logic [`FC2_FAN_IN - 1: 0]          fc2_valid_i;
    
    logic [`FC2_NEURONS - 1: 0][15: 0]  fc2_activation_o;
    logic [`FC2_NEURONS - 1: 0][3: 0]   fc2_neuron_id_o;
    logic [`FC2_NEURONS - 1: 0]         fc2_valid_o;
    
    // FC2, fed directly from FC1 due to the small size
    fc2_layer fc2_layer_i (
        // inputs
        .clk(clk),
        .rst(reset),
        .forward(forward),
        .activations_i(fc2_activation_i),
        .valid_i(fc2_valid_i),
        
        // outputs
        .activation_o(fc2_activation_o),
        .neuron_id_o(fc2_neuron_id_o),
        .valid_act_o(fc2_valid_o)  
    );







    // Logic to display max on LED
    logic [3: 0]    max_idx;
    logic [15: 0]   max_val;
    bit [3: 0] i;
    always_comb begin
        max_idx = 4'b0;
        max_val = fc2_activation_o[0];
        for (i = 4'b1; i < `FC2_NEURONS; i=i+1) begin
            if (fc2_activation_o[i] > max_val) begin // note: since relu, do not need to worry about negative numbers in the comparions
                max_idx = i;
                max_val = fc2_activation_o[i];
            end
        end
    end
    
    
    logic [7: 0]    led;
    // Gets the max idx and sets the LED accordingly
    always_ff @(posedge clk) begin
        case(max_idx)
            4'd0:
                led     <= 8'h01;
            4'd1:
                led     <= 8'h02;
            4'd2:
                led     <= 8'h04;
            4'd3:
                led     <= 8'h08;
            4'd4:
                led     <= 8'h10;
            4'd5:
                led     <= 8'h20;
            4'd6:
                led     <= 8'h40;
            4'd7:
                led     <= 8'h80;
            4'd8:
                led     <= 8'h03;
            4'd9:
                led     <= 8'h05;
            default:
                led     <= 8'hF0;
        endcase
        
        if (reset) begin
            led_o   <= 8'b00;
        end
        else if (&fc2_valid_o) begin
            led_o   <= led;
        end
    end
    
    
endmodule
