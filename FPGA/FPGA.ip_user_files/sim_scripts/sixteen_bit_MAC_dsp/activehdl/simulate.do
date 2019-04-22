onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+sixteen_bit_MAC_dsp -L xbip_dsp48_wrapper_v3_0_4 -L xbip_utils_v3_0_9 -L xbip_pipe_v3_0_5 -L xbip_dsp48_macro_v3_0_16 -L xil_defaultlib -L secureip -O5 xil_defaultlib.sixteen_bit_MAC_dsp

do {wave.do}

view wave
view structure

do {sixteen_bit_MAC_dsp.udo}

run -all

endsim

quit -force
