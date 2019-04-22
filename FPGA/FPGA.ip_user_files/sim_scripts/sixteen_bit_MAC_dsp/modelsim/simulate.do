onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xbip_dsp48_wrapper_v3_0_4 -L xbip_utils_v3_0_9 -L xbip_pipe_v3_0_5 -L xbip_dsp48_macro_v3_0_16 -L xil_defaultlib -L secureip -lib xil_defaultlib xil_defaultlib.sixteen_bit_MAC_dsp

do {wave.do}

view wave
view structure
view signals

do {sixteen_bit_MAC_dsp.udo}

run -all

quit -force
