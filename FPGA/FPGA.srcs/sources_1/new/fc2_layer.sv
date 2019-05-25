`timescale 1ns / 1ps

module fc2_layer(
        input                                       clk,
        input                                       rst,
        input                                       forward,
        input  [`FC2_N_KERNELS - 1: 0][15: 0]       activations_i,
        input                                       valid_i,

   
        input [`FC2_N_KERNELS - 1: 0][15: 0]        b_gradient_i,
        input [`FC2_N_KERNELS - 1: 0][15: 0]        b_activation_i,
        input [5: 0]                                b_activation_id,
        input [`FC2_N_KERNELS - 1: 0][3: 0]         b_neuron_id_i,
        input                                       b_valid_i,
        
        
        output logic [`FC2_N_KERNELS - 1: 0][15: 0] activation_o,
        output logic [`FC2_N_KERNELS - 1: 0][3: 0]  neuron_id_o,
        output logic                                valid_act_o,
        output logic                                fc2_busy
    );
    
    logic   [`FC2_N_KERNELS - 1: 0][15: 0]          data_in;
    logic   [`FC2_N_KERNELS - 1: 0][15: 0]          data_out;

    logic   [`FC2_N_KERNELS - 1: 0][15: 0]          weights;
    logic   [`FC2_ADDR - 1: 0]                      head_ptr;
    logic   [`FC2_ADDR - 1: 0]                      mid_ptr;
    logic   [`FC2_BIAS_ADDR - 1: 0]                 bias_ptr;
   
    logic   [`FC2_N_KERNELS - 1: 0][15: 0]          sch_activations;
    logic                                           sch_valid;
    logic   [`FC2_N_KERNELS - 1: 0][15: 0]          bram_activations;
    logic                                           bram_valid;
    logic   [`FC2_N_KERNELS - 1: 0][15: 0]          kern_activations;
    logic                                           kern_valid;
    
    logic   [`FC2_N_KERNELS - 1: 0][15: 0]          bias;
    logic   [`FC2_N_KERNELS - 1: 0][15: 0]          kern_bias;
    logic                                           sch_has_bias;
    logic                                           bram_has_bias;
    logic                                           kern_has_bias;
    logic   [`FC2_N_KERNELS - 1: 0][3: 0]           neuron_id;
    logic   [`FC2_N_KERNELS - 1: 0][3: 0]           kern_neuron_id;
    logic   [`FC2_N_KERNELS - 1: 0]                 last_weight;
    
    
    logic   [`FC2_N_KERNELS - 1: 0]                 valid;
    
    
   logic [`FC2_N_KERNELS - 1: 0][15: 0]             b_kern_grad;
   logic [`FC2_N_KERNELS - 1: 0][15: 0]             b_kern_act;   
   logic [`FC2_N_KERNELS - 1: 0][15: 0]             b_kern_grad_o;
   logic [`FC2_N_KERNELS - 1: 0]                    b_kern_valid_o;
   logic [5: 0]                                     b_act_id;
   logic [`FC2_N_KERNELS - 1: 0][3: 0]              b_neuron_id;     
   logic [5: 0]                                     b_act_id_pl;
   logic [`FC2_N_KERNELS - 1: 0][3: 0]              b_neuron_id_pl;    
   logic                                            b_kern_valid;
   
   
   logic [`FC2_NEURONS - 1: 0][`FC2_FAN_IN - 1: 0][15: 0]   gradients;
   logic                                                    prev_b_kern_valid; 
    
    always_ff @(posedge clk) begin
        if (rst) begin
            prev_b_kern_valid   <= 0;
        end
        else begin
            prev_b_kern_valid   <= &b_kern_valid_o;
        end
    end
    
    always_ff @(posedge clk) begin
        if (rst) begin
            sch_activations <= 0;
            sch_valid       <= 0;
        end
        else begin
            sch_activations <= activations_i;
            sch_valid       <= valid_i;
        end
    end

    // Scheduler for the fully connected layer
    fc_scheduler #(.ADDR(`FC2_ADDR), .BIAS_ADDR(`FC2_BIAS_ADDR), .MID_PTR_OFFSET(`FC2_MID_PTR_OFFSET), .FAN_IN(`FC2_FAN_IN)) fc2_scheduler_i (
        //inputs
        .clk(clk),
        .rst(rst),
        .forward(forward),
        .valid_i(valid_i),
        
        //outputs
        .head_ptr(head_ptr),
        .mid_ptr(mid_ptr),      
        .bias_ptr(bias_ptr),
        .has_bias(sch_has_bias)
    );

    


    always_ff @(posedge clk) begin
        if (rst) begin
            bram_activations    <= 0;
            bram_valid          <= 0;
            bram_has_bias       <= 0;
            fc2_busy            <= 0;
        end
        else begin
            bram_activations    <= sch_activations;
            bram_valid          <= sch_valid;
            bram_has_bias       <= sch_has_bias;
            fc2_busy            <= valid_i;
        end
    end
    
    // BRAM for the weights of the fully connected layer
    fc2_weight_bram_controller fc2_weight_bram_controller_i (
        // inputs
        .clk(clk),
        .rst(rst),
        
        .addr_a(head_ptr),
        .data_in_a(16'b0),
        .en_a(1'b1),
        .we_a(~forward),
        
        .addr_b(mid_ptr),
        .data_in_b(16'b0),
        .en_b(1'b1),
        .we_b(~forward),
        
        // outputs
        .data_out(data_out),        
        .neuron_id(neuron_id)
        
    ); 
    
    
    biases_fc2_blk_mem biases_fc2_blk_mem_i (
        .addra(bias_ptr),
        .clka(clk),
        .dina(32'b0),
        .douta({bias[1], bias[0]}),
        .ena(1'b1),
        .wea(1'b0)
    );

    bit [2: 0] z;
    always_ff @(posedge clk) begin
        if (rst) begin
            gradients   <= 0;
        end
        else if (&b_kern_valid_o) begin
            for (z = 0; z < `FC2_N_KERNELS; z=z+1) begin
                gradients[b_neuron_id_pl[z]][b_act_id_pl]    <= b_kern_grad_o[z];
            end
        end
    end

    `ifdef DEBUG
    integer it, it2;
    always_ff @(posedge clk) begin

        $display("\n--- BACKWARD PASS ---");
        $display("INPUT");
        $display("Activation id: %02d\t\tValid: %01b", b_activation_id, b_valid_i);
        $display("Gradient\t\tNeuronID\t\tAct_I");
        for (it = 0; it < `FC2_N_KERNELS; it=it+1) begin
            $display("%04h\t\t\t%01d\t\t\t\t%04h", b_gradient_i[it], b_neuron_id[it], b_activation_i[it]) ;
        end
        $display("OUTPUT");      
        $display("Gradient\t\tNeuronID\t\tActID\t\tValid");
        for (it = 0; it < `FC2_N_KERNELS; it=it+1) begin
            $display("%04h\t\t\t%01d\t\t\t\t%02d\t\t\t%01b", b_kern_grad_o[it], b_neuron_id_pl[it], 
                    b_act_id_pl, b_kern_valid_o[it]);
        end
        if ({prev_b_kern_valid, &b_kern_valid_o} == 2'b10) begin
            $display("\n--- GRADIENTS ---");
            for (it = 0; it < `FC2_NEURONS; it=it+1) begin
                $display("Neuron %01d", it);
                for (it2 = 0; it2 < `FC2_FAN_IN; it2=it2+1) begin
                    $display("%02d:\t%04h", it2, gradients[it][it2]);
                end
            end
        end
        $display("\n--- SCHEDULER ---");
        $display("head_ptr: %04d\t\tmid_ptr: %04d\t\tbias_ptr: %01d", head_ptr, mid_ptr, bias_ptr);
        $display("\n--- MEMORY CONTROLLER ---");
        $display("data_out_a\t");
        for (it = 0; it < `FC2_BRAM; it = it + 1) begin
            $display("%04h", data_out[it]);       
        end
        $display("\nBias");
        for (it = 0; it < `FC2_N_KERNELS; it = it + 1) begin
            $display("%04h", bias[it]);
        end
        
        $display("\nneuron_id");
        for (it = 0; it < `FC2_N_KERNELS; it = it + 1) begin
            $display("%01d", neuron_id[it]);       
        end
        $display("\n--- KERNELS---");
        $display("has_bias: %01b", bram_has_bias);
        $display("ACT_I\t\tWEIGHT\t\tBIAS\t\tBRAM_VALID");
        for (it = 0; it < `FC2_N_KERNELS; it=it+1) begin
            $display("%04h\t\t%04h\t\t%04h\t\t\t%01b",
            bram_activations[it], weights[it], bias[it], bram_valid);
        end
            
        $display("\nACT_O\t\tNEURON_ID_O\t\tVALID_ACT_O");
        for (it = 0; it < `FC2_N_KERNELS; it=it+1) begin
            $display("%04h\t\t%02d\t\t\t\t%01b",
            activation_o[it], neuron_id_o[it], valid_act_o);
        end        
     end
    `endif

    always_ff @(posedge clk) begin
        if (rst) begin
            kern_activations    <= 0;
            kern_valid          <= 0;
            kern_has_bias       <= 0;
            kern_bias           <= 0;
            kern_neuron_id      <= 0;
            weights             <= 0;
        end
        else begin
            kern_activations    <= bram_activations;
            kern_valid          <= bram_valid;
            kern_has_bias       <= bram_has_bias;
            kern_bias           <= 0;//bias;
            kern_neuron_id      <= neuron_id;
            weights             <= data_out;
        end
    end
    
    logic [`FC2_N_KERNELS - 1: 0][15: 0]    kern_mult1;
    logic [`FC2_N_KERNELS - 1: 0][15: 0]    kern_mult2;
    
    assign kern_mult1   = (forward) ? weights           : b_kern_grad;
    assign kern_mult2   = (forward) ? kern_activations  : b_kern_act; 

    // Computational kernel for the fully connected layer    
    genvar i;
    generate
        for (i = 0; i < `FC2_N_KERNELS; i=i+1) begin
            fc_kernel #(.FAN_IN(`FC2_FAN_IN), .ID_WIDTH(4)) fc_kernel_i (
                // input
                .clk(clk),
                .rst(rst),
                .activation_i(kern_mult2[i]),
                .weight(kern_mult1[i]),
                .bias(kern_bias[i]),
                .neuron_id_i(kern_neuron_id[i]),
                .has_bias(kern_has_bias),
                .valid_i(kern_valid),
                .b_valid_i(b_kern_valid),
                // output
                .b_gradient_o(b_kern_grad_o[i]),
                .b_valid_o(b_kern_valid_o[i]),
                .activation_o(activation_o[i]),
                .neuron_id_o(neuron_id_o[i]),
                .valid_o(valid[i])
            );
        end
    endgenerate    
     
    assign valid_act_o = &valid;
   

   // Backward pass logic
    always_ff @(posedge clk) begin
        if (rst) begin
            b_kern_grad     <= 0;
            b_kern_act      <= 0;
            b_act_id        <= 0;
            b_neuron_id     <= 0;            
            b_act_id_pl     <= 0;
            b_neuron_id_pl  <= 0;
            b_kern_valid    <= 0;            
        end
        else begin
            b_kern_grad     <= b_gradient_i;
            b_kern_act      <= b_activation_i;
            b_act_id        <= b_activation_id;
            b_neuron_id     <= b_neuron_id_i;
            b_act_id_pl     <= b_act_id;
            b_neuron_id_pl  <= b_neuron_id;
            b_kern_valid    <= b_valid_i;
        end
    end
        
    
endmodule
