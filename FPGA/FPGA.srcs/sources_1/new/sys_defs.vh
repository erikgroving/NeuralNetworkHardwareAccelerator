`ifndef __SYS_DEFS_VH__
`define __SYS_DEFS_VH__

`define FC1_N_KERNELS           2
`define FC1_ADDR                11
`define FC1_KERNEL_SIZE         8
`define FC1_SCH_ADDRS           (`FC1_KERNEL_SIZE * `FC1_N_KERNELS)
`define FC1_WEIGHT_BRAM         8       
`define FC1_NEURONS             32
`define FC1_BIAS_ADDR           5
`define FC1_FAN_IN              392         // 8 * 7 * 7
`define FC1_MID_PTR_OFFSET      12'd784

`endif