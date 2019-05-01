onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib fc1_weights_bram_5_opt

do {wave.do}

view wave
view structure
view signals

do {fc1_weights_bram_5.udo}

run -all

quit -force
