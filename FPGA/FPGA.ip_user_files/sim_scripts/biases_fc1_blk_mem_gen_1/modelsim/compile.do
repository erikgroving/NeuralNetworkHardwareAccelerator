vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/blk_mem_gen_v8_4_2
vlib modelsim_lib/msim/xil_defaultlib

vmap blk_mem_gen_v8_4_2 modelsim_lib/msim/blk_mem_gen_v8_4_2
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work blk_mem_gen_v8_4_2 -64 -incr \
"../../../ipstatic/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 -incr \
"../../../../FPGA.srcs/sources_1/ip/biases_fc1_blk_mem_gen_1/sim/biases_fc1_blk_mem_gen_1.v" \


vlog -work xil_defaultlib \
"glbl.v"

