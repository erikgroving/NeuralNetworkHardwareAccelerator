onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+biases_fc1_blk_mem_gen_1 -L blk_mem_gen_v8_4_2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.biases_fc1_blk_mem_gen_1 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {biases_fc1_blk_mem_gen_1.udo}

run -all

endsim

quit -force
