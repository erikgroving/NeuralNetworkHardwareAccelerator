onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib fc1_weights_bram_7_opt

do {wave.do}

view wave
view structure
view signals

do {fc1_weights_bram_7.udo}

run -all

quit -force
