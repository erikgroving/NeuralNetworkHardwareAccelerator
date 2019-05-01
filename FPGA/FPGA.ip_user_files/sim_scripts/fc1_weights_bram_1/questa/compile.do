vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/blk_mem_gen_v8_4_2
vlib questa_lib/msim/xil_defaultlib

vmap blk_mem_gen_v8_4_2 questa_lib/msim/blk_mem_gen_v8_4_2
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work blk_mem_gen_v8_4_2 -64 \
"../../../ipstatic/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 \
"../../../../FPGA.srcs/sources_1/ip/fc1_weights_bram_1/sim/fc1_weights_bram_1.v" \


vlog -work xil_defaultlib \
"glbl.v"

