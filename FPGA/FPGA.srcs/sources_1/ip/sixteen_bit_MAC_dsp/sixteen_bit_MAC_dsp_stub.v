// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Sat Apr 20 21:11:25 2019
// Host        : erik running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Erik/Desktop/NeuralNetworkHardwareAccelerator/FPGA/FPGA.srcs/sources_1/ip/sixteen_bit_MAC_dsp/sixteen_bit_MAC_dsp_stub.v
// Design      : sixteen_bit_MAC_dsp
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "xbip_dsp48_macro_v3_0_16,Vivado 2018.3" *)
module sixteen_bit_MAC_dsp(CLK, A, B, C, P)
/* synthesis syn_black_box black_box_pad_pin="CLK,A[15:0],B[15:0],C[15:0],P[15:0]" */;
  input CLK;
  input [15:0]A;
  input [15:0]B;
  input [15:0]C;
  output [15:0]P;
endmodule
