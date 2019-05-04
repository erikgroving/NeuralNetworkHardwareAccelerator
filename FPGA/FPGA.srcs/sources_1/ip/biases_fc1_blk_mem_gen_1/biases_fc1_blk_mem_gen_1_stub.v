// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Sat May  4 20:05:21 2019
// Host        : erik running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/Erik/Desktop/NeuralNetworkHardwareAccelerator/FPGA/FPGA.srcs/sources_1/ip/biases_fc1_blk_mem_gen_1/biases_fc1_blk_mem_gen_1_stub.v
// Design      : biases_fc1_blk_mem_gen_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3" *)
module biases_fc1_blk_mem_gen_1(clka, ena, wea, addra, dina, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,wea[0:0],addra[0:0],dina[255:0],douta[255:0]" */;
  input clka;
  input ena;
  input [0:0]wea;
  input [0:0]addra;
  input [255:0]dina;
  output [255:0]douta;
endmodule
