`ifndef __SYS_DEFS_VH__
`define __SYS_DEFS_VH__

`define DEBUG

// Precision defines
`define PREC                    18
`define MULT_BITS               36  // 2 * PREC
`define ACT_INT_BITS            6
`define ACT_FRAC_BITS           12
`define GRAD_INT_BITS           3
`define GRAD_FRAC_BITS          15
`define ONE                     18'h1_ffff
`define MAX_VAL                 18'h1_ffff
`define MIN_VAL                 18'h2_0000

// FC0 defines
`define FC0_N_KERNELS           196
`define FC0_PORT_WIDTH          98
`define FC0_NEURONS             98
`define FC0_FAN_IN              10'd784
`define FC0_KERNEL_FAN_IN       10'd392
`define FC0_MID_PTR_OFFSET      10'd784 // don't use since all neurons used at once
`define FC0_ADDR                10
`define FC0_BIAS_ADDR           1

// FC1 defines
`define FC1_N_KERNELS           16
`define FC1_ADDR                10
`define FC1_PORT_WIDTH          8
`define FC1_PORT_WIDTH_TIMES2   16
`define FC1_PORT_WIDTH_TIMES3   24
`define FC1_BRAM                1			 
`define FC1_NEURONS             64
`define FC1_BIAS_ADDR           2
`define FC1_FAN_IN              10'd98
`define FC1_STEP2               10'd196
`define FC1_STEP3               10'd294
`define FC1_MID_PTR_OFFSET      10'd392
`define FC1_MID_PTR_END         10'd784
`define FC1_HALF_NEURONS        32

// FC2 defines
`define FC2_BRAM                1
`define	FC2_NEURONS             10
`define FC2_FAN_IN              64
`define	FC2_N_KERNELS           2
`define FC2_ADDR                10
`define FC2_BIAS_ADDR           3
`define FC2_MID_PTR_OFFSET      320
`define FC2_HALF_NEURONS        5


// Backward pass defines
`define FC0_LOOPS               1

`define FC1_MODE_SWITCH         4
`define FC1_LOOPS               8

`define FC2_MODE_SWITCH         5
`define FC2_LOOPS               10

`endif
