onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib fc1_weights_bram_2_opt

do {wave.do}

view wave
view structure
view signals

do {fc1_weights_bram_2.udo}

run -all

quit -force
