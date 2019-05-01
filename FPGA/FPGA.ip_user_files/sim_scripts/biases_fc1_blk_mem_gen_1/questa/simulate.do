onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib biases_fc1_blk_mem_gen_1_opt

do {wave.do}

view wave
view structure
view signals

do {biases_fc1_blk_mem_gen_1.udo}

run -all

quit -force
