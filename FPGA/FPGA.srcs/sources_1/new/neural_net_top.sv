`timescale 1ns / 1ps
`include "sys_defs.vh"

module neural_net_top(
    inout [14:0]DDR_addr,
    inout [2:0]DDR_ba,
    inout DDR_cas_n,
    inout DDR_ck_n,
    inout DDR_ck_p,
    inout DDR_cke,
    inout DDR_cs_n,
    inout [3:0]DDR_dm,
    inout [31:0]DDR_dq,
    inout [3:0]DDR_dqs_n,
    inout [3:0]DDR_dqs_p,
    inout DDR_odt,
    inout DDR_ras_n,
    inout DDR_reset_n,
    inout DDR_we_n,
    inout FIXED_IO_ddr_vrn,
    inout FIXED_IO_ddr_vrp,
    inout [53:0]FIXED_IO_mio,
    inout FIXED_IO_ps_clk,
    inout FIXED_IO_ps_porb,
    inout FIXED_IO_ps_srstb,

    input                       rst,
    input           [7: 0]      sw_in,
    input                       clock_in,
    output  logic   [7: 0]      led_o
    );
    
    logic                                   fab_clk;
    logic                                   clk;


    logic                                   forward;
    // Logics for the fc0 layer
    logic                                   fc0_start;
    logic [`FC0_N_KERNELS - 1: 0][`PREC - 1: 0]    fc0_activation_i;
    logic                                   fc0_valid;
    logic                                   fc0_valid_i;    
    logic [`FC0_NEURONS - 1: 0][`PREC - 1: 0]      fc0_activation_o ;
    logic [`FC0_NEURONS - 1: 0][6: 0]       fc0_neuron_id_o ;
    logic                                   fc0_valid_act_o; 
    logic                                   fc0_busy;    
    logic [`FC0_NEURONS - 1: 0][`PREC - 1: 0]      fc0_gradients;
    logic                                   fc0_grad_valid; 

    
    // Logics for the fc1 layer    
    logic                                   fc1_start;
    logic [`FC1_N_KERNELS - 1: 0][`PREC - 1: 0]    fc1_activation_i ;
    logic                                   fc1_valid_i;    
    logic [`FC1_N_KERNELS - 1: 0][6: 0]     fc1_neuron_id_i; 
    logic [`FC1_N_KERNELS - 1: 0][`PREC - 1: 0]    fc1_activation_o;
    logic [`FC1_N_KERNELS - 1: 0][5: 0]     fc1_neuron_id_o ;
    logic                                   fc1_valid_act_o;
    logic                                   fc1_buff_rdy; 
    logic                                   fc1_busy;   
    logic                                   fc1_grad_valid; 

     // Logics for the fc2 layer (the last fc layer)
    logic                                   fc2_start;
    logic                                   fc2_buff_rdy;
    logic [`FC2_N_KERNELS - 1: 0][`PREC - 1: 0]    fc2_activation_i;
    logic [`FC2_N_KERNELS - 1: 0][5: 0]     fc2_neuron_id_i;
    logic                                   fc2_valid_i;
    logic                                   fc2_busy;

    logic [`FC2_N_KERNELS - 1: 0][`PREC - 1: 0]    fc2_activation_o;
    logic [`FC2_N_KERNELS - 1: 0][3: 0]     fc2_neuron_id_o;
    logic                                   fc2_valid_o;       
    logic [`FC2_NEURONS - 1: 0][`PREC - 1: 0]      fc2_act_o_buf;
    logic                                   fc2_buf_valid; 
    
    // Backward pass logics
    logic [`FC0_N_KERNELS - 1: 0][`PREC - 1: 0]    fc0_b_gradient_i;
    logic [`FC0_N_KERNELS - 1: 0][`PREC - 1: 0]    fc0_b_activation_i;
    logic [9: 0]                            fc0_b_activation_id_i;
    logic [9: 0]                            fc0_b_activation_id_o;
    logic [`FC0_N_KERNELS - 1: 0][6: 0]     fc0_b_neuron_id_i;
    logic                                   fc0_b_valid_i;
    logic                                   fc0_b_start;
    logic                                   fc0_b_start_r;
    logic [3: 0]                            fc0_loops;
    logic [`FC0_N_KERNELS - 1: 0][`PREC - 1: 0]    fc0_gradients_i;
    logic                                   fc0_gradients_rdy;
    logic [6: 0]                            fc0_n_loop_offset;
    logic                                   fc0_bp_done;
    logic                                   fc0_update;
    logic                                   fc0_update_done;
          

   
    logic [`FC1_N_KERNELS - 1: 0][`PREC - 1: 0]    fc1_b_gradient_i;
    logic [`PREC - 1: 0]                           fc1_b_activation_i;
    logic [6: 0]                            fc1_b_activation_id_i;
    logic [6: 0]                            fc1_b_activation_id_o;
    logic [`FC1_N_KERNELS - 1: 0][5: 0]     fc1_b_neuron_id_i;
    logic                                   fc1_b_valid_i;
    logic                                   fc1_b_start;
    logic                                   fc1_b_start_r;
    logic [3: 0]                            fc1_loops;
    logic [`FC1_NEURONS - 1: 0][`PREC - 1: 0]      fc1_gradients;
    logic [`FC1_N_KERNELS - 1: 0][`PREC - 1: 0]    fc1_gradients_i;
    logic                                   fc1_gradients_rdy;
    logic [5: 0]                            fc1_n_offset;
    logic [5: 0]                            fc1_n_loop_offset;
    logic                                   fc1_bp_mode;   
    logic                                   fc1_bp_done;    
    logic                                   fc1_update;
    logic                                   fc1_update_done;
          

   
    logic [`FC2_N_KERNELS - 1: 0][`PREC - 1: 0]    fc2_b_gradient_i;
    logic [`PREC - 1: 0]                           fc2_b_activation_i;
    logic [5: 0]                            fc2_b_activation_id_i;
    logic [5: 0]                            fc2_b_activation_id_o;
    logic [`FC2_N_KERNELS - 1: 0][3: 0]     fc2_b_neuron_id_i;
    logic                                   fc2_b_valid_i;
    logic                                   fc2_b_start;
    logic                                   fc2_b_start_r;
    logic [3: 0]                            fc2_loops;
    logic [`FC2_NEURONS - 1: 0][`PREC - 1: 0]      fc2_gradients;
    logic [`FC2_N_KERNELS - 1: 0][`PREC - 1: 0]    fc2_gradients_i;
    logic                                   fc2_gradients_rdy;
    logic [3: 0]                            fc2_n_offset;
    logic                                   fc2_bp_mode; 
    logic                                   fc2_bp_done;
    logic                                   fc2_update;
    logic                                   fc2_update_done;
    
    logic [7: 0]                            img1_unpacked[784];
    logic new_img;



    
    logic [9:0]epoch;
    logic [16:0] img_id;
    logic [4: 0] lrate_shifts;
    logic [4: 0] lrate_shifts_bus;
    logic [31: 0] active_cycles;
    logic [31: 0] idle_cycles;
    logic         training_mode;
    logic         training_mode_bus;
    logic [16:0]  img_set_size;

    logic [16:0]img1_id;
    logic [9:0] img1_label;
    logic [9:0] n_epochs;
    logic [16:0]num_correct_test;
    logic [16:0]num_correct_train;
    logic start;
    logic start_bus;
    
    // Layer States
    logic [2: 0]    fc0_state;
    logic [2: 0]    next_fc0_state;
    logic [2: 0]    fc1_state;
    logic [2: 0]    next_fc1_state;
    logic [2: 0]    fc2_state;
    logic [2: 0]    next_fc2_state;
    
    localparam sf = 2.0**-12.0;
    localparam sf2 = 2.0**-12.0;
    
    // Backward pass states
    localparam WEIGHT_MODE = 0;
    localparam NEURON_MODE = 1;
    
    // Layer states
    localparam FORWARD  = 1;
    localparam WAITING  = 2;
    localparam BACKWARD = 3;
    localparam UPDATE   = 4;
    localparam IDLE     = 5;

    logic all_idle;
    
        
    logic [9: 0]        input_addr;
    logic [`PREC - 1: 0]       net_input_bram_dout_a;
    logic [`PREC - 1: 0]       net_input_bram_dout_b;
    logic [`PREC - 1: 0]       input_data_a;
    logic [`PREC - 1: 0]       input_data_b;
    logic [9: 0]        img_label;
    logic               img_rdy;  
    logic               epoch_fin;
    mmcm_50_mhz mmcm_50_mhz_i (
        //.clk_in1(fab_clk),
        .clk_in1(clock_in),
        .clk_out1(clk)
    );
    
    logic sim;
    logic [7: 0] sw_i;
    
    assign sw_i = sw_in;

    
    assign start        = sw_i[0] ? 1'b1 : start_bus;
    assign training_mode = sw_i[0] ? 1'b1 : training_mode_bus;
    assign forward      = fc0_state == FORWARD || fc1_state == FORWARD || fc2_state == FORWARD;
    assign all_idle     = (fc0_state == IDLE) && (fc1_state == IDLE) && (fc2_state == IDLE);
    assign img_rdy      = (img1_id == (img_id + 1'b1)) | (img1_id == 0 && img_id == img_set_size);
    assign new_img      = start & all_idle & img_rdy;
    assign epoch_fin    = sw_i[0] ? 1'b0 : epoch == n_epochs;
    
    logic reset_i;
    logic reset;
    always_ff @(posedge clk) begin
        reset_i   <= rst;
    end
    
    always_ff @(posedge clk) begin
        if (reset || !start) begin
            idle_cycles     <= 0;
            active_cycles   <= 0;            
        end
        else begin
            idle_cycles     <= idle_cycles + all_idle;
            active_cycles   <= all_idle ? active_cycles : active_cycles + 1'b1;
        end
    end
    
    BUFG BUFG_reset(.I(reset_i), .O(reset));
    
    always_ff @(posedge clk) begin
        if (reset) begin
            input_addr  <= 0;
            fc0_start   <= 0;
        end
        else if (fc0_state == FORWARD & !fc0_start && ~epoch_fin) begin
            fc0_start   <= 1'b1;
            input_addr  <= 0;
        end
        else if (fc0_state == FORWARD & fc0_start) begin
            input_addr  <= input_addr + 1'b1;
        end
        else begin
            fc0_start   <= 1'b0;
            input_addr  <= 0;
        end
    end
    
    

    logic correct;
    logic [12: 0] fc0_ptr_a;
    logic [12: 0] fc0_ptr_b;
    logic [9: 0] fc0_addr_a;
    logic [9: 0] fc0_addr_b;
    assign fc0_addr_a = (forward) ? input_addr << 1 : fc0_b_activation_id_i << 1; 
    assign fc0_addr_b = fc0_addr_a + 1'b1;
    

    net_input_bram net_input_bram_i (
        .addra(fc0_addr_a),
        .clka(clk),
        .dina(23'b0),
        .douta(net_input_bram_dout_a),
        .ena(1'b1),
        .wea(1'b0),
        
        .addrb(fc0_addr_b),
        .clkb(clk),
        .dinb(23'b0),
        .doutb(net_input_bram_dout_b),
        .enb(1'b1),
        .web(1'b0)
    );    

  
        
    logic [16: 0] prev_img_id;
    always_ff @(posedge clk) begin
        if (reset) begin
            prev_img_id <= img_set_size;
        end
        else begin
            prev_img_id <= img_id;
        end

              
        if (reset || (img_id == 0 && prev_img_id != 0)) begin
            num_correct_train <= 0;
            num_correct_test  <= 0;
        end
        else if (correct) begin
            num_correct_train <= (~training_mode) ?
                                    num_correct_train : num_correct_train + 1'b1;
            num_correct_test  <= (training_mode) ? 
                                    num_correct_test : num_correct_test + 1'b1;
        end
        
        if (reset) begin
            epoch   <= 0;
        end
        else if (img_id == 0 && prev_img_id != 0) begin
            epoch   <= epoch + 1'b1; 
        end
    end
    
    
    always_comb begin
        input_data_a    <= sw_i[0] ? net_input_bram_dout_a  : 
                            {6'b0, img1_unpacked[fc0_addr_a], 9'b0};
        input_data_b    <= sw_i[0] ? net_input_bram_dout_b : 
                            {6'b0, img1_unpacked[fc0_addr_b], 9'b0};
    end

   
    always_ff @(posedge clk) begin
        if (reset) begin
            fc0_activation_i    <= 0;
            fc0_valid           <= 0;
            fc0_valid_i         <= 0;
        end
        else begin
            fc0_activation_i    <= {{`FC0_NEURONS{input_data_b}}, {`FC0_NEURONS{input_data_a}}};
            fc0_valid           <= fc0_start;
            fc0_valid_i         <= fc0_valid;
        end
    end
    
    
    assign fc0_b_activation_i   = {{`FC0_NEURONS{input_data_b}}, {`FC0_NEURONS{input_data_a}}};
    assign fc0_gradients_rdy    = fc0_grad_valid; 
    // Start when backward is good and gradients are ready. Only do backprop once   
    assign fc0_b_start = fc0_state == BACKWARD;
    bit [7: 0] q, r;
    always_ff @(posedge clk) begin
        if (reset) begin
            fc0_b_start_r   <= 1'b0;
        end
        else begin
            fc0_b_start_r   <= fc0_b_start;
        end
        
        // Loop over fan in
        if (reset) begin
            fc0_loops   <= 0;
        end
        else if (fc0_state != BACKWARD) begin
            fc0_loops   <= 0;
        end
        else if (fc0_b_activation_id_i == (`FC0_KERNEL_FAN_IN - 1)) begin
            fc0_loops   <= fc0_loops + 1'b1;
        end
        
        if (reset) begin
            fc0_b_activation_id_i <= 0;       
        end
        else if (fc0_state != BACKWARD) begin
            fc0_b_activation_id_i <= 0;
        end
        else if (fc0_b_start) begin
            fc0_b_activation_id_i <= (fc0_b_activation_id_i == (`FC0_KERNEL_FAN_IN - 1'b1)) ? 
                                        0 : fc0_b_activation_id_i + 1'b1;
        end
        
        for (q = 0, r = `FC0_PORT_WIDTH; q < `FC0_PORT_WIDTH; q=q+1, r=r+1) begin
            fc0_gradients_i[q]      <= fc0_gradients[q];
            fc0_gradients_i[r]      <= fc0_gradients[q];
            fc0_b_neuron_id_i[q]    <= q;      
            fc0_b_neuron_id_i[r]    <= q;
        end
        fc0_b_activation_id_o       <= fc0_b_activation_id_i << 1;
    end
    always_comb begin
        case(fc0_state)
            FORWARD:
                next_fc0_state  = fc1_buff_rdy & training_mode 
                                                        ? WAITING   :  
                                  fc1_buff_rdy & ~training_mode
                                                        ? IDLE      : FORWARD;                                     
            WAITING:
                next_fc0_state  = (fc0_gradients_rdy)   ? BACKWARD  : WAITING;              
            BACKWARD:
                next_fc0_state  = (fc0_bp_done)         ? UPDATE    : BACKWARD;
            UPDATE:
                next_fc0_state  = (fc0_update_done)     ? IDLE      : UPDATE;
            IDLE:
                next_fc0_state  = (new_img | sw_i[0])   ? FORWARD   : IDLE ;
            default:
                next_fc0_state  = IDLE;
        endcase     
    end
    always_ff @(posedge clk) begin
        if (reset) begin
            fc0_state   <= IDLE;
        end
        else begin
            $display("fc0 state: %01d", fc0_state);
            $display("fc1 state: %01d", fc1_state);
            $display("fc2 state: %01d", fc2_state);
            fc0_state   <= next_fc0_state;           
        end
    end
    
    assign fc0_update = fc0_state == UPDATE;
    // FC0  
    fc0_layer fc0_layer_i (
        // inputs
        .clk(clk),
        .rst(reset),    
        .forward(forward),
        .update(fc0_update),
        .activations_i(fc0_activation_i),
        .valid_i(fc0_valid_i & forward),
        .lrate_shifts(lrate_shifts),
         
        // backward pass inputs
        .b_gradient_i(fc0_gradients_i),
        .b_activation_i(fc0_b_activation_i),
        .b_activation_id(fc0_b_activation_id_o),
        .b_neuron_id_i(fc0_b_neuron_id_i),
        .b_valid_i(fc0_b_start_r),
       
        // outputs
        .activation_o(fc0_activation_o),
        .neuron_id_o(fc0_neuron_id_o),
        .valid_act_o(fc0_valid_act_o),
        .fc0_busy(fc0_busy),
        .bp_done(fc0_bp_done),
        .update_done(fc0_update_done)
    );
    
    always_ff @(posedge clk) begin
        if (reset) begin
            fc1_start   <= 1'b0;
        end
        else begin
            fc1_start   <= fc1_state == FORWARD & fc1_buff_rdy;
        end
    end 
    interlayer_activation_buffer
    #(.N_KERNELS_I(`FC0_NEURONS), 
        .N_KERNELS_O(`FC1_N_KERNELS), 
        .ID_WIDTH(7), 
        .BUFF_SIZE(`FC0_NEURONS),
        .LOOPS(4)) 
    interlayer_activations_fc0_fc1 (
        // inputs
        .clk(clk),
        .rst(reset),
        
        .start(fc1_start),
        .activation_i(fc0_activation_o),
        .neuron_id_i(fc0_neuron_id_o),
        .valid_act_i(fc0_valid_act_o & forward),
        .b_ptr(fc1_b_activation_id_i),
        // outputs
        .activation_o(fc1_activation_i),
        .neuron_id_o(fc1_neuron_id_i),
        .valid_o(fc1_valid_i),
        
        .b_act_o(fc1_b_activation_i),
        
        .buff_rdy(fc1_buff_rdy)
    );
    
    
    
    assign fc1_gradients_rdy    = fc1_grad_valid;    
    assign fc1_n_offset         = (fc1_loops >= `FC1_MODE_SWITCH) ? fc1_loops - 4 : fc1_loops;
    // Start when backward is good and gradients are ready. Only do backprop once   
    assign fc1_b_start = fc1_state == BACKWARD;
    bit [5: 0] o, p;
    always_ff @(posedge clk) begin
        if (reset) begin
            fc1_b_start_r   <= 1'b0;
            fc1_bp_mode     <= 1'b0;
        end
        else begin
            fc1_b_start_r   <= fc1_b_start;
            fc1_bp_mode     <= fc1_loops >= `FC1_MODE_SWITCH ? WEIGHT_MODE : NEURON_MODE;
        end
        
        // Loop over fan in
        if (reset) begin
            fc1_loops   <= 0;
        end
        else if (fc1_state != BACKWARD) begin
            fc1_loops   <= 0;
        end
        else if (fc1_b_activation_id_i == (`FC0_NEURONS - 1)) begin
            fc1_loops   <= fc1_loops + 1'b1;
        end
        
        if (reset) begin
            fc1_b_activation_id_i <= 0;       
        end
        else if (fc1_state != BACKWARD) begin
            fc1_b_activation_id_i <= 0;
        end
        else if (fc1_b_start) begin
            fc1_b_activation_id_i <= (fc1_b_activation_id_i == (`FC1_FAN_IN - 1'b1)) ? 
                                        0 : fc1_b_activation_id_i + 1'b1;
        end
        
        for (p = 0, o = `FC1_PORT_WIDTH; p < `FC1_PORT_WIDTH; p=p+1, o=o+1) begin
            fc1_gradients_i[p]      <= fc1_gradients[(fc1_n_offset << 3) + p];
            fc1_gradients_i[o]      <= fc1_gradients[((fc1_n_offset << 3) + p) | 6'd32];
            fc1_b_neuron_id_i[p]    <= (fc1_n_offset << 3) + p;      
            fc1_b_neuron_id_i[o]    <= ((fc1_n_offset << 3) + p) | 6'd32;
        end
        fc1_b_activation_id_o   <= fc1_b_activation_id_i;
    end

    always_comb begin
        case(fc1_state)
            FORWARD:
                next_fc1_state  = fc2_buff_rdy & training_mode 
                                                        ? WAITING   :  
                                  fc2_buff_rdy & ~training_mode
                                                        ? IDLE      : FORWARD;                                       
            WAITING:
                next_fc1_state  = (fc1_gradients_rdy)   ? BACKWARD  : WAITING;              
            BACKWARD:
                next_fc1_state  = (fc1_bp_done)         ? UPDATE    : BACKWARD;
            UPDATE:
                next_fc1_state  = (fc1_update_done)     ? IDLE      : UPDATE;
            IDLE:
                next_fc1_state  = (new_img | sw_i[0])   ? FORWARD   : IDLE ;
            default:
                next_fc1_state  = IDLE;
        endcase     
    end
    always_ff @(posedge clk) begin
        if (reset) begin
            fc1_state   <= IDLE;
        end
        else begin
            $display("fc1 state: %01d", fc1_state);
            fc1_state   <= next_fc1_state;           
        end
    end
    
    assign fc1_update = fc1_state == UPDATE;
    // FC1   
    fc1_layer fc1_layer_i (
        // inputs
        .clk(clk),
        .rst(reset),    
        .forward(forward), 
        .update(fc1_update),
        .activations_i(fc1_activation_i),
        .valid_i(fc1_valid_i & forward),        
        .lrate_shifts(lrate_shifts),
        
        // backward pass inputs
        .b_gradient_i(fc1_gradients_i),
        .b_activation_i({`FC1_N_KERNELS{fc1_b_activation_i}}),
        .b_activation_id(fc1_b_activation_id_o),
        .b_neuron_id_i(fc1_b_neuron_id_i),
        .b_valid_i(fc1_b_start_r),
        .bp_mode(fc1_bp_mode),

        // outputs
        .activation_o(fc1_activation_o),
        .neuron_id_o(fc1_neuron_id_o),
        .valid_act_o(fc1_valid_act_o),
        .fc1_busy(fc1_busy), 
        .bp_done(fc1_bp_done),
        .update_done(fc1_update_done),
        
        // backward pass outputs
        .pl_gradients(fc0_gradients),
        .pl_grad_valid(fc0_grad_valid) 
    );
    
         
    always_ff @(posedge clk) begin
        if (reset) begin
            fc2_start   <= 1'b0;
        end
        else begin
            $display("fc2_buff_rdy: %01b\tfc2_busy: %01b", fc2_buff_rdy, fc2_busy);
            fc2_start   <= fc2_state == FORWARD & fc2_buff_rdy;
        end
    end 
 

    interlayer_activation_buffer
    #(.N_KERNELS_I(`FC1_N_KERNELS), 
        .N_KERNELS_O(`FC2_N_KERNELS), 
        .ID_WIDTH(6), 
        .BUFF_SIZE(`FC1_NEURONS),
        .LOOPS(`FC2_NEURONS)) 
    interlayer_activations_fc1_fc2 (
        // inputs
        .clk(clk),
        .rst(reset),
        
        .start(fc2_start),
        .activation_i(fc1_activation_o),
        .neuron_id_i(fc1_neuron_id_o),
        .valid_act_i(fc1_valid_act_o & forward),
        .b_ptr(fc2_b_activation_id_i),
        // outputs
        
        .activation_o(fc2_activation_i),
        .neuron_id_o(fc2_neuron_id_i),
        .valid_o(fc2_valid_i),
        
        .b_act_o(fc2_b_activation_i),
        
        .buff_rdy(fc2_buff_rdy)
    );
    
    always_comb begin
        case(fc2_state)
            FORWARD:
                next_fc2_state  = fc2_buf_valid & training_mode 
                                                        ? WAITING   :  
                                  fc2_buf_valid & ~training_mode
                                                        ? IDLE      : FORWARD;                             
            WAITING:
                next_fc2_state  = (fc2_gradients_rdy)   ? BACKWARD  : WAITING;              
            BACKWARD:
                next_fc2_state  = (fc2_bp_done)         ? UPDATE    : BACKWARD;
            UPDATE:
                next_fc2_state  = (fc2_update_done)     ? IDLE      : UPDATE;
            IDLE:
                next_fc2_state  = (new_img | sw_i[0])   ? FORWARD   : IDLE;
            default:
                next_fc2_state  = IDLE;
        endcase     
    end
    always_ff @(posedge clk) begin
        if (reset) begin
            fc2_state   <= IDLE;
        end
        else begin
            fc2_state   <= next_fc2_state;           
        end
    end    

    

    
    assign fc2_n_offset = (fc2_loops >= `FC2_MODE_SWITCH) ? fc2_loops - 5 : fc2_loops;

    // Start when backward is good and gradients are ready. Only do backprop once   
    assign fc2_b_start = fc2_state == BACKWARD;
    always_ff @(posedge clk) begin
        if (reset) begin
            fc2_b_start_r   <= 1'b0;
            fc2_bp_mode     <= 1'b0;
        end
        else begin
            fc2_b_start_r   <= fc2_b_start;
            fc2_bp_mode     <= fc2_loops >= `FC2_MODE_SWITCH ? WEIGHT_MODE : NEURON_MODE;
        end
        
        // Loop over fan in
        if (reset) begin
            fc2_loops   <= 0;
        end
        else if (fc2_state != BACKWARD) begin
            fc2_loops   <= 0;
        end
        else if (fc2_b_activation_id_i == (`FC1_NEURONS - 1)) begin
            fc2_loops   <= fc2_loops + 1'b1;
        end
        
        
        if (reset) begin
            fc2_b_activation_id_i <= 0;       
        end
        else if (fc2_state != BACKWARD) begin
            fc2_b_activation_id_i <= 0;
        end
        else if (fc2_b_start) begin
            fc2_b_activation_id_i <= fc2_b_activation_id_i + 1'b1;
        end
        fc2_gradients_i         <= {fc2_gradients[fc2_n_offset + 5], fc2_gradients[fc2_n_offset]};
        fc2_b_neuron_id_i       <= {fc2_n_offset + 5, fc2_n_offset};
        fc2_b_activation_id_o   <= fc2_b_activation_id_i;
    end
    
    assign fc2_update = fc2_state == UPDATE;
    // FC2, fed directly from FC1 due to the small size
    fc2_layer fc2_layer_i (
        // inputs
        .clk(clk),
        .rst(reset),
        .forward(forward),
        .update(fc2_update),
        .activations_i(fc2_activation_i),
        .valid_i(fc2_valid_i & forward),
        .lrate_shifts(lrate_shifts),
       
        // backward pass inputs
        .b_gradient_i(fc2_gradients_i),
        .b_activation_i({fc2_b_activation_i, fc2_b_activation_i}),
        .b_activation_id(fc2_b_activation_id_o),
        .b_neuron_id_i(fc2_b_neuron_id_i),
        .b_valid_i(fc2_b_start_r),
        .bp_mode(fc2_bp_mode),
    
        // outputs
        .activation_o(fc2_activation_o),
        .neuron_id_o(fc2_neuron_id_o),
        .valid_act_o(fc2_valid_o),
        .fc2_busy(fc2_busy),
        .bp_done(fc2_bp_done),
        .update_done(fc2_update_done),
        
        // backward pass outputs
        .pl_gradients(fc1_gradients),
        .pl_grad_valid(fc1_grad_valid)
    );






    bit [`FC2_N_KERNELS - 1: 0] m;
    logic prev_fc2_buf_valid;
    always_ff @(posedge clk) begin
        if (reset) begin
            prev_fc2_buf_valid  <= 0;
            fc2_act_o_buf       <= 0;
        end
        else begin
            prev_fc2_buf_valid  <= fc2_buf_valid;
            for (m = 0; m < `FC2_N_KERNELS; m=m+1) begin
                if (fc2_valid_o && forward) begin
                    fc2_act_o_buf[fc2_neuron_id_o[m]]  <= fc2_activation_o[m];
                end 
            end
        end
        
        if (reset) begin
            fc2_buf_valid   <= 1'b0;
        end
        else if (fc2_valid_o) begin
            fc2_buf_valid   <= fc2_neuron_id_o[`FC2_N_KERNELS - 1] == `FC2_NEURONS - 1;
        end
        else if (fc2_state == IDLE) begin
            fc2_buf_valid   <= 1'b0;
        end
    end
    
    logic [`FC2_NEURONS - 1: 0][`PREC - 1: 0] fc2_out;
    always @(posedge clk) begin
        if (fc2_buf_valid) begin
            fc2_out <= fc2_act_o_buf;
        end
    end
    
    
    
    
    // LED Logic
    logic [4: 0][`PREC - 1: 0] max1;
    logic [2: 0][`PREC - 1: 0] max2;
    logic [1: 0][`PREC - 1: 0] max3;    
    logic [`PREC - 1: 0]       max4;   
    logic [`PREC - 1: 0]       max;
    logic [4: 0]        max_valid;
    
    bit [3: 0] k;
    bit [3: 0] j;
    logic [7: 0] led_o_r;
    always_ff @(posedge clk) begin
        if (reset) begin
            max         <= 0;
            max_valid   <= 0;
        end
        else if ({fc2_buf_valid, prev_fc2_buf_valid} == 2'b10) begin 
            for (k = 0; k < 5; k=k+1) begin
                max1[k] <= $signed(fc2_act_o_buf[2*k]) > $signed(fc2_act_o_buf[2*k+1]) ? 
                            fc2_act_o_buf[2*k] : fc2_act_o_buf[2*k + 1];
            end
            max_valid       <= {max_valid[3: 0], 1'b1};
        end
        else begin
            max_valid[0]    <= 1'b0;
            
            max2[0]         <= $signed(max1[0]) > $signed(max1[1]) ? max1[0] : max1[1];
            max2[1]         <= $signed(max1[2]) > $signed(max1[3]) ? max1[2] : max1[3];
            max2[2]         <= max1[4];
            max_valid[1]    <= max_valid[0];
            
            max3[0]         <= $signed(max2[0]) > $signed(max2[1]) ? max2[0] : max2[1];
            max3[1]         <= max2[2];
            max_valid[2]    <= max_valid[1];
            
            max4            <= $signed(max3[0]) > $signed(max3[1]) ? max3[0] : max3[1];
            max_valid[3]    <= max_valid[2];
            
            max             <= max4;
            max_valid[4]    <= max_valid[3];     
               

        end  
        $display("---MAX CIRCUIT---");  
        $display("max_valid: %05b", max_valid);
        $display("max: %0.4f", $itor($signed(max)) * sf);
        if (reset) begin
            led_o_r     <= 0;
            correct     <= 1'b0;
        end       
        else if (max_valid[4]) begin
            correct    <= fc2_act_o_buf[img_label] == max;
            for (j = 0; j < 8; j=j+1) begin
                led_o_r[j] <= fc2_act_o_buf[j] == max;
            end
        end
        else begin
            correct  <= 1'b0;
        end
        led_o[7:0]  <= led_o_r[7: 0];
    end
    
    logic                               sm_valid_o;
    logic [`FC2_NEURONS - 1: 0][`PREC - 1: 0]  sm_grad_o;
    softmax softmax_i (
        .clk(clk),
        .reset(reset),
        .start(max_valid[4]),
        .max(max),
        .act_in(fc2_act_o_buf),
        
        .valid_o(sm_valid_o),
        .grad_o(sm_grad_o)
    );
    
   /* assign fc2_gradients        = {16'h0700, 16'h0678, 16'h0531, 16'hFA00, 16'h0300,
                                    16'hF930, 16'hF712, 16'hF374, 16'h0538, 16'h0395};*/   
    bit [3: 0] u;                                        
    always_ff @(posedge clk) begin
        if (reset) begin
            fc2_gradients_rdy       <= 0;
        end
        else if (all_idle) begin
            fc2_gradients_rdy       <= 1'b0;
        end
        else if (sm_valid_o) begin
            fc2_gradients_rdy       <= 1'b1;
        end
        
        if (sm_valid_o) begin
            fc2_gradients               <= sm_grad_o;
            fc2_gradients[img_label]    <= $signed(sm_grad_o[img_label]) - $signed(`ONE);
        end
    end
    /*assign fc2_gradients        = {{9{16'h2000}}, 16'hE000};
    assign fc2_gradients_rdy    = 1'b1;*/    
    
    `ifdef DEBUG
     integer clk_cycle;
     integer it;

     always_ff @(posedge clk) begin
        if (reset) begin
            clk_cycle   <= 0;
        end
        else begin
            clk_cycle   <=  clk_cycle + 1'b1;
        end
        $display("\n\n------ CYCLE %04d ------", clk_cycle);
  /*
        $display("\n--- FC0 ---");
        $display("FC0_act_i: %04h\t\tFC0_valid_i: %01b", fc0_activation_i[0], fc0_valid_i);
        $display("ACT_O\t\tNEUR_ID\t\tVALID_O");
        for (it = 0; it < 10; it=it+1) begin
            $display("%04h\t\t%04d\t\t%01b", fc0_activation_o[it], fc0_neuron_id_o[it], fc0_valid_act_o);
        end        
        
        $display("\n--- FC1 ---");
        $display("FC1_act_i: %04h\t\tFC1_valid_i: %01b", fc1_activation_i[0], fc1_valid_i);
        $display("ACT_O\t\tNEUR_ID\t\tVALID_O");
        for (it = 0; it < `FC1_N_KERNELS; it=it+1) begin
            $display("%04h\t\t%04d\t\t%01b", fc1_activation_o[it], fc1_neuron_id_o[it], fc1_valid_act_o);
        end
        
        $display("\n--- FC2 ---");
        $display("fc2_act_i: %04h\t\tfc2_valid_i: %01b", fc2_activation_i[0], fc2_valid_i);
        $display("ACT_O\t\tNEUR_ID\t\tVALID_O");
        for (it = 0; it < `FC2_N_KERNELS; it=it+1) begin
            $display("%04h\t\t%04d\t\t%01b", fc2_activation_o[it], fc2_neuron_id_o[it], fc2_valid_o);
        end
        */    

        $display("---FC2 GRADIENTS---");    
        $display("img_label: %d", img_label);    
        for (it = 0; it < `FC2_NEURONS; it = it + 1) begin
            $display("%02d:\t%f", it, $itor($signed(fc2_gradients[it])) * sf2);
        end
        $display("--- FC2 OUT ---");        
        $display("fc2_buf_valid: %01b" , fc2_buf_valid);
        for (it= 0; it < `FC2_NEURONS; it=it+1) begin
            $display("%02d: %f", it, $itor($signed(fc2_act_o_buf[it])) * sf); 
        end
        $display("LEDS: %08b", led_o);
     end 
    `endif    
   
  logic [31: 0] status_block;
  assign status_block = {5'b0, led_o_r, fc0_state, fc1_state, fc2_state, forward, fc0_start,
                         fc1_start, fc2_start, fc0_busy, fc1_busy, fc2_busy, new_img, 
                         all_idle, img_rdy};
                         
    
  logic [31:0]img1_blk0_0;
  logic [31:0]img1_blk100_0;
  logic [31:0]img1_blk101_0;
  logic [31:0]img1_blk102_0;
  logic [31:0]img1_blk103_0;
  logic [31:0]img1_blk104_0;
  logic [31:0]img1_blk105_0;
  logic [31:0]img1_blk106_0;
  logic [31:0]img1_blk107_0;
  logic [31:0]img1_blk108_0;
  logic [31:0]img1_blk109_0;
  logic [31:0]img1_blk10_0;
  logic [31:0]img1_blk110_0;
  logic [31:0]img1_blk111_0;
  logic [31:0]img1_blk112_0;
  logic [31:0]img1_blk113_0;
  logic [31:0]img1_blk114_0;
  logic [31:0]img1_blk115_0;
  logic [31:0]img1_blk116_0;
  logic [31:0]img1_blk117_0;
  logic [31:0]img1_blk118_0;
  logic [31:0]img1_blk119_0;
  logic [31:0]img1_blk11_0;
  logic [31:0]img1_blk120_0;
  logic [31:0]img1_blk121_0;
  logic [31:0]img1_blk122_0;
  logic [31:0]img1_blk123_0;
  logic [31:0]img1_blk124_0;
  logic [31:0]img1_blk125_0;
  logic [31:0]img1_blk126_0;
  logic [31:0]img1_blk127_0;
  logic [31:0]img1_blk128_0;
  logic [31:0]img1_blk129_0;
  logic [31:0]img1_blk12_0;
  logic [31:0]img1_blk130_0;
  logic [31:0]img1_blk131_0;
  logic [31:0]img1_blk132_0;
  logic [31:0]img1_blk133_0;
  logic [31:0]img1_blk134_0;
  logic [31:0]img1_blk135_0;
  logic [31:0]img1_blk136_0;
  logic [31:0]img1_blk137_0;
  logic [31:0]img1_blk138_0;
  logic [31:0]img1_blk139_0;
  logic [31:0]img1_blk13_0;
  logic [31:0]img1_blk140_0;
  logic [31:0]img1_blk141_0;
  logic [31:0]img1_blk142_0;
  logic [31:0]img1_blk143_0;
  logic [31:0]img1_blk144_0;
  logic [31:0]img1_blk145_0;
  logic [31:0]img1_blk146_0;
  logic [31:0]img1_blk147_0;
  logic [31:0]img1_blk148_0;
  logic [31:0]img1_blk149_0;
  logic [31:0]img1_blk14_0;
  logic [31:0]img1_blk150_0;
  logic [31:0]img1_blk151_0;
  logic [31:0]img1_blk152_0;
  logic [31:0]img1_blk153_0;
  logic [31:0]img1_blk154_0;
  logic [31:0]img1_blk155_0;
  logic [31:0]img1_blk156_0;
  logic [31:0]img1_blk157_0;
  logic [31:0]img1_blk158_0;
  logic [31:0]img1_blk159_0;
  logic [31:0]img1_blk15_0;
  logic [31:0]img1_blk160_0;
  logic [31:0]img1_blk161_0;
  logic [31:0]img1_blk162_0;
  logic [31:0]img1_blk163_0;
  logic [31:0]img1_blk164_0;
  logic [31:0]img1_blk165_0;
  logic [31:0]img1_blk166_0;
  logic [31:0]img1_blk167_0;
  logic [31:0]img1_blk168_0;
  logic [31:0]img1_blk169_0;
  logic [31:0]img1_blk16_0;
  logic [31:0]img1_blk170_0;
  logic [31:0]img1_blk171_0;
  logic [31:0]img1_blk172_0;
  logic [31:0]img1_blk173_0;
  logic [31:0]img1_blk174_0;
  logic [31:0]img1_blk175_0;
  logic [31:0]img1_blk176_0;
  logic [31:0]img1_blk177_0;
  logic [31:0]img1_blk178_0;
  logic [31:0]img1_blk179_0;
  logic [31:0]img1_blk17_0;
  logic [31:0]img1_blk180_0;
  logic [31:0]img1_blk181_0;
  logic [31:0]img1_blk182_0;
  logic [31:0]img1_blk183_0;
  logic [31:0]img1_blk184_0;
  logic [31:0]img1_blk185_0;
  logic [31:0]img1_blk186_0;
  logic [31:0]img1_blk187_0;
  logic [31:0]img1_blk188_0;
  logic [31:0]img1_blk189_0;
  logic [31:0]img1_blk18_0;
  logic [31:0]img1_blk190_0;
  logic [31:0]img1_blk191_0;
  logic [31:0]img1_blk192_0;
  logic [31:0]img1_blk193_0;
  logic [31:0]img1_blk194_0;
  logic [31:0]img1_blk195_0;
  logic [31:0]img1_blk19_0;
  logic [31:0]img1_blk1_0;
  logic [31:0]img1_blk20_0;
  logic [31:0]img1_blk21_0;
  logic [31:0]img1_blk22_0;
  logic [31:0]img1_blk23_0;
  logic [31:0]img1_blk24_0;
  logic [31:0]img1_blk25_0;
  logic [31:0]img1_blk26_0;
  logic [31:0]img1_blk27_0;
  logic [31:0]img1_blk28_0;
  logic [31:0]img1_blk29_0;
  logic [31:0]img1_blk2_0;
  logic [31:0]img1_blk30_0;
  logic [31:0]img1_blk31_0;
  logic [31:0]img1_blk32_0;
  logic [31:0]img1_blk33_0;
  logic [31:0]img1_blk34_0;
  logic [31:0]img1_blk35_0;
  logic [31:0]img1_blk36_0;
  logic [31:0]img1_blk37_0;
  logic [31:0]img1_blk38_0;
  logic [31:0]img1_blk39_0;
  logic [31:0]img1_blk3_0;
  logic [31:0]img1_blk40_0;
  logic [31:0]img1_blk41_0;
  logic [31:0]img1_blk42_0;
  logic [31:0]img1_blk43_0;
  logic [31:0]img1_blk44_0;
  logic [31:0]img1_blk45_0;
  logic [31:0]img1_blk46_0;
  logic [31:0]img1_blk47_0;
  logic [31:0]img1_blk48_0;
  logic [31:0]img1_blk49_0;
  logic [31:0]img1_blk4_0;
  logic [31:0]img1_blk50_0;
  logic [31:0]img1_blk51_0;
  logic [31:0]img1_blk52_0;
  logic [31:0]img1_blk53_0;
  logic [31:0]img1_blk54_0;
  logic [31:0]img1_blk55_0;
  logic [31:0]img1_blk56_0;
  logic [31:0]img1_blk57_0;
  logic [31:0]img1_blk58_0;
  logic [31:0]img1_blk59_0;
  logic [31:0]img1_blk5_0;
  logic [31:0]img1_blk60_0;
  logic [31:0]img1_blk61_0;
  logic [31:0]img1_blk62_0;
  logic [31:0]img1_blk63_0;
  logic [31:0]img1_blk64_0;
  logic [31:0]img1_blk65_0;
  logic [31:0]img1_blk66_0;
  logic [31:0]img1_blk67_0;
  logic [31:0]img1_blk68_0;
  logic [31:0]img1_blk69_0;
  logic [31:0]img1_blk6_0;
  logic [31:0]img1_blk70_0;
  logic [31:0]img1_blk71_0;
  logic [31:0]img1_blk72_0;
  logic [31:0]img1_blk73_0;
  logic [31:0]img1_blk74_0;
  logic [31:0]img1_blk75_0;
  logic [31:0]img1_blk76_0;
  logic [31:0]img1_blk77_0;
  logic [31:0]img1_blk78_0;
  logic [31:0]img1_blk79_0;
  logic [31:0]img1_blk7_0;
  logic [31:0]img1_blk80_0;
  logic [31:0]img1_blk81_0;
  logic [31:0]img1_blk82_0;
  logic [31:0]img1_blk83_0;
  logic [31:0]img1_blk84_0;
  logic [31:0]img1_blk85_0;
  logic [31:0]img1_blk86_0;
  logic [31:0]img1_blk87_0;
  logic [31:0]img1_blk88_0;
  logic [31:0]img1_blk89_0;
  logic [31:0]img1_blk8_0;
  logic [31:0]img1_blk90_0;
  logic [31:0]img1_blk91_0;
  logic [31:0]img1_blk92_0;
  logic [31:0]img1_blk93_0;
  logic [31:0]img1_blk94_0;
  logic [31:0]img1_blk95_0;
  logic [31:0]img1_blk96_0;
  logic [31:0]img1_blk97_0;
  logic [31:0]img1_blk98_0;
  logic [31:0]img1_blk99_0;
  logic [31:0]img1_blk9_0;
  
  
system_wrapper system_wrapper_i
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    fab_clk,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    active_cycles,
    epoch,
    img_id,
    idle_cycles,
    img1_blk0_0,
    img1_blk100_0,
    img1_blk101_0,
    img1_blk102_0,
    img1_blk103_0,
    img1_blk104_0,
    img1_blk105_0,
    img1_blk106_0,
    img1_blk107_0,
    img1_blk108_0,
    img1_blk109_0,
    img1_blk10_0,
    img1_blk110_0,
    img1_blk111_0,
    img1_blk112_0,
    img1_blk113_0,
    img1_blk114_0,
    img1_blk115_0,
    img1_blk116_0,
    img1_blk117_0,
    img1_blk118_0,
    img1_blk119_0,
    img1_blk11_0,
    img1_blk120_0,
    img1_blk121_0,
    img1_blk122_0,
    img1_blk123_0,
    img1_blk124_0,
    img1_blk125_0,
    img1_blk126_0,
    img1_blk127_0,
    img1_blk128_0,
    img1_blk129_0,
    img1_blk12_0,
    img1_blk130_0,
    img1_blk131_0,
    img1_blk132_0,
    img1_blk133_0,
    img1_blk134_0,
    img1_blk135_0,
    img1_blk136_0,
    img1_blk137_0,
    img1_blk138_0,
    img1_blk139_0,
    img1_blk13_0,
    img1_blk140_0,
    img1_blk141_0,
    img1_blk142_0,
    img1_blk143_0,
    img1_blk144_0,
    img1_blk145_0,
    img1_blk146_0,
    img1_blk147_0,
    img1_blk148_0,
    img1_blk149_0,
    img1_blk14_0,
    img1_blk150_0,
    img1_blk151_0,
    img1_blk152_0,
    img1_blk153_0,
    img1_blk154_0,
    img1_blk155_0,
    img1_blk156_0,
    img1_blk157_0,
    img1_blk158_0,
    img1_blk159_0,
    img1_blk15_0,
    img1_blk160_0,
    img1_blk161_0,
    img1_blk162_0,
    img1_blk163_0,
    img1_blk164_0,
    img1_blk165_0,
    img1_blk166_0,
    img1_blk167_0,
    img1_blk168_0,
    img1_blk169_0,
    img1_blk16_0,
    img1_blk170_0,
    img1_blk171_0,
    img1_blk172_0,
    img1_blk173_0,
    img1_blk174_0,
    img1_blk175_0,
    img1_blk176_0,
    img1_blk177_0,
    img1_blk178_0,
    img1_blk179_0,
    img1_blk17_0,
    img1_blk180_0,
    img1_blk181_0,
    img1_blk182_0,
    img1_blk183_0,
    img1_blk184_0,
    img1_blk185_0,
    img1_blk186_0,
    img1_blk187_0,
    img1_blk188_0,
    img1_blk189_0,
    img1_blk18_0,
    img1_blk190_0,
    img1_blk191_0,
    img1_blk192_0,
    img1_blk193_0,
    img1_blk194_0,
    img1_blk195_0,
    img1_blk19_0,
    img1_blk1_0,
    img1_blk20_0,
    img1_blk21_0,
    img1_blk22_0,
    img1_blk23_0,
    img1_blk24_0,
    img1_blk25_0,
    img1_blk26_0,
    img1_blk27_0,
    img1_blk28_0,
    img1_blk29_0,
    img1_blk2_0,
    img1_blk30_0,
    img1_blk31_0,
    img1_blk32_0,
    img1_blk33_0,
    img1_blk34_0,
    img1_blk35_0,
    img1_blk36_0,
    img1_blk37_0,
    img1_blk38_0,
    img1_blk39_0,
    img1_blk3_0,
    img1_blk40_0,
    img1_blk41_0,
    img1_blk42_0,
    img1_blk43_0,
    img1_blk44_0,
    img1_blk45_0,
    img1_blk46_0,
    img1_blk47_0,
    img1_blk48_0,
    img1_blk49_0,
    img1_blk4_0,
    img1_blk50_0,
    img1_blk51_0,
    img1_blk52_0,
    img1_blk53_0,
    img1_blk54_0,
    img1_blk55_0,
    img1_blk56_0,
    img1_blk57_0,
    img1_blk58_0,
    img1_blk59_0,
    img1_blk5_0,
    img1_blk60_0,
    img1_blk61_0,
    img1_blk62_0,
    img1_blk63_0,
    img1_blk64_0,
    img1_blk65_0,
    img1_blk66_0,
    img1_blk67_0,
    img1_blk68_0,
    img1_blk69_0,
    img1_blk6_0,
    img1_blk70_0,
    img1_blk71_0,
    img1_blk72_0,
    img1_blk73_0,
    img1_blk74_0,
    img1_blk75_0,
    img1_blk76_0,
    img1_blk77_0,
    img1_blk78_0,
    img1_blk79_0,
    img1_blk7_0,
    img1_blk80_0,
    img1_blk81_0,
    img1_blk82_0,
    img1_blk83_0,
    img1_blk84_0,
    img1_blk85_0,
    img1_blk86_0,
    img1_blk87_0,
    img1_blk88_0,
    img1_blk89_0,
    img1_blk8_0,
    img1_blk90_0,
    img1_blk91_0,
    img1_blk92_0,
    img1_blk93_0,
    img1_blk94_0,
    img1_blk95_0,
    img1_blk96_0,
    img1_blk97_0,
    img1_blk98_0,
    img1_blk99_0,
    img1_blk9_0,
    img1_id,
    img1_label,
    img_set_size,
    lrate_shifts_bus,
    n_epochs,
    num_correct_test,
    num_correct_train,
    {9'b0, fc2_out[0]},
    {9'b0, fc2_out[2]},
    {9'b0, fc2_out[4]},
    {9'b0, fc2_out[6]},
    {9'b0, fc2_out[8]},
    start_bus,
    status_block,
    training_mode_bus);

    always_ff @(posedge clk) begin
        if (reset) begin
            img_id          <= img_set_size;
            img_label       <= 0;
            lrate_shifts    <= 0;
        end
        else if (new_img) begin
            img_id          <= img1_id;
            img_label       <= img1_label;
            lrate_shifts    <= lrate_shifts_bus;
        end
        if (new_img) begin
            img1_unpacked[0]	<= img1_blk0_0[7:0];
            img1_unpacked[1]	<= img1_blk0_0[15:8];
            img1_unpacked[2]	<= img1_blk0_0[23:16];
            img1_unpacked[3]	<= img1_blk0_0[31:24];
            img1_unpacked[4]	<= img1_blk1_0[7:0];
            img1_unpacked[5]	<= img1_blk1_0[15:8];
            img1_unpacked[6]	<= img1_blk1_0[23:16];
            img1_unpacked[7]	<= img1_blk1_0[31:24];
            img1_unpacked[8]	<= img1_blk2_0[7:0];
            img1_unpacked[9]	<= img1_blk2_0[15:8];
            img1_unpacked[10]	<= img1_blk2_0[23:16];
            img1_unpacked[11]	<= img1_blk2_0[31:24];
            img1_unpacked[12]	<= img1_blk3_0[7:0];
            img1_unpacked[13]	<= img1_blk3_0[15:8];
            img1_unpacked[14]	<= img1_blk3_0[23:16];
            img1_unpacked[15]	<= img1_blk3_0[31:24];
            img1_unpacked[16]	<= img1_blk4_0[7:0];
            img1_unpacked[17]	<= img1_blk4_0[15:8];
            img1_unpacked[18]	<= img1_blk4_0[23:16];
            img1_unpacked[19]	<= img1_blk4_0[31:24];
            img1_unpacked[20]	<= img1_blk5_0[7:0];
            img1_unpacked[21]	<= img1_blk5_0[15:8];
            img1_unpacked[22]	<= img1_blk5_0[23:16];
            img1_unpacked[23]	<= img1_blk5_0[31:24];
            img1_unpacked[24]	<= img1_blk6_0[7:0];
            img1_unpacked[25]	<= img1_blk6_0[15:8];
            img1_unpacked[26]	<= img1_blk6_0[23:16];
            img1_unpacked[27]	<= img1_blk6_0[31:24];
            img1_unpacked[28]	<= img1_blk7_0[7:0];
            img1_unpacked[29]	<= img1_blk7_0[15:8];
            img1_unpacked[30]	<= img1_blk7_0[23:16];
            img1_unpacked[31]	<= img1_blk7_0[31:24];
            img1_unpacked[32]	<= img1_blk8_0[7:0];
            img1_unpacked[33]	<= img1_blk8_0[15:8];
            img1_unpacked[34]	<= img1_blk8_0[23:16];
            img1_unpacked[35]	<= img1_blk8_0[31:24];
            img1_unpacked[36]	<= img1_blk9_0[7:0];
            img1_unpacked[37]	<= img1_blk9_0[15:8];
            img1_unpacked[38]	<= img1_blk9_0[23:16];
            img1_unpacked[39]	<= img1_blk9_0[31:24];
            img1_unpacked[40]	<= img1_blk10_0[7:0];
            img1_unpacked[41]	<= img1_blk10_0[15:8];
            img1_unpacked[42]	<= img1_blk10_0[23:16];
            img1_unpacked[43]	<= img1_blk10_0[31:24];
            img1_unpacked[44]	<= img1_blk11_0[7:0];
            img1_unpacked[45]	<= img1_blk11_0[15:8];
            img1_unpacked[46]	<= img1_blk11_0[23:16];
            img1_unpacked[47]	<= img1_blk11_0[31:24];
            img1_unpacked[48]	<= img1_blk12_0[7:0];
            img1_unpacked[49]	<= img1_blk12_0[15:8];
            img1_unpacked[50]	<= img1_blk12_0[23:16];
            img1_unpacked[51]	<= img1_blk12_0[31:24];
            img1_unpacked[52]	<= img1_blk13_0[7:0];
            img1_unpacked[53]	<= img1_blk13_0[15:8];
            img1_unpacked[54]	<= img1_blk13_0[23:16];
            img1_unpacked[55]	<= img1_blk13_0[31:24];
            img1_unpacked[56]	<= img1_blk14_0[7:0];
            img1_unpacked[57]	<= img1_blk14_0[15:8];
            img1_unpacked[58]	<= img1_blk14_0[23:16];
            img1_unpacked[59]	<= img1_blk14_0[31:24];
            img1_unpacked[60]	<= img1_blk15_0[7:0];
            img1_unpacked[61]	<= img1_blk15_0[15:8];
            img1_unpacked[62]	<= img1_blk15_0[23:16];
            img1_unpacked[63]	<= img1_blk15_0[31:24];
            img1_unpacked[64]	<= img1_blk16_0[7:0];
            img1_unpacked[65]	<= img1_blk16_0[15:8];
            img1_unpacked[66]	<= img1_blk16_0[23:16];
            img1_unpacked[67]	<= img1_blk16_0[31:24];
            img1_unpacked[68]	<= img1_blk17_0[7:0];
            img1_unpacked[69]	<= img1_blk17_0[15:8];
            img1_unpacked[70]	<= img1_blk17_0[23:16];
            img1_unpacked[71]	<= img1_blk17_0[31:24];
            img1_unpacked[72]	<= img1_blk18_0[7:0];
            img1_unpacked[73]	<= img1_blk18_0[15:8];
            img1_unpacked[74]	<= img1_blk18_0[23:16];
            img1_unpacked[75]	<= img1_blk18_0[31:24];
            img1_unpacked[76]	<= img1_blk19_0[7:0];
            img1_unpacked[77]	<= img1_blk19_0[15:8];
            img1_unpacked[78]	<= img1_blk19_0[23:16];
            img1_unpacked[79]	<= img1_blk19_0[31:24];
            img1_unpacked[80]	<= img1_blk20_0[7:0];
            img1_unpacked[81]	<= img1_blk20_0[15:8];
            img1_unpacked[82]	<= img1_blk20_0[23:16];
            img1_unpacked[83]	<= img1_blk20_0[31:24];
            img1_unpacked[84]	<= img1_blk21_0[7:0];
            img1_unpacked[85]	<= img1_blk21_0[15:8];
            img1_unpacked[86]	<= img1_blk21_0[23:16];
            img1_unpacked[87]	<= img1_blk21_0[31:24];
            img1_unpacked[88]	<= img1_blk22_0[7:0];
            img1_unpacked[89]	<= img1_blk22_0[15:8];
            img1_unpacked[90]	<= img1_blk22_0[23:16];
            img1_unpacked[91]	<= img1_blk22_0[31:24];
            img1_unpacked[92]	<= img1_blk23_0[7:0];
            img1_unpacked[93]	<= img1_blk23_0[15:8];
            img1_unpacked[94]	<= img1_blk23_0[23:16];
            img1_unpacked[95]	<= img1_blk23_0[31:24];
            img1_unpacked[96]	<= img1_blk24_0[7:0];
            img1_unpacked[97]	<= img1_blk24_0[15:8];
            img1_unpacked[98]	<= img1_blk24_0[23:16];
            img1_unpacked[99]	<= img1_blk24_0[31:24];
            img1_unpacked[100]	<= img1_blk25_0[7:0];
            img1_unpacked[101]	<= img1_blk25_0[15:8];
            img1_unpacked[102]	<= img1_blk25_0[23:16];
            img1_unpacked[103]	<= img1_blk25_0[31:24];
            img1_unpacked[104]	<= img1_blk26_0[7:0];
            img1_unpacked[105]	<= img1_blk26_0[15:8];
            img1_unpacked[106]	<= img1_blk26_0[23:16];
            img1_unpacked[107]	<= img1_blk26_0[31:24];
            img1_unpacked[108]	<= img1_blk27_0[7:0];
            img1_unpacked[109]	<= img1_blk27_0[15:8];
            img1_unpacked[110]	<= img1_blk27_0[23:16];
            img1_unpacked[111]	<= img1_blk27_0[31:24];
            img1_unpacked[112]	<= img1_blk28_0[7:0];
            img1_unpacked[113]	<= img1_blk28_0[15:8];
            img1_unpacked[114]	<= img1_blk28_0[23:16];
            img1_unpacked[115]	<= img1_blk28_0[31:24];
            img1_unpacked[116]	<= img1_blk29_0[7:0];
            img1_unpacked[117]	<= img1_blk29_0[15:8];
            img1_unpacked[118]	<= img1_blk29_0[23:16];
            img1_unpacked[119]	<= img1_blk29_0[31:24];
            img1_unpacked[120]	<= img1_blk30_0[7:0];
            img1_unpacked[121]	<= img1_blk30_0[15:8];
            img1_unpacked[122]	<= img1_blk30_0[23:16];
            img1_unpacked[123]	<= img1_blk30_0[31:24];
            img1_unpacked[124]	<= img1_blk31_0[7:0];
            img1_unpacked[125]	<= img1_blk31_0[15:8];
            img1_unpacked[126]	<= img1_blk31_0[23:16];
            img1_unpacked[127]	<= img1_blk31_0[31:24];
            img1_unpacked[128]	<= img1_blk32_0[7:0];
            img1_unpacked[129]	<= img1_blk32_0[15:8];
            img1_unpacked[130]	<= img1_blk32_0[23:16];
            img1_unpacked[131]	<= img1_blk32_0[31:24];
            img1_unpacked[132]	<= img1_blk33_0[7:0];
            img1_unpacked[133]	<= img1_blk33_0[15:8];
            img1_unpacked[134]	<= img1_blk33_0[23:16];
            img1_unpacked[135]	<= img1_blk33_0[31:24];
            img1_unpacked[136]	<= img1_blk34_0[7:0];
            img1_unpacked[137]	<= img1_blk34_0[15:8];
            img1_unpacked[138]	<= img1_blk34_0[23:16];
            img1_unpacked[139]	<= img1_blk34_0[31:24];
            img1_unpacked[140]	<= img1_blk35_0[7:0];
            img1_unpacked[141]	<= img1_blk35_0[15:8];
            img1_unpacked[142]	<= img1_blk35_0[23:16];
            img1_unpacked[143]	<= img1_blk35_0[31:24];
            img1_unpacked[144]	<= img1_blk36_0[7:0];
            img1_unpacked[145]	<= img1_blk36_0[15:8];
            img1_unpacked[146]	<= img1_blk36_0[23:16];
            img1_unpacked[147]	<= img1_blk36_0[31:24];
            img1_unpacked[148]	<= img1_blk37_0[7:0];
            img1_unpacked[149]	<= img1_blk37_0[15:8];
            img1_unpacked[150]	<= img1_blk37_0[23:16];
            img1_unpacked[151]	<= img1_blk37_0[31:24];
            img1_unpacked[152]	<= img1_blk38_0[7:0];
            img1_unpacked[153]	<= img1_blk38_0[15:8];
            img1_unpacked[154]	<= img1_blk38_0[23:16];
            img1_unpacked[155]	<= img1_blk38_0[31:24];
            img1_unpacked[156]	<= img1_blk39_0[7:0];
            img1_unpacked[157]	<= img1_blk39_0[15:8];
            img1_unpacked[158]	<= img1_blk39_0[23:16];
            img1_unpacked[159]	<= img1_blk39_0[31:24];
            img1_unpacked[160]	<= img1_blk40_0[7:0];
            img1_unpacked[161]	<= img1_blk40_0[15:8];
            img1_unpacked[162]	<= img1_blk40_0[23:16];
            img1_unpacked[163]	<= img1_blk40_0[31:24];
            img1_unpacked[164]	<= img1_blk41_0[7:0];
            img1_unpacked[165]	<= img1_blk41_0[15:8];
            img1_unpacked[166]	<= img1_blk41_0[23:16];
            img1_unpacked[167]	<= img1_blk41_0[31:24];
            img1_unpacked[168]	<= img1_blk42_0[7:0];
            img1_unpacked[169]	<= img1_blk42_0[15:8];
            img1_unpacked[170]	<= img1_blk42_0[23:16];
            img1_unpacked[171]	<= img1_blk42_0[31:24];
            img1_unpacked[172]	<= img1_blk43_0[7:0];
            img1_unpacked[173]	<= img1_blk43_0[15:8];
            img1_unpacked[174]	<= img1_blk43_0[23:16];
            img1_unpacked[175]	<= img1_blk43_0[31:24];
            img1_unpacked[176]	<= img1_blk44_0[7:0];
            img1_unpacked[177]	<= img1_blk44_0[15:8];
            img1_unpacked[178]	<= img1_blk44_0[23:16];
            img1_unpacked[179]	<= img1_blk44_0[31:24];
            img1_unpacked[180]	<= img1_blk45_0[7:0];
            img1_unpacked[181]	<= img1_blk45_0[15:8];
            img1_unpacked[182]	<= img1_blk45_0[23:16];
            img1_unpacked[183]	<= img1_blk45_0[31:24];
            img1_unpacked[184]	<= img1_blk46_0[7:0];
            img1_unpacked[185]	<= img1_blk46_0[15:8];
            img1_unpacked[186]	<= img1_blk46_0[23:16];
            img1_unpacked[187]	<= img1_blk46_0[31:24];
            img1_unpacked[188]	<= img1_blk47_0[7:0];
            img1_unpacked[189]	<= img1_blk47_0[15:8];
            img1_unpacked[190]	<= img1_blk47_0[23:16];
            img1_unpacked[191]	<= img1_blk47_0[31:24];
            img1_unpacked[192]	<= img1_blk48_0[7:0];
            img1_unpacked[193]	<= img1_blk48_0[15:8];
            img1_unpacked[194]	<= img1_blk48_0[23:16];
            img1_unpacked[195]	<= img1_blk48_0[31:24];
            img1_unpacked[196]	<= img1_blk49_0[7:0];
            img1_unpacked[197]	<= img1_blk49_0[15:8];
            img1_unpacked[198]	<= img1_blk49_0[23:16];
            img1_unpacked[199]	<= img1_blk49_0[31:24];
            img1_unpacked[200]	<= img1_blk50_0[7:0];
            img1_unpacked[201]	<= img1_blk50_0[15:8];
            img1_unpacked[202]	<= img1_blk50_0[23:16];
            img1_unpacked[203]	<= img1_blk50_0[31:24];
            img1_unpacked[204]	<= img1_blk51_0[7:0];
            img1_unpacked[205]	<= img1_blk51_0[15:8];
            img1_unpacked[206]	<= img1_blk51_0[23:16];
            img1_unpacked[207]	<= img1_blk51_0[31:24];
            img1_unpacked[208]	<= img1_blk52_0[7:0];
            img1_unpacked[209]	<= img1_blk52_0[15:8];
            img1_unpacked[210]	<= img1_blk52_0[23:16];
            img1_unpacked[211]	<= img1_blk52_0[31:24];
            img1_unpacked[212]	<= img1_blk53_0[7:0];
            img1_unpacked[213]	<= img1_blk53_0[15:8];
            img1_unpacked[214]	<= img1_blk53_0[23:16];
            img1_unpacked[215]	<= img1_blk53_0[31:24];
            img1_unpacked[216]	<= img1_blk54_0[7:0];
            img1_unpacked[217]	<= img1_blk54_0[15:8];
            img1_unpacked[218]	<= img1_blk54_0[23:16];
            img1_unpacked[219]	<= img1_blk54_0[31:24];
            img1_unpacked[220]	<= img1_blk55_0[7:0];
            img1_unpacked[221]	<= img1_blk55_0[15:8];
            img1_unpacked[222]	<= img1_blk55_0[23:16];
            img1_unpacked[223]	<= img1_blk55_0[31:24];
            img1_unpacked[224]	<= img1_blk56_0[7:0];
            img1_unpacked[225]	<= img1_blk56_0[15:8];
            img1_unpacked[226]	<= img1_blk56_0[23:16];
            img1_unpacked[227]	<= img1_blk56_0[31:24];
            img1_unpacked[228]	<= img1_blk57_0[7:0];
            img1_unpacked[229]	<= img1_blk57_0[15:8];
            img1_unpacked[230]	<= img1_blk57_0[23:16];
            img1_unpacked[231]	<= img1_blk57_0[31:24];
            img1_unpacked[232]	<= img1_blk58_0[7:0];
            img1_unpacked[233]	<= img1_blk58_0[15:8];
            img1_unpacked[234]	<= img1_blk58_0[23:16];
            img1_unpacked[235]	<= img1_blk58_0[31:24];
            img1_unpacked[236]	<= img1_blk59_0[7:0];
            img1_unpacked[237]	<= img1_blk59_0[15:8];
            img1_unpacked[238]	<= img1_blk59_0[23:16];
            img1_unpacked[239]	<= img1_blk59_0[31:24];
            img1_unpacked[240]	<= img1_blk60_0[7:0];
            img1_unpacked[241]	<= img1_blk60_0[15:8];
            img1_unpacked[242]	<= img1_blk60_0[23:16];
            img1_unpacked[243]	<= img1_blk60_0[31:24];
            img1_unpacked[244]	<= img1_blk61_0[7:0];
            img1_unpacked[245]	<= img1_blk61_0[15:8];
            img1_unpacked[246]	<= img1_blk61_0[23:16];
            img1_unpacked[247]	<= img1_blk61_0[31:24];
            img1_unpacked[248]	<= img1_blk62_0[7:0];
            img1_unpacked[249]	<= img1_blk62_0[15:8];
            img1_unpacked[250]	<= img1_blk62_0[23:16];
            img1_unpacked[251]	<= img1_blk62_0[31:24];
            img1_unpacked[252]	<= img1_blk63_0[7:0];
            img1_unpacked[253]	<= img1_blk63_0[15:8];
            img1_unpacked[254]	<= img1_blk63_0[23:16];
            img1_unpacked[255]	<= img1_blk63_0[31:24];
            img1_unpacked[256]	<= img1_blk64_0[7:0];
            img1_unpacked[257]	<= img1_blk64_0[15:8];
            img1_unpacked[258]	<= img1_blk64_0[23:16];
            img1_unpacked[259]	<= img1_blk64_0[31:24];
            img1_unpacked[260]	<= img1_blk65_0[7:0];
            img1_unpacked[261]	<= img1_blk65_0[15:8];
            img1_unpacked[262]	<= img1_blk65_0[23:16];
            img1_unpacked[263]	<= img1_blk65_0[31:24];
            img1_unpacked[264]	<= img1_blk66_0[7:0];
            img1_unpacked[265]	<= img1_blk66_0[15:8];
            img1_unpacked[266]	<= img1_blk66_0[23:16];
            img1_unpacked[267]	<= img1_blk66_0[31:24];
            img1_unpacked[268]	<= img1_blk67_0[7:0];
            img1_unpacked[269]	<= img1_blk67_0[15:8];
            img1_unpacked[270]	<= img1_blk67_0[23:16];
            img1_unpacked[271]	<= img1_blk67_0[31:24];
            img1_unpacked[272]	<= img1_blk68_0[7:0];
            img1_unpacked[273]	<= img1_blk68_0[15:8];
            img1_unpacked[274]	<= img1_blk68_0[23:16];
            img1_unpacked[275]	<= img1_blk68_0[31:24];
            img1_unpacked[276]	<= img1_blk69_0[7:0];
            img1_unpacked[277]	<= img1_blk69_0[15:8];
            img1_unpacked[278]	<= img1_blk69_0[23:16];
            img1_unpacked[279]	<= img1_blk69_0[31:24];
            img1_unpacked[280]	<= img1_blk70_0[7:0];
            img1_unpacked[281]	<= img1_blk70_0[15:8];
            img1_unpacked[282]	<= img1_blk70_0[23:16];
            img1_unpacked[283]	<= img1_blk70_0[31:24];
            img1_unpacked[284]	<= img1_blk71_0[7:0];
            img1_unpacked[285]	<= img1_blk71_0[15:8];
            img1_unpacked[286]	<= img1_blk71_0[23:16];
            img1_unpacked[287]	<= img1_blk71_0[31:24];
            img1_unpacked[288]	<= img1_blk72_0[7:0];
            img1_unpacked[289]	<= img1_blk72_0[15:8];
            img1_unpacked[290]	<= img1_blk72_0[23:16];
            img1_unpacked[291]	<= img1_blk72_0[31:24];
            img1_unpacked[292]	<= img1_blk73_0[7:0];
            img1_unpacked[293]	<= img1_blk73_0[15:8];
            img1_unpacked[294]	<= img1_blk73_0[23:16];
            img1_unpacked[295]	<= img1_blk73_0[31:24];
            img1_unpacked[296]	<= img1_blk74_0[7:0];
            img1_unpacked[297]	<= img1_blk74_0[15:8];
            img1_unpacked[298]	<= img1_blk74_0[23:16];
            img1_unpacked[299]	<= img1_blk74_0[31:24];
            img1_unpacked[300]	<= img1_blk75_0[7:0];
            img1_unpacked[301]	<= img1_blk75_0[15:8];
            img1_unpacked[302]	<= img1_blk75_0[23:16];
            img1_unpacked[303]	<= img1_blk75_0[31:24];
            img1_unpacked[304]	<= img1_blk76_0[7:0];
            img1_unpacked[305]	<= img1_blk76_0[15:8];
            img1_unpacked[306]	<= img1_blk76_0[23:16];
            img1_unpacked[307]	<= img1_blk76_0[31:24];
            img1_unpacked[308]	<= img1_blk77_0[7:0];
            img1_unpacked[309]	<= img1_blk77_0[15:8];
            img1_unpacked[310]	<= img1_blk77_0[23:16];
            img1_unpacked[311]	<= img1_blk77_0[31:24];
            img1_unpacked[312]	<= img1_blk78_0[7:0];
            img1_unpacked[313]	<= img1_blk78_0[15:8];
            img1_unpacked[314]	<= img1_blk78_0[23:16];
            img1_unpacked[315]	<= img1_blk78_0[31:24];
            img1_unpacked[316]	<= img1_blk79_0[7:0];
            img1_unpacked[317]	<= img1_blk79_0[15:8];
            img1_unpacked[318]	<= img1_blk79_0[23:16];
            img1_unpacked[319]	<= img1_blk79_0[31:24];
            img1_unpacked[320]	<= img1_blk80_0[7:0];
            img1_unpacked[321]	<= img1_blk80_0[15:8];
            img1_unpacked[322]	<= img1_blk80_0[23:16];
            img1_unpacked[323]	<= img1_blk80_0[31:24];
            img1_unpacked[324]	<= img1_blk81_0[7:0];
            img1_unpacked[325]	<= img1_blk81_0[15:8];
            img1_unpacked[326]	<= img1_blk81_0[23:16];
            img1_unpacked[327]	<= img1_blk81_0[31:24];
            img1_unpacked[328]	<= img1_blk82_0[7:0];
            img1_unpacked[329]	<= img1_blk82_0[15:8];
            img1_unpacked[330]	<= img1_blk82_0[23:16];
            img1_unpacked[331]	<= img1_blk82_0[31:24];
            img1_unpacked[332]	<= img1_blk83_0[7:0];
            img1_unpacked[333]	<= img1_blk83_0[15:8];
            img1_unpacked[334]	<= img1_blk83_0[23:16];
            img1_unpacked[335]	<= img1_blk83_0[31:24];
            img1_unpacked[336]	<= img1_blk84_0[7:0];
            img1_unpacked[337]	<= img1_blk84_0[15:8];
            img1_unpacked[338]	<= img1_blk84_0[23:16];
            img1_unpacked[339]	<= img1_blk84_0[31:24];
            img1_unpacked[340]	<= img1_blk85_0[7:0];
            img1_unpacked[341]	<= img1_blk85_0[15:8];
            img1_unpacked[342]	<= img1_blk85_0[23:16];
            img1_unpacked[343]	<= img1_blk85_0[31:24];
            img1_unpacked[344]	<= img1_blk86_0[7:0];
            img1_unpacked[345]	<= img1_blk86_0[15:8];
            img1_unpacked[346]	<= img1_blk86_0[23:16];
            img1_unpacked[347]	<= img1_blk86_0[31:24];
            img1_unpacked[348]	<= img1_blk87_0[7:0];
            img1_unpacked[349]	<= img1_blk87_0[15:8];
            img1_unpacked[350]	<= img1_blk87_0[23:16];
            img1_unpacked[351]	<= img1_blk87_0[31:24];
            img1_unpacked[352]	<= img1_blk88_0[7:0];
            img1_unpacked[353]	<= img1_blk88_0[15:8];
            img1_unpacked[354]	<= img1_blk88_0[23:16];
            img1_unpacked[355]	<= img1_blk88_0[31:24];
            img1_unpacked[356]	<= img1_blk89_0[7:0];
            img1_unpacked[357]	<= img1_blk89_0[15:8];
            img1_unpacked[358]	<= img1_blk89_0[23:16];
            img1_unpacked[359]	<= img1_blk89_0[31:24];
            img1_unpacked[360]	<= img1_blk90_0[7:0];
            img1_unpacked[361]	<= img1_blk90_0[15:8];
            img1_unpacked[362]	<= img1_blk90_0[23:16];
            img1_unpacked[363]	<= img1_blk90_0[31:24];
            img1_unpacked[364]	<= img1_blk91_0[7:0];
            img1_unpacked[365]	<= img1_blk91_0[15:8];
            img1_unpacked[366]	<= img1_blk91_0[23:16];
            img1_unpacked[367]	<= img1_blk91_0[31:24];
            img1_unpacked[368]	<= img1_blk92_0[7:0];
            img1_unpacked[369]	<= img1_blk92_0[15:8];
            img1_unpacked[370]	<= img1_blk92_0[23:16];
            img1_unpacked[371]	<= img1_blk92_0[31:24];
            img1_unpacked[372]	<= img1_blk93_0[7:0];
            img1_unpacked[373]	<= img1_blk93_0[15:8];
            img1_unpacked[374]	<= img1_blk93_0[23:16];
            img1_unpacked[375]	<= img1_blk93_0[31:24];
            img1_unpacked[376]	<= img1_blk94_0[7:0];
            img1_unpacked[377]	<= img1_blk94_0[15:8];
            img1_unpacked[378]	<= img1_blk94_0[23:16];
            img1_unpacked[379]	<= img1_blk94_0[31:24];
            img1_unpacked[380]	<= img1_blk95_0[7:0];
            img1_unpacked[381]	<= img1_blk95_0[15:8];
            img1_unpacked[382]	<= img1_blk95_0[23:16];
            img1_unpacked[383]	<= img1_blk95_0[31:24];
            img1_unpacked[384]	<= img1_blk96_0[7:0];
            img1_unpacked[385]	<= img1_blk96_0[15:8];
            img1_unpacked[386]	<= img1_blk96_0[23:16];
            img1_unpacked[387]	<= img1_blk96_0[31:24];
            img1_unpacked[388]	<= img1_blk97_0[7:0];
            img1_unpacked[389]	<= img1_blk97_0[15:8];
            img1_unpacked[390]	<= img1_blk97_0[23:16];
            img1_unpacked[391]	<= img1_blk97_0[31:24];
            img1_unpacked[392]	<= img1_blk98_0[7:0];
            img1_unpacked[393]	<= img1_blk98_0[15:8];
            img1_unpacked[394]	<= img1_blk98_0[23:16];
            img1_unpacked[395]	<= img1_blk98_0[31:24];
            img1_unpacked[396]	<= img1_blk99_0[7:0];
            img1_unpacked[397]	<= img1_blk99_0[15:8];
            img1_unpacked[398]	<= img1_blk99_0[23:16];
            img1_unpacked[399]	<= img1_blk99_0[31:24];
            img1_unpacked[400]	<= img1_blk100_0[7:0];
            img1_unpacked[401]	<= img1_blk100_0[15:8];
            img1_unpacked[402]	<= img1_blk100_0[23:16];
            img1_unpacked[403]	<= img1_blk100_0[31:24];
            img1_unpacked[404]	<= img1_blk101_0[7:0];
            img1_unpacked[405]	<= img1_blk101_0[15:8];
            img1_unpacked[406]	<= img1_blk101_0[23:16];
            img1_unpacked[407]	<= img1_blk101_0[31:24];
            img1_unpacked[408]	<= img1_blk102_0[7:0];
            img1_unpacked[409]	<= img1_blk102_0[15:8];
            img1_unpacked[410]	<= img1_blk102_0[23:16];
            img1_unpacked[411]	<= img1_blk102_0[31:24];
            img1_unpacked[412]	<= img1_blk103_0[7:0];
            img1_unpacked[413]	<= img1_blk103_0[15:8];
            img1_unpacked[414]	<= img1_blk103_0[23:16];
            img1_unpacked[415]	<= img1_blk103_0[31:24];
            img1_unpacked[416]	<= img1_blk104_0[7:0];
            img1_unpacked[417]	<= img1_blk104_0[15:8];
            img1_unpacked[418]	<= img1_blk104_0[23:16];
            img1_unpacked[419]	<= img1_blk104_0[31:24];
            img1_unpacked[420]	<= img1_blk105_0[7:0];
            img1_unpacked[421]	<= img1_blk105_0[15:8];
            img1_unpacked[422]	<= img1_blk105_0[23:16];
            img1_unpacked[423]	<= img1_blk105_0[31:24];
            img1_unpacked[424]	<= img1_blk106_0[7:0];
            img1_unpacked[425]	<= img1_blk106_0[15:8];
            img1_unpacked[426]	<= img1_blk106_0[23:16];
            img1_unpacked[427]	<= img1_blk106_0[31:24];
            img1_unpacked[428]	<= img1_blk107_0[7:0];
            img1_unpacked[429]	<= img1_blk107_0[15:8];
            img1_unpacked[430]	<= img1_blk107_0[23:16];
            img1_unpacked[431]	<= img1_blk107_0[31:24];
            img1_unpacked[432]	<= img1_blk108_0[7:0];
            img1_unpacked[433]	<= img1_blk108_0[15:8];
            img1_unpacked[434]	<= img1_blk108_0[23:16];
            img1_unpacked[435]	<= img1_blk108_0[31:24];
            img1_unpacked[436]	<= img1_blk109_0[7:0];
            img1_unpacked[437]	<= img1_blk109_0[15:8];
            img1_unpacked[438]	<= img1_blk109_0[23:16];
            img1_unpacked[439]	<= img1_blk109_0[31:24];
            img1_unpacked[440]	<= img1_blk110_0[7:0];
            img1_unpacked[441]	<= img1_blk110_0[15:8];
            img1_unpacked[442]	<= img1_blk110_0[23:16];
            img1_unpacked[443]	<= img1_blk110_0[31:24];
            img1_unpacked[444]	<= img1_blk111_0[7:0];
            img1_unpacked[445]	<= img1_blk111_0[15:8];
            img1_unpacked[446]	<= img1_blk111_0[23:16];
            img1_unpacked[447]	<= img1_blk111_0[31:24];
            img1_unpacked[448]	<= img1_blk112_0[7:0];
            img1_unpacked[449]	<= img1_blk112_0[15:8];
            img1_unpacked[450]	<= img1_blk112_0[23:16];
            img1_unpacked[451]	<= img1_blk112_0[31:24];
            img1_unpacked[452]	<= img1_blk113_0[7:0];
            img1_unpacked[453]	<= img1_blk113_0[15:8];
            img1_unpacked[454]	<= img1_blk113_0[23:16];
            img1_unpacked[455]	<= img1_blk113_0[31:24];
            img1_unpacked[456]	<= img1_blk114_0[7:0];
            img1_unpacked[457]	<= img1_blk114_0[15:8];
            img1_unpacked[458]	<= img1_blk114_0[23:16];
            img1_unpacked[459]	<= img1_blk114_0[31:24];
            img1_unpacked[460]	<= img1_blk115_0[7:0];
            img1_unpacked[461]	<= img1_blk115_0[15:8];
            img1_unpacked[462]	<= img1_blk115_0[23:16];
            img1_unpacked[463]	<= img1_blk115_0[31:24];
            img1_unpacked[464]	<= img1_blk116_0[7:0];
            img1_unpacked[465]	<= img1_blk116_0[15:8];
            img1_unpacked[466]	<= img1_blk116_0[23:16];
            img1_unpacked[467]	<= img1_blk116_0[31:24];
            img1_unpacked[468]	<= img1_blk117_0[7:0];
            img1_unpacked[469]	<= img1_blk117_0[15:8];
            img1_unpacked[470]	<= img1_blk117_0[23:16];
            img1_unpacked[471]	<= img1_blk117_0[31:24];
            img1_unpacked[472]	<= img1_blk118_0[7:0];
            img1_unpacked[473]	<= img1_blk118_0[15:8];
            img1_unpacked[474]	<= img1_blk118_0[23:16];
            img1_unpacked[475]	<= img1_blk118_0[31:24];
            img1_unpacked[476]	<= img1_blk119_0[7:0];
            img1_unpacked[477]	<= img1_blk119_0[15:8];
            img1_unpacked[478]	<= img1_blk119_0[23:16];
            img1_unpacked[479]	<= img1_blk119_0[31:24];
            img1_unpacked[480]	<= img1_blk120_0[7:0];
            img1_unpacked[481]	<= img1_blk120_0[15:8];
            img1_unpacked[482]	<= img1_blk120_0[23:16];
            img1_unpacked[483]	<= img1_blk120_0[31:24];
            img1_unpacked[484]	<= img1_blk121_0[7:0];
            img1_unpacked[485]	<= img1_blk121_0[15:8];
            img1_unpacked[486]	<= img1_blk121_0[23:16];
            img1_unpacked[487]	<= img1_blk121_0[31:24];
            img1_unpacked[488]	<= img1_blk122_0[7:0];
            img1_unpacked[489]	<= img1_blk122_0[15:8];
            img1_unpacked[490]	<= img1_blk122_0[23:16];
            img1_unpacked[491]	<= img1_blk122_0[31:24];
            img1_unpacked[492]	<= img1_blk123_0[7:0];
            img1_unpacked[493]	<= img1_blk123_0[15:8];
            img1_unpacked[494]	<= img1_blk123_0[23:16];
            img1_unpacked[495]	<= img1_blk123_0[31:24];
            img1_unpacked[496]	<= img1_blk124_0[7:0];
            img1_unpacked[497]	<= img1_blk124_0[15:8];
            img1_unpacked[498]	<= img1_blk124_0[23:16];
            img1_unpacked[499]	<= img1_blk124_0[31:24];
            img1_unpacked[500]	<= img1_blk125_0[7:0];
            img1_unpacked[501]	<= img1_blk125_0[15:8];
            img1_unpacked[502]	<= img1_blk125_0[23:16];
            img1_unpacked[503]	<= img1_blk125_0[31:24];
            img1_unpacked[504]	<= img1_blk126_0[7:0];
            img1_unpacked[505]	<= img1_blk126_0[15:8];
            img1_unpacked[506]	<= img1_blk126_0[23:16];
            img1_unpacked[507]	<= img1_blk126_0[31:24];
            img1_unpacked[508]	<= img1_blk127_0[7:0];
            img1_unpacked[509]	<= img1_blk127_0[15:8];
            img1_unpacked[510]	<= img1_blk127_0[23:16];
            img1_unpacked[511]	<= img1_blk127_0[31:24];
            img1_unpacked[512]	<= img1_blk128_0[7:0];
            img1_unpacked[513]	<= img1_blk128_0[15:8];
            img1_unpacked[514]	<= img1_blk128_0[23:16];
            img1_unpacked[515]	<= img1_blk128_0[31:24];
            img1_unpacked[516]	<= img1_blk129_0[7:0];
            img1_unpacked[517]	<= img1_blk129_0[15:8];
            img1_unpacked[518]	<= img1_blk129_0[23:16];
            img1_unpacked[519]	<= img1_blk129_0[31:24];
            img1_unpacked[520]	<= img1_blk130_0[7:0];
            img1_unpacked[521]	<= img1_blk130_0[15:8];
            img1_unpacked[522]	<= img1_blk130_0[23:16];
            img1_unpacked[523]	<= img1_blk130_0[31:24];
            img1_unpacked[524]	<= img1_blk131_0[7:0];
            img1_unpacked[525]	<= img1_blk131_0[15:8];
            img1_unpacked[526]	<= img1_blk131_0[23:16];
            img1_unpacked[527]	<= img1_blk131_0[31:24];
            img1_unpacked[528]	<= img1_blk132_0[7:0];
            img1_unpacked[529]	<= img1_blk132_0[15:8];
            img1_unpacked[530]	<= img1_blk132_0[23:16];
            img1_unpacked[531]	<= img1_blk132_0[31:24];
            img1_unpacked[532]	<= img1_blk133_0[7:0];
            img1_unpacked[533]	<= img1_blk133_0[15:8];
            img1_unpacked[534]	<= img1_blk133_0[23:16];
            img1_unpacked[535]	<= img1_blk133_0[31:24];
            img1_unpacked[536]	<= img1_blk134_0[7:0];
            img1_unpacked[537]	<= img1_blk134_0[15:8];
            img1_unpacked[538]	<= img1_blk134_0[23:16];
            img1_unpacked[539]	<= img1_blk134_0[31:24];
            img1_unpacked[540]	<= img1_blk135_0[7:0];
            img1_unpacked[541]	<= img1_blk135_0[15:8];
            img1_unpacked[542]	<= img1_blk135_0[23:16];
            img1_unpacked[543]	<= img1_blk135_0[31:24];
            img1_unpacked[544]	<= img1_blk136_0[7:0];
            img1_unpacked[545]	<= img1_blk136_0[15:8];
            img1_unpacked[546]	<= img1_blk136_0[23:16];
            img1_unpacked[547]	<= img1_blk136_0[31:24];
            img1_unpacked[548]	<= img1_blk137_0[7:0];
            img1_unpacked[549]	<= img1_blk137_0[15:8];
            img1_unpacked[550]	<= img1_blk137_0[23:16];
            img1_unpacked[551]	<= img1_blk137_0[31:24];
            img1_unpacked[552]	<= img1_blk138_0[7:0];
            img1_unpacked[553]	<= img1_blk138_0[15:8];
            img1_unpacked[554]	<= img1_blk138_0[23:16];
            img1_unpacked[555]	<= img1_blk138_0[31:24];
            img1_unpacked[556]	<= img1_blk139_0[7:0];
            img1_unpacked[557]	<= img1_blk139_0[15:8];
            img1_unpacked[558]	<= img1_blk139_0[23:16];
            img1_unpacked[559]	<= img1_blk139_0[31:24];
            img1_unpacked[560]	<= img1_blk140_0[7:0];
            img1_unpacked[561]	<= img1_blk140_0[15:8];
            img1_unpacked[562]	<= img1_blk140_0[23:16];
            img1_unpacked[563]	<= img1_blk140_0[31:24];
            img1_unpacked[564]	<= img1_blk141_0[7:0];
            img1_unpacked[565]	<= img1_blk141_0[15:8];
            img1_unpacked[566]	<= img1_blk141_0[23:16];
            img1_unpacked[567]	<= img1_blk141_0[31:24];
            img1_unpacked[568]	<= img1_blk142_0[7:0];
            img1_unpacked[569]	<= img1_blk142_0[15:8];
            img1_unpacked[570]	<= img1_blk142_0[23:16];
            img1_unpacked[571]	<= img1_blk142_0[31:24];
            img1_unpacked[572]	<= img1_blk143_0[7:0];
            img1_unpacked[573]	<= img1_blk143_0[15:8];
            img1_unpacked[574]	<= img1_blk143_0[23:16];
            img1_unpacked[575]	<= img1_blk143_0[31:24];
            img1_unpacked[576]	<= img1_blk144_0[7:0];
            img1_unpacked[577]	<= img1_blk144_0[15:8];
            img1_unpacked[578]	<= img1_blk144_0[23:16];
            img1_unpacked[579]	<= img1_blk144_0[31:24];
            img1_unpacked[580]	<= img1_blk145_0[7:0];
            img1_unpacked[581]	<= img1_blk145_0[15:8];
            img1_unpacked[582]	<= img1_blk145_0[23:16];
            img1_unpacked[583]	<= img1_blk145_0[31:24];
            img1_unpacked[584]	<= img1_blk146_0[7:0];
            img1_unpacked[585]	<= img1_blk146_0[15:8];
            img1_unpacked[586]	<= img1_blk146_0[23:16];
            img1_unpacked[587]	<= img1_blk146_0[31:24];
            img1_unpacked[588]	<= img1_blk147_0[7:0];
            img1_unpacked[589]	<= img1_blk147_0[15:8];
            img1_unpacked[590]	<= img1_blk147_0[23:16];
            img1_unpacked[591]	<= img1_blk147_0[31:24];
            img1_unpacked[592]	<= img1_blk148_0[7:0];
            img1_unpacked[593]	<= img1_blk148_0[15:8];
            img1_unpacked[594]	<= img1_blk148_0[23:16];
            img1_unpacked[595]	<= img1_blk148_0[31:24];
            img1_unpacked[596]	<= img1_blk149_0[7:0];
            img1_unpacked[597]	<= img1_blk149_0[15:8];
            img1_unpacked[598]	<= img1_blk149_0[23:16];
            img1_unpacked[599]	<= img1_blk149_0[31:24];
            img1_unpacked[600]	<= img1_blk150_0[7:0];
            img1_unpacked[601]	<= img1_blk150_0[15:8];
            img1_unpacked[602]	<= img1_blk150_0[23:16];
            img1_unpacked[603]	<= img1_blk150_0[31:24];
            img1_unpacked[604]	<= img1_blk151_0[7:0];
            img1_unpacked[605]	<= img1_blk151_0[15:8];
            img1_unpacked[606]	<= img1_blk151_0[23:16];
            img1_unpacked[607]	<= img1_blk151_0[31:24];
            img1_unpacked[608]	<= img1_blk152_0[7:0];
            img1_unpacked[609]	<= img1_blk152_0[15:8];
            img1_unpacked[610]	<= img1_blk152_0[23:16];
            img1_unpacked[611]	<= img1_blk152_0[31:24];
            img1_unpacked[612]	<= img1_blk153_0[7:0];
            img1_unpacked[613]	<= img1_blk153_0[15:8];
            img1_unpacked[614]	<= img1_blk153_0[23:16];
            img1_unpacked[615]	<= img1_blk153_0[31:24];
            img1_unpacked[616]	<= img1_blk154_0[7:0];
            img1_unpacked[617]	<= img1_blk154_0[15:8];
            img1_unpacked[618]	<= img1_blk154_0[23:16];
            img1_unpacked[619]	<= img1_blk154_0[31:24];
            img1_unpacked[620]	<= img1_blk155_0[7:0];
            img1_unpacked[621]	<= img1_blk155_0[15:8];
            img1_unpacked[622]	<= img1_blk155_0[23:16];
            img1_unpacked[623]	<= img1_blk155_0[31:24];
            img1_unpacked[624]	<= img1_blk156_0[7:0];
            img1_unpacked[625]	<= img1_blk156_0[15:8];
            img1_unpacked[626]	<= img1_blk156_0[23:16];
            img1_unpacked[627]	<= img1_blk156_0[31:24];
            img1_unpacked[628]	<= img1_blk157_0[7:0];
            img1_unpacked[629]	<= img1_blk157_0[15:8];
            img1_unpacked[630]	<= img1_blk157_0[23:16];
            img1_unpacked[631]	<= img1_blk157_0[31:24];
            img1_unpacked[632]	<= img1_blk158_0[7:0];
            img1_unpacked[633]	<= img1_blk158_0[15:8];
            img1_unpacked[634]	<= img1_blk158_0[23:16];
            img1_unpacked[635]	<= img1_blk158_0[31:24];
            img1_unpacked[636]	<= img1_blk159_0[7:0];
            img1_unpacked[637]	<= img1_blk159_0[15:8];
            img1_unpacked[638]	<= img1_blk159_0[23:16];
            img1_unpacked[639]	<= img1_blk159_0[31:24];
            img1_unpacked[640]	<= img1_blk160_0[7:0];
            img1_unpacked[641]	<= img1_blk160_0[15:8];
            img1_unpacked[642]	<= img1_blk160_0[23:16];
            img1_unpacked[643]	<= img1_blk160_0[31:24];
            img1_unpacked[644]	<= img1_blk161_0[7:0];
            img1_unpacked[645]	<= img1_blk161_0[15:8];
            img1_unpacked[646]	<= img1_blk161_0[23:16];
            img1_unpacked[647]	<= img1_blk161_0[31:24];
            img1_unpacked[648]	<= img1_blk162_0[7:0];
            img1_unpacked[649]	<= img1_blk162_0[15:8];
            img1_unpacked[650]	<= img1_blk162_0[23:16];
            img1_unpacked[651]	<= img1_blk162_0[31:24];
            img1_unpacked[652]	<= img1_blk163_0[7:0];
            img1_unpacked[653]	<= img1_blk163_0[15:8];
            img1_unpacked[654]	<= img1_blk163_0[23:16];
            img1_unpacked[655]	<= img1_blk163_0[31:24];
            img1_unpacked[656]	<= img1_blk164_0[7:0];
            img1_unpacked[657]	<= img1_blk164_0[15:8];
            img1_unpacked[658]	<= img1_blk164_0[23:16];
            img1_unpacked[659]	<= img1_blk164_0[31:24];
            img1_unpacked[660]	<= img1_blk165_0[7:0];
            img1_unpacked[661]	<= img1_blk165_0[15:8];
            img1_unpacked[662]	<= img1_blk165_0[23:16];
            img1_unpacked[663]	<= img1_blk165_0[31:24];
            img1_unpacked[664]	<= img1_blk166_0[7:0];
            img1_unpacked[665]	<= img1_blk166_0[15:8];
            img1_unpacked[666]	<= img1_blk166_0[23:16];
            img1_unpacked[667]	<= img1_blk166_0[31:24];
            img1_unpacked[668]	<= img1_blk167_0[7:0];
            img1_unpacked[669]	<= img1_blk167_0[15:8];
            img1_unpacked[670]	<= img1_blk167_0[23:16];
            img1_unpacked[671]	<= img1_blk167_0[31:24];
            img1_unpacked[672]	<= img1_blk168_0[7:0];
            img1_unpacked[673]	<= img1_blk168_0[15:8];
            img1_unpacked[674]	<= img1_blk168_0[23:16];
            img1_unpacked[675]	<= img1_blk168_0[31:24];
            img1_unpacked[676]	<= img1_blk169_0[7:0];
            img1_unpacked[677]	<= img1_blk169_0[15:8];
            img1_unpacked[678]	<= img1_blk169_0[23:16];
            img1_unpacked[679]	<= img1_blk169_0[31:24];
            img1_unpacked[680]	<= img1_blk170_0[7:0];
            img1_unpacked[681]	<= img1_blk170_0[15:8];
            img1_unpacked[682]	<= img1_blk170_0[23:16];
            img1_unpacked[683]	<= img1_blk170_0[31:24];
            img1_unpacked[684]	<= img1_blk171_0[7:0];
            img1_unpacked[685]	<= img1_blk171_0[15:8];
            img1_unpacked[686]	<= img1_blk171_0[23:16];
            img1_unpacked[687]	<= img1_blk171_0[31:24];
            img1_unpacked[688]	<= img1_blk172_0[7:0];
            img1_unpacked[689]	<= img1_blk172_0[15:8];
            img1_unpacked[690]	<= img1_blk172_0[23:16];
            img1_unpacked[691]	<= img1_blk172_0[31:24];
            img1_unpacked[692]	<= img1_blk173_0[7:0];
            img1_unpacked[693]	<= img1_blk173_0[15:8];
            img1_unpacked[694]	<= img1_blk173_0[23:16];
            img1_unpacked[695]	<= img1_blk173_0[31:24];
            img1_unpacked[696]	<= img1_blk174_0[7:0];
            img1_unpacked[697]	<= img1_blk174_0[15:8];
            img1_unpacked[698]	<= img1_blk174_0[23:16];
            img1_unpacked[699]	<= img1_blk174_0[31:24];
            img1_unpacked[700]	<= img1_blk175_0[7:0];
            img1_unpacked[701]	<= img1_blk175_0[15:8];
            img1_unpacked[702]	<= img1_blk175_0[23:16];
            img1_unpacked[703]	<= img1_blk175_0[31:24];
            img1_unpacked[704]	<= img1_blk176_0[7:0];
            img1_unpacked[705]	<= img1_blk176_0[15:8];
            img1_unpacked[706]	<= img1_blk176_0[23:16];
            img1_unpacked[707]	<= img1_blk176_0[31:24];
            img1_unpacked[708]	<= img1_blk177_0[7:0];
            img1_unpacked[709]	<= img1_blk177_0[15:8];
            img1_unpacked[710]	<= img1_blk177_0[23:16];
            img1_unpacked[711]	<= img1_blk177_0[31:24];
            img1_unpacked[712]	<= img1_blk178_0[7:0];
            img1_unpacked[713]	<= img1_blk178_0[15:8];
            img1_unpacked[714]	<= img1_blk178_0[23:16];
            img1_unpacked[715]	<= img1_blk178_0[31:24];
            img1_unpacked[716]	<= img1_blk179_0[7:0];
            img1_unpacked[717]	<= img1_blk179_0[15:8];
            img1_unpacked[718]	<= img1_blk179_0[23:16];
            img1_unpacked[719]	<= img1_blk179_0[31:24];
            img1_unpacked[720]	<= img1_blk180_0[7:0];
            img1_unpacked[721]	<= img1_blk180_0[15:8];
            img1_unpacked[722]	<= img1_blk180_0[23:16];
            img1_unpacked[723]	<= img1_blk180_0[31:24];
            img1_unpacked[724]	<= img1_blk181_0[7:0];
            img1_unpacked[725]	<= img1_blk181_0[15:8];
            img1_unpacked[726]	<= img1_blk181_0[23:16];
            img1_unpacked[727]	<= img1_blk181_0[31:24];
            img1_unpacked[728]	<= img1_blk182_0[7:0];
            img1_unpacked[729]	<= img1_blk182_0[15:8];
            img1_unpacked[730]	<= img1_blk182_0[23:16];
            img1_unpacked[731]	<= img1_blk182_0[31:24];
            img1_unpacked[732]	<= img1_blk183_0[7:0];
            img1_unpacked[733]	<= img1_blk183_0[15:8];
            img1_unpacked[734]	<= img1_blk183_0[23:16];
            img1_unpacked[735]	<= img1_blk183_0[31:24];
            img1_unpacked[736]	<= img1_blk184_0[7:0];
            img1_unpacked[737]	<= img1_blk184_0[15:8];
            img1_unpacked[738]	<= img1_blk184_0[23:16];
            img1_unpacked[739]	<= img1_blk184_0[31:24];
            img1_unpacked[740]	<= img1_blk185_0[7:0];
            img1_unpacked[741]	<= img1_blk185_0[15:8];
            img1_unpacked[742]	<= img1_blk185_0[23:16];
            img1_unpacked[743]	<= img1_blk185_0[31:24];
            img1_unpacked[744]	<= img1_blk186_0[7:0];
            img1_unpacked[745]	<= img1_blk186_0[15:8];
            img1_unpacked[746]	<= img1_blk186_0[23:16];
            img1_unpacked[747]	<= img1_blk186_0[31:24];
            img1_unpacked[748]	<= img1_blk187_0[7:0];
            img1_unpacked[749]	<= img1_blk187_0[15:8];
            img1_unpacked[750]	<= img1_blk187_0[23:16];
            img1_unpacked[751]	<= img1_blk187_0[31:24];
            img1_unpacked[752]	<= img1_blk188_0[7:0];
            img1_unpacked[753]	<= img1_blk188_0[15:8];
            img1_unpacked[754]	<= img1_blk188_0[23:16];
            img1_unpacked[755]	<= img1_blk188_0[31:24];
            img1_unpacked[756]	<= img1_blk189_0[7:0];
            img1_unpacked[757]	<= img1_blk189_0[15:8];
            img1_unpacked[758]	<= img1_blk189_0[23:16];
            img1_unpacked[759]	<= img1_blk189_0[31:24];
            img1_unpacked[760]	<= img1_blk190_0[7:0];
            img1_unpacked[761]	<= img1_blk190_0[15:8];
            img1_unpacked[762]	<= img1_blk190_0[23:16];
            img1_unpacked[763]	<= img1_blk190_0[31:24];
            img1_unpacked[764]	<= img1_blk191_0[7:0];
            img1_unpacked[765]	<= img1_blk191_0[15:8];
            img1_unpacked[766]	<= img1_blk191_0[23:16];
            img1_unpacked[767]	<= img1_blk191_0[31:24];
            img1_unpacked[768]	<= img1_blk192_0[7:0];
            img1_unpacked[769]	<= img1_blk192_0[15:8];
            img1_unpacked[770]	<= img1_blk192_0[23:16];
            img1_unpacked[771]	<= img1_blk192_0[31:24];
            img1_unpacked[772]	<= img1_blk193_0[7:0];
            img1_unpacked[773]	<= img1_blk193_0[15:8];
            img1_unpacked[774]	<= img1_blk193_0[23:16];
            img1_unpacked[775]	<= img1_blk193_0[31:24];
            img1_unpacked[776]	<= img1_blk194_0[7:0];
            img1_unpacked[777]	<= img1_blk194_0[15:8];
            img1_unpacked[778]	<= img1_blk194_0[23:16];
            img1_unpacked[779]	<= img1_blk194_0[31:24];
            img1_unpacked[780]	<= img1_blk195_0[7:0];
            img1_unpacked[781]	<= img1_blk195_0[15:8];
            img1_unpacked[782]	<= img1_blk195_0[23:16];
            img1_unpacked[783]	<= img1_blk195_0[31:24];

        end
    end
    
endmodule
