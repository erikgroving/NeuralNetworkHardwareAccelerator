onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib sixteen_bit_MAC_dsp_opt

do {wave.do}

view wave
view structure
view signals

do {sixteen_bit_MAC_dsp.udo}

run -all

quit -force
