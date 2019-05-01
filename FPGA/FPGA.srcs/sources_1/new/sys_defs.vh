`ifndef __SYS_DEFS_VH__
`define __SYS_DEFS_VH__

`define FC1_N_KERNELS           16
`define FC1_ADDR                11
`define FC1_SCH_ADDRS           (`FC1_KERNEL_SIZE * `FC1_N_KERNELS)
`define FC1_WEIGHT_BRAM         4						// Per kernel
`define FC1_BRAM								8						// total     
`define FC1_NEURONS             32
`define FC1_BIAS_ADDR           5
`define FC1_FAN_IN              392         // 8 * 7 * 7
`define FC1_MID_PTR_OFFSET      12'd784
`define FC1_MID_PTR_END					12'd1568

`endif