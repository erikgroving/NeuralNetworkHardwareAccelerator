// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Sat Apr 20 21:11:25 2019
// Host        : erik running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/Erik/Desktop/NeuralNetworkHardwareAccelerator/FPGA/FPGA.srcs/sources_1/ip/sixteen_bit_MAC_dsp/sixteen_bit_MAC_dsp_sim_netlist.v
// Design      : sixteen_bit_MAC_dsp
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "sixteen_bit_MAC_dsp,xbip_dsp48_macro_v3_0_16,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "xbip_dsp48_macro_v3_0_16,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module sixteen_bit_MAC_dsp
   (CLK,
    A,
    B,
    C,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:pcout_intf:carrycascout_intf:carryout_intf:bcout_intf:acout_intf:concat_intf:d_intf:c_intf:b_intf:a_intf:bcin_intf:acin_intf:pcin_intf:carryin_intf:carrycascin_intf:sel_intf, ASSOCIATED_RESET SCLR:SCLRD:SCLRA:SCLRB:SCLRCONCAT:SCLRC:SCLRM:SCLRP:SCLRSEL, ASSOCIATED_CLKEN CE:CED:CED1:CED2:CED3:CEA:CEA1:CEA2:CEA3:CEA4:CEB:CEB1:CEB2:CEB3:CEB4:CECONCAT:CECONCAT3:CECONCAT4:CECONCAT5:CEC:CEC1:CEC2:CEC3:CEC4:CEC5:CEM:CEP:CESEL:CESEL1:CESEL2:CESEL3:CESEL4:CESEL5, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [15:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [15:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [15:0]C;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [15:0]P;

  wire [15:0]A;
  wire [15:0]B;
  wire [15:0]C;
  wire CLK;
  wire [15:0]P;
  wire NLW_U0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_U0_CARRYOUT_UNCONNECTED;
  wire [29:0]NLW_U0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_U0_BCOUT_UNCONNECTED;
  wire [47:0]NLW_U0_PCOUT_UNCONNECTED;

  (* C_A_WIDTH = "16" *) 
  (* C_B_WIDTH = "16" *) 
  (* C_CONCAT_WIDTH = "48" *) 
  (* C_CONSTANT_1 = "1" *) 
  (* C_C_WIDTH = "16" *) 
  (* C_D_WIDTH = "18" *) 
  (* C_HAS_A = "1" *) 
  (* C_HAS_ACIN = "0" *) 
  (* C_HAS_ACOUT = "0" *) 
  (* C_HAS_B = "1" *) 
  (* C_HAS_BCIN = "0" *) 
  (* C_HAS_BCOUT = "0" *) 
  (* C_HAS_C = "1" *) 
  (* C_HAS_CARRYCASCIN = "0" *) 
  (* C_HAS_CARRYCASCOUT = "0" *) 
  (* C_HAS_CARRYIN = "0" *) 
  (* C_HAS_CARRYOUT = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_CEA = "0" *) 
  (* C_HAS_CEB = "0" *) 
  (* C_HAS_CEC = "0" *) 
  (* C_HAS_CECONCAT = "0" *) 
  (* C_HAS_CED = "0" *) 
  (* C_HAS_CEM = "0" *) 
  (* C_HAS_CEP = "0" *) 
  (* C_HAS_CESEL = "0" *) 
  (* C_HAS_CONCAT = "0" *) 
  (* C_HAS_D = "0" *) 
  (* C_HAS_INDEP_CE = "0" *) 
  (* C_HAS_INDEP_SCLR = "0" *) 
  (* C_HAS_PCIN = "0" *) 
  (* C_HAS_PCOUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SCLRA = "0" *) 
  (* C_HAS_SCLRB = "0" *) 
  (* C_HAS_SCLRC = "0" *) 
  (* C_HAS_SCLRCONCAT = "0" *) 
  (* C_HAS_SCLRD = "0" *) 
  (* C_HAS_SCLRM = "0" *) 
  (* C_HAS_SCLRP = "0" *) 
  (* C_HAS_SCLRSEL = "0" *) 
  (* C_LATENCY = "-1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_OPMODES = "000000000011010100000000" *) 
  (* C_P_LSB = "17" *) 
  (* C_P_MSB = "32" *) 
  (* C_REG_CONFIG = "00000000000011100011100011000100" *) 
  (* C_SEL_WIDTH = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  sixteen_bit_MAC_dsp_xbip_dsp48_macro_v3_0_16 U0
       (.A(A),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_U0_ACOUT_UNCONNECTED[29:0]),
        .B(B),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_U0_BCOUT_UNCONNECTED[17:0]),
        .C(C),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_U0_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYOUT(NLW_U0_CARRYOUT_UNCONNECTED),
        .CE(1'b1),
        .CEA(1'b1),
        .CEA1(1'b1),
        .CEA2(1'b1),
        .CEA3(1'b1),
        .CEA4(1'b1),
        .CEB(1'b1),
        .CEB1(1'b1),
        .CEB2(1'b1),
        .CEB3(1'b1),
        .CEB4(1'b1),
        .CEC(1'b1),
        .CEC1(1'b1),
        .CEC2(1'b1),
        .CEC3(1'b1),
        .CEC4(1'b1),
        .CEC5(1'b1),
        .CECONCAT(1'b1),
        .CECONCAT3(1'b1),
        .CECONCAT4(1'b1),
        .CECONCAT5(1'b1),
        .CED(1'b1),
        .CED1(1'b1),
        .CED2(1'b1),
        .CED3(1'b1),
        .CEM(1'b1),
        .CEP(1'b1),
        .CESEL(1'b1),
        .CESEL1(1'b1),
        .CESEL2(1'b1),
        .CESEL3(1'b1),
        .CESEL4(1'b1),
        .CESEL5(1'b1),
        .CLK(CLK),
        .CONCAT({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .P(P),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_U0_PCOUT_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .SCLRA(1'b0),
        .SCLRB(1'b0),
        .SCLRC(1'b0),
        .SCLRCONCAT(1'b0),
        .SCLRD(1'b0),
        .SCLRM(1'b0),
        .SCLRP(1'b0),
        .SCLRSEL(1'b0),
        .SEL(1'b0));
endmodule

(* C_A_WIDTH = "16" *) (* C_B_WIDTH = "16" *) (* C_CONCAT_WIDTH = "48" *) 
(* C_CONSTANT_1 = "1" *) (* C_C_WIDTH = "16" *) (* C_D_WIDTH = "18" *) 
(* C_HAS_A = "1" *) (* C_HAS_ACIN = "0" *) (* C_HAS_ACOUT = "0" *) 
(* C_HAS_B = "1" *) (* C_HAS_BCIN = "0" *) (* C_HAS_BCOUT = "0" *) 
(* C_HAS_C = "1" *) (* C_HAS_CARRYCASCIN = "0" *) (* C_HAS_CARRYCASCOUT = "0" *) 
(* C_HAS_CARRYIN = "0" *) (* C_HAS_CARRYOUT = "0" *) (* C_HAS_CE = "0" *) 
(* C_HAS_CEA = "0" *) (* C_HAS_CEB = "0" *) (* C_HAS_CEC = "0" *) 
(* C_HAS_CECONCAT = "0" *) (* C_HAS_CED = "0" *) (* C_HAS_CEM = "0" *) 
(* C_HAS_CEP = "0" *) (* C_HAS_CESEL = "0" *) (* C_HAS_CONCAT = "0" *) 
(* C_HAS_D = "0" *) (* C_HAS_INDEP_CE = "0" *) (* C_HAS_INDEP_SCLR = "0" *) 
(* C_HAS_PCIN = "0" *) (* C_HAS_PCOUT = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_SCLRA = "0" *) (* C_HAS_SCLRB = "0" *) (* C_HAS_SCLRC = "0" *) 
(* C_HAS_SCLRCONCAT = "0" *) (* C_HAS_SCLRD = "0" *) (* C_HAS_SCLRM = "0" *) 
(* C_HAS_SCLRP = "0" *) (* C_HAS_SCLRSEL = "0" *) (* C_LATENCY = "-1" *) 
(* C_MODEL_TYPE = "0" *) (* C_OPMODES = "000000000011010100000000" *) (* C_P_LSB = "17" *) 
(* C_P_MSB = "32" *) (* C_REG_CONFIG = "00000000000011100011100011000100" *) (* C_SEL_WIDTH = "0" *) 
(* C_TEST_CORE = "0" *) (* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) 
(* ORIG_REF_NAME = "xbip_dsp48_macro_v3_0_16" *) (* downgradeipidentifiedwarnings = "yes" *) 
module sixteen_bit_MAC_dsp_xbip_dsp48_macro_v3_0_16
   (CLK,
    CE,
    SCLR,
    SEL,
    CARRYCASCIN,
    CARRYIN,
    PCIN,
    ACIN,
    BCIN,
    A,
    B,
    C,
    D,
    CONCAT,
    ACOUT,
    BCOUT,
    CARRYOUT,
    CARRYCASCOUT,
    PCOUT,
    P,
    CED,
    CED1,
    CED2,
    CED3,
    CEA,
    CEA1,
    CEA2,
    CEA3,
    CEA4,
    CEB,
    CEB1,
    CEB2,
    CEB3,
    CEB4,
    CECONCAT,
    CECONCAT3,
    CECONCAT4,
    CECONCAT5,
    CEC,
    CEC1,
    CEC2,
    CEC3,
    CEC4,
    CEC5,
    CEM,
    CEP,
    CESEL,
    CESEL1,
    CESEL2,
    CESEL3,
    CESEL4,
    CESEL5,
    SCLRD,
    SCLRA,
    SCLRB,
    SCLRCONCAT,
    SCLRC,
    SCLRM,
    SCLRP,
    SCLRSEL);
  input CLK;
  input CE;
  input SCLR;
  input [0:0]SEL;
  input CARRYCASCIN;
  input CARRYIN;
  input [47:0]PCIN;
  input [29:0]ACIN;
  input [17:0]BCIN;
  input [15:0]A;
  input [15:0]B;
  input [15:0]C;
  input [17:0]D;
  input [47:0]CONCAT;
  output [29:0]ACOUT;
  output [17:0]BCOUT;
  output CARRYOUT;
  output CARRYCASCOUT;
  output [47:0]PCOUT;
  output [15:0]P;
  input CED;
  input CED1;
  input CED2;
  input CED3;
  input CEA;
  input CEA1;
  input CEA2;
  input CEA3;
  input CEA4;
  input CEB;
  input CEB1;
  input CEB2;
  input CEB3;
  input CEB4;
  input CECONCAT;
  input CECONCAT3;
  input CECONCAT4;
  input CECONCAT5;
  input CEC;
  input CEC1;
  input CEC2;
  input CEC3;
  input CEC4;
  input CEC5;
  input CEM;
  input CEP;
  input CESEL;
  input CESEL1;
  input CESEL2;
  input CESEL3;
  input CESEL4;
  input CESEL5;
  input SCLRD;
  input SCLRA;
  input SCLRB;
  input SCLRCONCAT;
  input SCLRC;
  input SCLRM;
  input SCLRP;
  input SCLRSEL;

  wire [15:0]A;
  wire [29:0]ACIN;
  wire [29:0]ACOUT;
  wire [15:0]B;
  wire [17:0]BCIN;
  wire [17:0]BCOUT;
  wire [15:0]C;
  wire CARRYCASCIN;
  wire CARRYCASCOUT;
  wire CARRYIN;
  wire CARRYOUT;
  wire CLK;
  wire [15:0]P;
  wire [47:0]PCIN;
  wire [47:0]PCOUT;

  (* C_A_WIDTH = "16" *) 
  (* C_B_WIDTH = "16" *) 
  (* C_CONCAT_WIDTH = "48" *) 
  (* C_CONSTANT_1 = "1" *) 
  (* C_C_WIDTH = "16" *) 
  (* C_D_WIDTH = "18" *) 
  (* C_HAS_A = "1" *) 
  (* C_HAS_ACIN = "0" *) 
  (* C_HAS_ACOUT = "0" *) 
  (* C_HAS_B = "1" *) 
  (* C_HAS_BCIN = "0" *) 
  (* C_HAS_BCOUT = "0" *) 
  (* C_HAS_C = "1" *) 
  (* C_HAS_CARRYCASCIN = "0" *) 
  (* C_HAS_CARRYCASCOUT = "0" *) 
  (* C_HAS_CARRYIN = "0" *) 
  (* C_HAS_CARRYOUT = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_CEA = "0" *) 
  (* C_HAS_CEB = "0" *) 
  (* C_HAS_CEC = "0" *) 
  (* C_HAS_CECONCAT = "0" *) 
  (* C_HAS_CED = "0" *) 
  (* C_HAS_CEM = "0" *) 
  (* C_HAS_CEP = "0" *) 
  (* C_HAS_CESEL = "0" *) 
  (* C_HAS_CONCAT = "0" *) 
  (* C_HAS_D = "0" *) 
  (* C_HAS_INDEP_CE = "0" *) 
  (* C_HAS_INDEP_SCLR = "0" *) 
  (* C_HAS_PCIN = "0" *) 
  (* C_HAS_PCOUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SCLRA = "0" *) 
  (* C_HAS_SCLRB = "0" *) 
  (* C_HAS_SCLRC = "0" *) 
  (* C_HAS_SCLRCONCAT = "0" *) 
  (* C_HAS_SCLRD = "0" *) 
  (* C_HAS_SCLRM = "0" *) 
  (* C_HAS_SCLRP = "0" *) 
  (* C_HAS_SCLRSEL = "0" *) 
  (* C_LATENCY = "-1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_OPMODES = "000000000011010100000000" *) 
  (* C_P_LSB = "17" *) 
  (* C_P_MSB = "32" *) 
  (* C_REG_CONFIG = "00000000000011100011100011000100" *) 
  (* C_SEL_WIDTH = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  sixteen_bit_MAC_dsp_xbip_dsp48_macro_v3_0_16_viv i_synth
       (.A(A),
        .ACIN(ACIN),
        .ACOUT(ACOUT),
        .B(B),
        .BCIN(BCIN),
        .BCOUT(BCOUT),
        .C(C),
        .CARRYCASCIN(CARRYCASCIN),
        .CARRYCASCOUT(CARRYCASCOUT),
        .CARRYIN(CARRYIN),
        .CARRYOUT(CARRYOUT),
        .CE(1'b0),
        .CEA(1'b0),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEA3(1'b0),
        .CEA4(1'b0),
        .CEB(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEB3(1'b0),
        .CEB4(1'b0),
        .CEC(1'b0),
        .CEC1(1'b0),
        .CEC2(1'b0),
        .CEC3(1'b0),
        .CEC4(1'b0),
        .CEC5(1'b0),
        .CECONCAT(1'b0),
        .CECONCAT3(1'b0),
        .CECONCAT4(1'b0),
        .CECONCAT5(1'b0),
        .CED(1'b0),
        .CED1(1'b0),
        .CED2(1'b0),
        .CED3(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CESEL(1'b0),
        .CESEL1(1'b0),
        .CESEL2(1'b0),
        .CESEL3(1'b0),
        .CESEL4(1'b0),
        .CESEL5(1'b0),
        .CLK(CLK),
        .CONCAT({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .P(P),
        .PCIN(PCIN),
        .PCOUT(PCOUT),
        .SCLR(1'b0),
        .SCLRA(1'b0),
        .SCLRB(1'b0),
        .SCLRC(1'b0),
        .SCLRCONCAT(1'b0),
        .SCLRD(1'b0),
        .SCLRM(1'b0),
        .SCLRP(1'b0),
        .SCLRSEL(1'b0),
        .SEL(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
OA2cDxxBBgQGJMp2pxvIcb9dg8Uqwmv+0eyEdSECDu3UgdHiXU5FeBOB2Q9h9uII0FkFHF8ZM/p5
QCk1gyZuNA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Ohw3/ONQPF4YSQ9T4UlhV3QIxoCPQR4nSH8nk5PkpXa2YESP9l5Ukzz3ov2c4s0uNC7340gxwGIh
iZiO71DkVAEONuxBbBoBIz9wl8KBcu3gIWYM3qoATzEBCvJUsWW3y7x4irWQVePt8OSzl7ugyAKH
Gavs/n2UAAo3JGr9nuQ=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qbQdmKpXGCQroM/9Mx26/oA5UfkaVHlnKnkEDXAiffyr+pAS4Xq2B/0/lqmbCYBBKnZpRSPoWUEs
Cg1/IqWvWntatpU9JwJ+hjvSRkztujxk9id6jXnKk8AFHe+y36LqoKhVdARle9zcy0G4UlY4ScPP
z18tJGZn1cVPNUr3wbHIKRZS/pdZdBjPIkpZzfpmtwAPWyBT4InH2oT1IUVra4E4Lbc2JeIXcpQI
MA4GDr2IGv/Enl3BKXEt0JzX1tZtq1bzklY6XMcUl1o97QwbFOZa1aUWgVBRRA1AJNIiMyg5Pvfc
Q9phtLshsSkW42KhxQMiXf2l/0OZGMvjsliZOA==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ch1JwuARongvYA6wwxtZ9HrijShX8v/T8gJft+KazH/83xQ8WQuf2Auf0DEkLYqXb6lmqjTo5Qv3
/UW4me8gr16uhQcbbM5vhT7Yrb0J0W1xruMlQiO2JNDG9r1RQx2OSK1yi0pPBLLOAlVkKSsgWZbS
tIQhtAj4DXc1oOc5vjpuzgyZ5MsedeXKnOkmG8dO+YW3o63NkPAu9Pl4lAB7oGQEnvua9zRMAsi0
edkVgJdX2DsBhIkBrWZRXQ3TUKGFyrcemkBYBAN/p3IwcmqxU8VD8smJrfUw5ftrr5164WnARz6x
2zZZlLCtzlHvT3Onbva+EKM3a4AioOcXu6Kjag==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
VT7lyAYu7/weMOfLvOM+SHZmAAVV6GMaD3gr7ZSNU8JfV9HIoUTxp6J0mJdeOKs3tYYlqi6cF+Qo
F8YCUKXluoy1gcptygDK7q//Xh7zBwLcSKdoUJr/Arnk4ijKQuEZ9JjH98tsD1GIA6B0EUQRclHC
FwSksULSbpayYa7tjvYuijf3sJDtJFxV+GTeKDKTRe8W0jHosQUN+0aKY8WRP/nt7ccDxmn0IZyv
NYwNf0lrWjEC4Ki1WiMukH+NDrbYZZ4V7XSuq11etS2vz0dQpM0oVQxT3DWkod7qrSaHvHyK9moY
KzDcXWkyU3VpqGrxPWl9DJP6lEv2rVhdkpjMbA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
XgmFRGaDq2b3xpHvzH+IwGP/IQNDsWlcao685okhs0AfoeD4RtvYCy+nfvG7Y5DWm1xA4Wa046Ju
gEBXPOzaNoAltTfF+odHBTEi+5zMk9gbAJjMmAmBq1RIDStwIFRdEfdyaG+BfFkpmz+MiAGgdUn2
avVOBrCw9WUXA0b+vy0=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
pjB2Cz+0cSVKp4du1DXMN5l66IUTXx3HaY0OfcBMe+msmACV9SKLQqpbiwy2Glq6Nzrvx960qHGd
FjDXHMKbGPzR33ri6HWVEvLoTZbPfVkX6Jn/yPiNAUbCYBZ6kq0pXUAH3rpN1nE+Eg0wUdWaE9dJ
46214wdWThgp/a2oUEhsBDNuz850Vvo9f3HJGHeUizN/IviKOQCBxQstk1qRDYXVGyiW/vtBTPCL
wVJAZ1C0anyhQAS40N1AKpX8bV9joriwf9jvkmWmBSZB/t12s9UVHmf4Wjyk3vJ2u5s5QKMwb1ag
7LyWm/+cXV1dKHMIaYTLYX6X86whqonJjzSw6g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XzItC6OpA0XpNH5w24sFNd9eTFhZEnGu8UH03xb7BsIiZlJx9rXvJIrIHIw2h75juoGDnM3DUDCs
CSVonelRMMi9DE7jNq0LZIXM+KgIS1+usE1jBk2TQ9qMxFItDFvfBUOdPqGrYq+frTiN4lvc0jIU
WvvB3pPvrbnMqt/4ZBDJE6cKU20QZJGxQJ1aJgYDYZ6emilnEb8MS8cIgAkRuE2BhMXky0Jqis+B
UEC4hap/v5F0PnmBTLJ90b/fwiAg5SRAjGJfEcN/lUQ0aneUe44lm14otwDX+l83yxvgHXnertH6
sYtnWkOShO491wCGdMSBjZAwqSFy8OSffSFC3w==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TlWBbcvcKu2bQzzcEzWzsVYmuZG2BwLuc6EElWuoYTUSixv7RdIzzUFlMgVhBteP5srnKtimmM6E
D54ete7pXUuoenq1JupS2UxHQA37BqBuwINMANNLT9W1g/+nRcibWDWtPwy3eh7UcbptF+D+PxNu
u1oBBTaILxzMe39XMA+kGgyHNvxyNHguOCnEpoGkCQ1NtkIUx1JedylOlbg8+KgZulqsIkCtMujs
Xo9FcigEbNaCSGSxcITnsBy9OYjP38/FTrFU8JL7sxxdJnDxgZ9djKP5khetzDkk+k3WNlbDaEUx
RrFzs8RWFc+mOJODiRY0BTH3rymLcgoj/4Zcfg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 42336)
`pragma protect data_block
chnvSjF7KUKASXhVyar5e6DgV1cMwnLP19xG9muFWXoWxey6AO7VC2HjBm/EkKnrHaHS+Krkg9Gv
VqKQVPuS171z2Sjeo4DokOpUp5u9PjASe8+/m4/cfiBXSSgs1mlENqExyyw7Q/7eRqnEZzNDl8/1
Pui5SyWzxwgaJ2Bb/0v8BVH1wgVPdDZa80oyhh/r8tVIQK4APoY/bkMxdtU70vvNtUVOcQjngoPj
z2kngBew2TygxZk8qMBz1WPgazBkWwUc8TdvHFAdOThFdI2uc5xSQpdtrS4L+f/R790ivovyCtpm
gNpAg53VHuAvLapy090S2B+GPUzELqyyAmrRAewhfrgrqgnuBk+Gh7p0ITPCdfHWWmXVwxLrS+Ge
ZtMI4s5UKMPsiCYP4CiSxY2Fv3Ltna+1KIXJQbBkx/FhrdxnWmgmVLCTViIXW0XO1cK2FPxufMA2
rM3ez0gARo7FO9IeACokvuMLLXLHf7arGgi1DvkkHrRuDbAHoYFgnII5BgghtWW0Hi0A9l0xrG38
RUEdHIRSBQShsh3eI2z3A8jzUPaTgvRQbqKs+WJJNxWpWJG2EvZ7kbbDzAzlhiRqnZukUWy6exnH
i7dnxgYYLtnL30zqP07R4TBLnozXgGYyTxA6oOXLKQy6G2FZgbhRLmX20g8kCip/GOJACmmw+7uZ
sUq3iRs21V7LnmRaYweGRzWuQNVZBOvLGyZUNjWnecmhparZfRqqy8w5+De8Bn0ajJ4sLr+gJEZ5
exZ8PUTjjWPw3w66vRBmKmkNCwRSuXqqgztgs3DM2K2sarUBwChOLYx5Jp6upWlBwF/lUddv54d7
tUS5J6TWmw5ZKqpFjXa1edc/TdGcpsMllTR+Ucq7rSjVT2irTM068XvsqPsJwjk4ETt3JMA9pErW
/tpXB3dm/07am6kLjE80aM9y6qBSj6uOY0oKsFDmDjgIkYrutNV85/RvtptK7Ieikuc8COFjwiyK
VfS0eMooC5kXR22EpN2ukgjE6uWMePh4gMryzC81eBwBkqYvGxxqtnI8TJn4Nkc6psqpm6HO90Rx
65X3cm/PXi7SyVbvGLe6Y/FfIWQq/ETLu8U4n3CsyvDTIwsgqFH9W2EcC+eJHUxF7t4nEkrqmh7f
Xe/JbQdRpOBOc9soQsLoUGwA03QPUvV+YyqARsKSiQFbkHZQCBrpLmgF5CpTSyz7HIDg5SO0izl6
yFEOrQRbQOKgnejBWxB4fYOiFTXMrp6doX80qvq20flUDT4xwjFHgLBET9qtn470m9m4aLG6oM5F
CRVZrZaLRvOHtFJ25QZbUeaZ5UCpMdV7o0nMngUSca+EZkmfpstWg9WEftqRkwt2IAF1HvoyjaLM
E/EX3j/Abo1BWql6r4e0sVfuWBe+t1dxtJuLHrYHCa2sJAS2Cp7iGOowyJP4tb8gnumEdwO2dcHl
lzOV/acvruYWkbhpQK6l4tjogP9VGZcdiXL+IpF/TrUyrlWzZbZia4AcAFVNv+PY/fXPfoxNKJz4
7LtGGWH/AT06OpjjB/xWFafsisucrggHBFsfftVMV5zS0nLB9JttUHULCaVF3cMMWCB9cZCFrLRF
Ok01tPGuzshcaeDMPzRb38dHcywxDFg4hAxLn10UBImmN9eELsNT7MuSt8HCNloOkWd16sAmj6Rw
3fHi2YLut7yDBURg+/u/wmsl+jhgN8UoZ54/faqFicqUL22y1V3W/CelWu+kAqmaXfIrVQWD1NMf
BMe3pxhvNIohjAyW0mbYvvFvdUrvYKJgmN0bc51WMjujmERQ5qWg6Qa99cLGoIOSqVepGi0cwrtX
4+GxPhBrznfhDlo8l/0w88WQo8BQbgZCQ0hdF91v0/yumErUdhQ87UWKQLQfgliaUmqi+5afNtCo
pdtg2L8X7+7dOMDuB5+P+Bs/o7JoL9W4fE5KemBD6OwOFopQ+Gtgf/8n5fsJXnyqY4ckDD9cubCr
9t9/Zike34w0PKRMhuu3lKFXN0dzWR0nLED49lllc7ETXyxMS6yGhD2Bc5SID/60E9fp3oInO6Yp
LjqiYA4kjlBPz1EzJ1NtZtpuvC8D4Jmgg4+wI+bAwkFE4MbwVbUSSYoiWFlBCdvl2wMLC1iDM/2n
Grc35bcP76XAq3s1Ns2X2vGi2iItayYq8w59qmyPNsI+9nBS+SrAwoQX49p+Kuf5FjZvuCoCXZkH
Xua/iEi6FpU29EkrKDNSvustuXsh9LM7ZAy05H7zGASaXXe/oiiI2xPt8WKmqva85ifnlqIMpRMO
hfb6zEXqv29VurEMv2GDPCPY02+YctlR1cNem77rhZhjjHgauGG1uc/t7OxZBkWZ8U7rTwVGAs17
xPua3fRzEjDaXExYo1ip4YfHEDPPIpuvO18poH6g2lZKlb5Epc9xpaTUmXNa2BYCtepuDUm6y3aI
NRqsbfaQ7Ch4I9MB7BqoTCMMs3FVOVbAE6Fq4JChwRb/d2yglSm9N+EXp7Hwysio7NdtcHpWzKWg
YXa3ovyhoWUd5wBMqplFJ/VGfJE4ZspW/GKBSpwMZQQFkLoFG4c8RNxaqmMkoo4E+457T9pxsSjw
MrMftYNzvQ9nC/sY6uD4SitWEqr5FTvBtJuLf2uJ9iKNjnpHEPq53RitE7F2Q4Ny+TCdfycGdI5q
HTff1QketAFK8rnqO+9TuuVuZNh5ZvnOMjj+WaZUiFVdBgVjZi1dJrP9WDBVUzsSRjm4atoes8LK
iNbSHByAjGqOVUUSSLr3dktTjGEv/HLKucZs9DGJlUzJ0SAQ/vPowYxJCo6AcmueUSDN0NWafeSU
6bUEu/SBd3AveLFPyvF2tfmAXzSGXPYFP4S5aXCH82aLep565KjhPtgigyhcu9WWL8xohkC0eq7N
qtihX3WqkuRS0wp8SfElvex/de7xugN0pv/33Zm4ruNRC8eSkOkRjXHcKUM+M7bcBCu7Iyt5uNs3
FXDrSMtragkAir/G+Nv6LLoYC+QTy9+5FGFg2kPOM+CZgf3Z59kfuvcSV+UxqqFMzlq/DYJdFEwV
PNKCKCSaFqWlKZqGp95tkCWdjCb9H82NGJFWq3wqoPum6tIfu5BGrGaj85707v1JWzYTavjgfn1s
tptgBPTjvnmCQfP7Nl2i+m+Bv/m4N+A1Rit9Z7FlUxE4JB9xiz0f062ftuBdbhAFX8ByL1YqkofL
spKr+PnC3spkjh9iiGnT6wslzYA3jMg6XTiVIagpPAr26u0LkuAgeRUo8RMjgH87iY1JB71DPVPV
+Hp05x+dJnJn+7har/pMnLcw3bls6k92Hb1UQMjcFxiizACImUr7cNlgKDN/ZSnVbOT9kpQom/Gb
dscWJcHajphFL6vPNylUjvs+Z98gyVHxfKDXxo00qxEVKlVOplA37i5SLE5rZFtGv8tMnVE3mqNM
fcFYVv48YW/+bT9tACAUOIyTSCpvH/bRd8XUl1U7oOJnq70FvZYokWvaV34t5npN8bp/tHxtUmxY
jd5RtqTRFghqyroDSUGB0SotuwdxiBz3F2iYxlZMkNZgQcSyclplyGeeGTrlaE+9PMe+tw4UPzZt
Lcp6/A27f5GtepqT3PaTpY1FqEgpdycCGIws90DpwWz0TnSaA6/DclLeAW+RR0x4JrlQWwOerVg7
P/oc7JsLCfS2iJhxrHswvtmbcT3284eirap+5bcWvKNx6DHaKoDSvICnoQ8okWXYuCWf4dbZ7aDK
+e/DEb8g5d25uHNv910eZhaDi3l73LqRG35g1qLarfQvUyoWF1wRbxqrP4wPZ3iJKnwaMQu4B+uu
jP56fbbIFraDw5RePR3/fVESXEDcew/slkaqQ51nO4cE9b2YhScNS9aDHImxyGckl/zyg4cksIWr
0OHf2aymWfyXzjw2I0FG2cXvp9nKDHGTZsWJcWisYVZti0KmQHpmCTFAmjN/1fBrGHGVHBbD/cgA
Snz69TE0lJ5x9Vy4EKQO/fY3W1QrMz/gERRe7uvwrWjvAtCPyAVojM37yhgkf7CjsVCijbjIq6LZ
5ELm6fBNGEhXuUg9vrwQFDUdZHjV+gOqkL6ABNOQhpvmSosvAYN++3sPnaOilNy37n0Ya1XQFQzl
bjmwUsYjKbYlcG8FzqzZr+bgurhRWZ/cYCwWXRnwLW5Yt2MfRvOvBKJW9hjrMqAsJEkV7For4szM
lL6V9HY9L7wOTVkQPf+/p/Uw8Z98GJJap8kCNTbUx3UFjy6KqOL1gO7s4cN7psEJpzTZMsG9s1z8
uZMZIsMPgz60NOy4ilYTptInri8DgrgDNRVfDzjsoh9sMENvR5u9Mq8UzD7t5SwR2HmBi30hmEVO
IGQJC3rUorCVfudPT3p5GRxuMfzyF7mruPjQiD7FRjumeMVfY9oR5tu1I/JARoJd6lhw5jL6kEfR
RAWx0qIXVDhBhw58ptqsQHsRQ1yHEnOzabvBBP2LfKBHXzW7A0YmYDsocOkWY+70LOIsGFaDm6S/
R6Dz2N0rFEcnLMyBvAvaIa/QV5s/N81LwvLsxiyD8XHI033MHV1TQkxmUYjTpjVpo6P01emKDY5m
TzNeKj2HDiwQ5oh8K75oVR1afHqp3qlAs6VtBo6Pflj/rEavsznA4Of/8xy1cqWYNa+tthx/TPvu
dIIbUcqSGPJIz1S0MWhtMJmM94yL/S+klaLHEe0Sr9XSj68kMKhECHgfCyZ71L3+6ZlsBSWzou3u
hGJbWQFk57v1i0ebwr7yH3Ro2A2XxkC8w9Na51u4bgQfwgmu+f2YoQyCf18pqy1feTUK9rjkDhh3
dRtPiQ4DOXNBY/ghSiS0nb7IqkQChO1MU53ew13nySBqhqdteX4SvWWSV6GkEwBo5+WCa7BoYQw6
6dG/3WwfxtjdH9vucISBDFl6M4wpJka6GcnZt3F3y5tCZqn4G4Yr1BrhWZcoCwzCyjrcxTkwIKki
Dr2Xvl8FbFHdP74YbYtoUDrX8UYws/Wtw5sEXhoPiG2zk9ahYcg0/8fPgr7/ypWbrfPMEK6PlQt/
783ko8LkTlbuq8N68OkkcXhsFTDmqIODJfyFLP+PHfsLho5TjZ1wlZ0JwTz0RXUf+TZQAjOKEduK
eQGc74dcx6nZkf2YAp7IccPxMZGsr5ftIZc1QcvN9Fa6TPcW2ybrf/4cpdPmSma4Ui3PQN3iUXZa
YrEdAXGlT1PVq0z7Vm/Z7gQXNeRDXe7QQR3Cnr8ZCauHwemC/ZKUJy8EML7vZ9a11R/OP6GMwr1l
s29mfnSYd/1kZREAFfb7WR6O/Oo+Ur78+ZshL/3xckjuH1XUhKYnQ460nSLmiZmLuaP7pc3ktMsl
ktL+hcTV7hfk3kXNw174JqQSwu7aXPUfD5zpxjYoP6B5LuPkXhxiYRnvukDgvzEq8F1wMfxod0QJ
q9AKiaoUsDyr0rQ97HK6ekDL0w0rpXM7utjMtvYDeyXv/8m7m7wSZv7I/Ery8TXJkhS0xigGPDTg
XGhSNioptECqCW7K+kmbNxObVsD+5Qr5W1Ru89aE4QRq73k13ZHM5cWKB3PBVWovLEFYVhEyZYib
dQvHcFqD8T2yIsO/6bleuuAK5+ERkCSzx5FM+wpPi9AP2ZDD7CJH/iqdBHvy3eCPlE74mZNqg3+g
EV4BSE+aIRvkSgq1cuKXvabMBCzTSTV5V14IzQVw35zj4gKtEkUV1vnLGAtcylMG0o/g5H5SiU1h
tiFKOC/XhcZp+0eYHq7v4ZW3Q05ZUHeYr+UZnQTLx9/ziX0PafW9xtfK1m7w438ePhD2sb8VxFnN
XpleAWvRNd1TzIy8TOL9uIGC44PAHdVbis/bFcXhViSEGCTzFMZgaDTLfMgig+R8wXBu2/of6pWA
EnBSf0A0amKzjpyUaDOrc1vXsdiouZWGxVx/ymOjubyrB+mgG7N4ivIiNFp2e9ITbgm8nxM/L2k/
HWtZmqh2pGt/nLfgtQFa3RNFRsC9eawHd/c/z0EEDQIaE6x+oa54qBz6lG89d7mdmaueJdXdwxzV
zJlNYqGXx56z1ZNJf0u2RP9pnXgIlLPWE7v/DrQmZw/yj4yk+LA5mZlXOxCDND4ioYkuvLd6N9Na
wGtrBYx4bNzHEpgtbl//kqDp1SJFIjiXbZ6eFia1P31ErA3pNIfOIiKGnQGcVtCEnexTMt9X5EMq
EV6mqDsGUSm2CfcnSkIeVBtwFjA8FrjfoZR3yKQYaVuCtT8sj0j6bGGvuf9H0VvmhV5336XYHfa4
VrvsN98oO2Qgt4Q6tu4m5JOpkjxGpPicxaARNCPmGU9aJlmy8X8bE13v+LkyXotiFEo1JqGolEFf
kDuCZtCjVEYXq3oT6SwxICGalbkgRa1R+ZhAxbBf6FHGP7tOyPYmlMeOpdFhqeyUAsoBH9l/Btt0
uXRbcNsnyuqWfd2C7rVp6MEdWCwNhJwSf81XODMOBCt67R/lkbDNFqk4LpdT9Ag428lQBIZcicYv
OAOEqMdQUYM5KPwgFVJuWLguQYt/eMkzKXC8HCM5EX5zpJtEQu16v0uMTL8Wsiqa/0o2+trKgzXF
4m27lWxXISlFeCXY4aVzU4XFqnuSal1F5Ijn+t1q6ETNwYF374bW9A+sCd7uXb4ZLWWVgOHtFFiW
R/MhKgluES/EdL1KmG9V3SJCpYzFXun48O+U07Bf2vp8FRxxkMJ88KLwGZcwXCdqX03hG1ADQiBU
78LQUMTZ9wNO4oTAAxTGyjjMk8REXO5eWK6CPLpxEO1zyICwjzV5joCHpCnaG+GFNeSiTEWlKWnE
xhBcUzVCd//F8aHhvweiN/zPQouTQCuTYgLIxIHN3ysiQH8BhCYod7GSBq4TCswphnq7vqRbJE/4
MCeBG5iSM66xJ5DMkEdwUToYYxN9VRb9xfzXlB5ihE9SsHQeSCJPJdmg6hQuNlAvxQO76Wca4Iyj
HwGmxE9icJr+SdV/VCrjS9nR5OIxMnKu5KrEgWAtfV5je9/28SvcBy7fzMYjCED9FXl0xafBF/Fd
6sTf1I7PMz5GKwRQuR9jLFTVkixpkGsIJW71YjnB4XQBWR5BHLxAZv34HrHQJg1EI3rkfoJcKRSp
GezqfMLUjLUf2PFsVNnw5/dz3uk5tq2shIXIFrAztPPPt5inHkrSnrhyWmU4FMBWOTdi9BCD2JUZ
p2ht0GO18PfocmP8/6G9eKpCEq8WPxMueN/pomsuOKkxfn2HzVvsFu2BhmvbixSxXLQuC+AaOafU
u9vclakoNOkFNCU8ZKNwVYHokzNujzl91ah7I036EyUZCTON4Svua2aKoAJQnk5kn7Qdh6eZO0Sk
ZhlFEuq4oZHoepfdCiWu+Uvem/XC1Qgf0WijF0PzppqmmDwWBW3REaNRjrFyezuxXXHR9iQVtGfl
qe9aGfyatruGswUDxplF+YdzBt5CVWLppwJJsauu4S550cpT2mE+SKLgunhjCZNfuHeoer3dDE/K
gAB1/K9aw4EkBdEQtgart/vRHx7VRdC9VTcyKBLn35Oyv39WOPZp91bvCNV065uSAZmRghh4LH7c
GIuuQRRbgJQaiS1nywxNK5pGkCUAeP2mAOgLi1DlvNrqvzXYVwu7AYAyZ5BBABgEG7nYevYFxOmB
qHFvcIB8oCRjfbiU9YSUBgrzFM3VIJ2ZFq1jETST7MxgNsV5zFJkU8kvQG5zB0yVyTVmCwfv0m2K
ovkddvo1y8t1KasilfkdIdsf01WbI19OXq9QaGFexOsY3VatgitO7GgPhztgzJcsj0c3tIPbdUm1
PeDBvIrdK7CAvEHLiBAL+PD2NkYMQaepHGgztaDIruC0EPNBTraqODHygKWaA5HVQLIhbEYsOvrg
ZK46l8qbdwDp5PWCCIZXHLq5sNiBE3APGq52kreEs6hHeKAQBYMBtDYDJ0rSxlqP8Yb0aO0UW24R
0Us3m/COz3+dCfcqng1h33Xtjr99kCrAgOCe9wqhagyJlkx8I7Px/J4w77nj1Ma8tRJSTaZjTsWD
eppw18p2h2TUrkk+qybvn+cljKg2DxiKkpWFn9ZNw54vM2h6WQR0bWJuf6qbQv5d0Zu6xqGtoL/p
VVBM8Iex+QCRAzhXYqfZX3NdXOqID6UTysb6ZYEnqaHQH6SN2wuOtK2hkD0EUh32OfMj5+4H66WZ
PSgJBP2s8Lr9lpDn9nc4VgzdZjlVbuux1ug7XMlxvutyEq+y7/46jhyD8artXdOnRk0A23XVkbLV
S2OdvUgr1FQzAIIJxr585UqdvqCn9xy8hUyXQxmFOkLgUXC+DfCRb5lGJ2HooHZsWX4ExtFHOdng
+hLEznleb6VfSyy8keyXt2sM6BXmATaTmxMUhTA488CSbjhHymNdkdgwSbE43Fv6dpcSpzIDOzTB
Ukr93/6y4BmrrLQzZxjOOydjUAfXjqC61VHTMM4o5Bs8zzLj0Gp6VaKdNXAamULvlDqBMTf61hi2
52KO+hISJxYoI30uZgeTFkl/xtn4QPB6Fx/5UZ595k5yUyamuWbPySwGDZp0qYJ1Z3S9e6kbv4zf
4ZRCQNKWWzNuQ3xtR4t2V5FaXkfmsajKBNi1lRCVo4IrspLaBO8lAk4VMTEkobXVrUpeuo2xYCoh
PFe3+TW7pIJLiWmtfk2smNEvhCLiYyPvvfcVXGXXioxJC6liG2rE7oZyU9mM7bN45l1AK/H1iMID
/pdvrJzkSdyx1iuC47qsV7pDlCzPN7XNjP81NfYaX4PBzTsS8K86fhWhN9/tvAX4u1sNbCMSD6sX
rVMXVyl0aIs3BU99e0GEHC3mP8QwJFAldP4ia7MhRiF5z+q1lcSGGRaiymQCl5W1ey5VfVVg5lVR
TM6H4xJlsOn18lyuZap2HIO9qE7EFF/AWmVhH+AHad4l3fdaCyAvqhjVNJpzn44xuOX3TJsu8DfO
sALC0sYSeKYgWkCAzYuNG8MS+ek/Pwy/ybt0FBsYzcxq7z8Fs9Zn9c0U5NoV535otyXaxi072Ozy
Hv3IuZONtCUwtb9hSwCBSeobiPgleGonGXHEDYSRszIToFSy9I9DoVM1/L2E6Qbv4+vW29VvZuH3
1oSeBxfWgOV3lmq3qwpImji5MuKWnv5oLWfnYv7g9phCg0b6VtEkch/V65YsKNuwUPGrpVKmW1qO
glZYRI5BDgVsOkC+fBFN6MlKt1fYtlSbgip9AY5xneIyIhj1XrSz6MdouIq/biDka1NuOtWFhau4
5abNS3ltJgAoIEMGr/R2a6nsp0YoiobUvErZUUZvwL0tvr5rLNEUKVFWYBCELDs8v3Jd+J8/F78c
ayhmQXgmhQrsxHaogndBFCBRAsr4aceLLXE+qg/4tTc40hifRj3UwFYFD0k0oPHcWO7I5GLswWtk
5fINt3qcOiIIkOKbhRe/cpK4ktcbO+i8JcMr3DlSpQ/gESCU6BvYo+7nrzoCGENXlLy2zqhuTcMR
dwz3tEGdcFkVTqc+TxRr/VjinXPGAQbJQsR2UQVy3YrJVyMl6KFSC6mE7ikSDsCdj5koWdRdaPcf
FZKDxCbnKrXQRWawJt/zKNOkaxDnzZh79kM+llIVP+xP60oT5/wIm+PW6Y5rcEsEDPc9R8/dQLxy
K21HR8NPWIHFHbvQ08/OqtVd+YAa/sz282XI8NAEIbqYncbzs0TkOnZzHt+UM0NXUI5/3eim9N0j
07FvkLBuzsIJdFjTV4DZBFrSqpVgEKc/MX7E477zzc77MCRJR2jT/B0Kj+S4ZvYfkUnMB9xLaCm+
Xu3qjaHaBNOeSkbLATxN6XVCaIO2GUF2sFvC/4hd9EEfFXgrT7p52nn4xHdRmbFVUmYdJAxMbsLg
QcFSvtrX1BJ1jwdU9gBTecPdV65Pe7j9dCj5kwAhNP4KyxPDHSBTDBY1Aj+mBQQaLjbZZACijUUG
Z9b1yk0hu6kRxSKVki+mC3sNOFTo5iqp7tLvZAZ8ydFSgs+iU7n6EuNGa8i7S7kxJscx9zQZzzBX
ksC6QrQWJq07oXxO/zslvVBCeoZ2Avh0qdzaHRDVXvj4PTSZJAqdP67buYE55Il7fvajYSUZXiU/
VcUfFzlP7OBKGEoCHkX5kGDBbSkKDT+4D3HoqIKIktOl5zxB23RPysz0XHMjwOSdJ5zfSMMJvSE7
TqsZWIPFxmSoR7HIR+kZT85o4mVdXbIMfpychT+9q4rXBfSxB6Nc6wlgNjo1g4HOrqzpEUcQjt+o
MfrMXoiXdRQgTRCIV/f6babcU43D6tk87x2LEhrR1ZAopz8DxfFFNGc5Bx8NDwiYOEeNwlNhI34F
Bmib037pn5xpLCyBcy6q8gGXR/s7DaXkbtaExKsi2NgbeM7MO9EjjB7i9F6jRuqNb8aPUkGGKOg6
L0En9O8oFEYG+FFXwByJNH7aScyWu8tACxc9WFBKbXDpxyH24alQhLJGG7NU8BqZWObJVTsHtLay
VK7PTwmWwjBKj4Dg4XvXKRKE9x3Ka4KMAhzazfd2UT8QM6g/RQ/VQr4+ZJB6uk/b8QxP6Jm0VJnB
CeujReymbYAAJGpCJzuiQ96X8lyCOZQHxQRCdPAi6E1ZShoz4h4JVpNu2MYfRz+qOTnlQbTCHnIc
jaLuU1sgNvJbyMeNc/Ab7NTWPkgbf8kRgxKnhMJNyvrJUbhZNGOeUjpnr3ZS3BQDtox+ByV6ezKm
HIx4++IAsclVRiAuEC5wXGhwL9sRyQQCK8UChq05qKZQmnxNRbEUzdKYG3gJMSsSv+YDBXm5EewL
V1+FyXDwLXKPK0l9TiaHR/OPnSjkDAMDYNJ56ObqvkWbW1EQHoREwUZ4WG284Z7YlhUxpOPMI7Ef
6Jzrm2kQTZNX3Sl/aHayDu8O+mvaGB6KNHUKucX3oQORHSUDPkVwK4AxVzTld935i/giFL8nbOPx
HcTqQWoTSpuLoWa07mKOhPw9Kq5ux6O/ZVq6v9udlHy2+4tp/A19jNSlZ2uuqPKTSvpSnirfSIIP
NidLhDtZgDc47wc4AE9qg113Nk7GGBKQJrkm1zWqALzHIWdXeiv942XqztZ1zEPi75+vAjovQ/K0
9X4qNBBtq+qa/KeMFGMv0DD/ngUdieO8BfBVHHlIY5ezED26eGDjjNgmW8+901XUxdmqAYNh6QzC
xuBl/Vn20kjtEim8GqKoIcy3h5R78DESTJqN+el9290sI3iD2JF5dbP8FlzVL1Poqnp3remldEdr
4Jy9QsAVFBTfMs9lH38RhPg0kcNGHSE0tsDS2sDrBGynVt9pgJafT4SnOghrCvt7z/QIpxxd0gxE
XO/5DStPh15j/zJsVVSLaY8kOiJPuCCbEb6TcuS6Kc5N1vANUWJrcRFz26qg9HiwNU4bH2vqt/8d
5l6VpM2d6+WA41JFNsWQiuWiiJqt85tDI0uMigxs8/GS8OiVXBjdpLVEYDgygHiXsWARk6FQH9YE
D2PpNNRQty+f8dxuQNeNwYNkbUL+4V/brWgsdjOkjDiLKsx4UduqfEZIweLBhIk0GVs8R1SOAwhj
TxgJh3C/dD1wJEBkNVxCX/8crlrRi12bNp3f66pHvyk5hmcn95o/iZ9sg4uyo/OiuDcr+vcHZVrD
GNL96EMAdvUvC7Nw9T6lCxw676EowcOEUr/UpcTH4r2xFIiqAUcYFMckqvnqIF1XQHp18gWREFsb
JFSpuSXGT95oK4ETg0c/QVnufJrW5OSJHQkkq1fp0RGkJnp1tTkHEr6m3l7kcfWQteSmy4wPhkaw
uHVV9FsbyT/WvG5nkoM6SDBrpNRbjDIsxylIMpdG+/1/VfX52ZGiB6QP6qEzE7aLz8Dmul2W6sNs
5UIi1Q0wGa30yxrPi9K80HNpc2hHEGeDoU6C9SOG95qyPKGW8TCZeJapGHkNm6cQoKf0DeuLxiSq
D0YEtn5r28cUxx/yMHcpQE8NsaVVWmdz8yOqSBFCjaXMqHrQ2nBDm/ovaw3yZREiBTsd1ftdyohC
gbkG48gWJvPB7YoH4GvJlWxtU1XOWNr+f8alHpxEXb3xBPeUNofw/kHJ6YnDXG1Z27sWqy22zTXF
6eTfhPMfowmhQN1wgVhcdbSkxvVK2fMW1Xs8CUQxb+BcFEtYZDrvq355Rtt1JJR74aeyX3yCNeKu
suKY5NMou9Hjj8esxz0NE8b/uqqQ47I1HkTI41T1SIthShGp8S2XuOqqxIydhvu+D3huz0P9tme6
vuomK7nFephCesmJliMOd7ae7xxCQ8XKs2FMWcSbHA6u1FoOzy28yd63QYSOee/A06/sMGDc/X5t
vwjRh8rXw+244r5OEG8vS+bd5iNIbunyeGLEHlf270z9c1F1jy0e4hBymuTXLGK2OwbvykziqWN+
ZwT/Svf5lsu/5ayBprwgnCB/iFPH6t9t/HPKjIycab4RxMiZkn2STxPvREcUQQ+5J5cpTEOChTv9
ElWcjD/WIrQawLuE30G1enXmOaI/d0TTLaWmnoyFYc5DkdGZ6MZAMhEmfSxEw4cMh07MdrPcrC4y
xntHRyfX+ve6Q6OC4Xin9z/8UgGH7olZYSbGCKePDudic45pOraPt08gfpwIiVM+FEjVl/RHYiXc
EkvgoUFEmOPVxc/r7zBF1qAC+XaX29zK5b/7o2ssY1DzkG5io7mFlN4uLmTyz/5GFh+aJGtTUkNj
l9If6rNdYSG+QjVyY1qD6z8Qhu1yYd+fg6w5OH6tFRtCUGQDK52hyopOVpXXomQ2TaOpRn7fvfGC
g1lcAWPOLhBuI3tGYJuB+pAhXxV9zl042+EweuL1JIr6nkMKB++7ps7fft7pa6rV2ayUPB+78leA
Taa8GBFtvs3cdyltFR5zGhNtEXai7n2ywtEPN//npLRg6pUA+RLNjYWYh1D+5Wwa7b2XP/3HYnSn
oJWXwcZv2p7XY0KMIojHuAgkmpEyN0MlL8BwAzT3Xg9699GNGEqKlVHgUIvDA7Ij44vvP+/5dVVS
wQPYHhJDOScq7VEQUfFzJy+bPwy+94MNPrjY0apbRI1w748dHFiK6iWcdgsrg7hxgLfIYjuFGg3H
Iy/73NTr5QgzKAI/aJj2hoC38EzrMA3UTtQvKFlLjAxcJJHYZLQhWLmpKKDGVmnshFZ2/2N/+p1S
1oDt21K3MCP62D5CSMPcznl7CHBzXhZnnOHqIdyhdt9aM+StiGT63bq+DxLrpjqzgZbkybM+WjcI
H+y7DkQIgFbU316twt/3gSsiVvr0IhTarXQPMQI3oYK8mg40VocoDyAy/MfVUbtX/+YSf2tk/Gz1
LB+xBN8Eib6cFlfFcgcxZWFywBYOEJ0gaZ1REpIQ94AIMjeMHouIDam1v9sm3dR0DFahN79Of8DC
DsIN5aKgvYL8zbxWr5tqKUSy5jthhfuWOFmoGJ4wjdl1dN5b1BL3vHkrpzVjwWKe3Xumxt4Ca7c/
80gb4SCWkYTJ8aPu4LKsZdZozytt43bJ4aTs4dSX6RzqaQH25BY72xyEvP3Wts2bO2H8HWHjCpkg
YHHb9VaK+bmxtC4CY9pH1mREJ/TFPJ3KfsDsY2Dx9ne3xiwjNVaV3j/9cky7ArfsntcWaZ1nOQeQ
brwKyiaPvnfO30X6VlV1ds5PXJr5CXL8d9l0QvHz5tc/vCsN33i35xQKfDnj4HbWGlq9t08QV+GR
CiWJjPBCF6VuZTbhMu2Y4dtuvTqO4fWIFIsm+B+LaqyRl7lEzpcM+UMAaTGIAy8HtK26l6kZ28y5
f4Fog5E7nHBsqrZkgFY1dD9aq9qyHJpHxWjn8f4mL3LOci2jfq5lgUfVzAu8CQos6FWgnt12HWqn
1wtDsI/M4NrU0GyOcHu2bAROPp89/8taer+Bns6uC09WNkFTY6F/+5aCogn14BabH6dmP1n6zphe
I15P/mkJQHiIQYORrrkjMQ36/zlbfHe/olkOVqO6Dh6fZE47TLDwP87y6Hs7M7ermzf+U3PK16e/
EktCzfXZ1pMtPRG4ELxlwnMKHbx6gA+kiewELze8Sf9jOFbFNkx47FAof8h7rHyu5LB1hPVKfADe
Xt3bVd9zsT1QfH2x/7BU0Z54ip5Qr8I0KPdJzOaxad8VE0ZlrMCgVAetcbS50An1vXAOzGmL+VVp
Jkg5t+lyAjGQ+xO68w8lnOJfTrYsHjEd2xo27HYDcu6AYBmehpy52v/rmbngDGvuH5xI6SGb3Dal
OviXKGAvQADlkHOfEvjVcQK3c9kW1w+uyTmg77kQw/+DXcRIk6Reifc7aXwYlE3r7HPtN9hIbnJh
gnBQTneqtPb2kkzhtK9iSEv+QMn8Bxv+UzJihgxFqB0KJyZyAjvVP9zIrX7izxeNBQFG7Sxli0se
aHg+nQ7TNtzhBzlkHm2GrkbX0eHrI9ewKd7PTzPRzNfEAtgercVk132SK70B8zBOpTsF5rfHGn7U
in5vg0H2jESoZ8bg6UxoudAPvZyryIjFijgDk17rUojUpTy/ssPQpg4Fg9XQJ/vizaCR6iDVk+sO
NrmLgfpYylK153jVGdJbSpUVbe26X5rDgZJNyxtwZ2sIg2nICQTKJ5u/felCI7ax8a4ZSxYBjBmZ
gMiQwDSCOmzQLrT2ls/eiecud+JR7b5XT1UbbcmpRuSxH/my1SXOrslq7vOkoH9uxWxhqGdDZ7Wr
VmP7zGPIkP2dBd42qnfHUWzFSVeUANt5cbU5/XB6ucNZfPnHXV7ZZNxOTaU3ExpNdb6XQKu3WFkt
/hQ+2xUx0l04ICcFbUxXLQYB2D6y/ozY0rg9VsWd8HOd+QtrVcYclCFWWrqZJu5bNuUUY+xhAeGZ
EMu9Ua2UjFdOcml2aOCT7USWEc3ra4XBXwbuywFbJ2PQO17vxlP2mI5H0dJp2Js/1wNH6PpUSOlU
gFyOwtq7VQREDonV+v6R7j+xNC3LaGrz8qmG3S2Ot1KO9KqiwTLDDC7Cr21BjUxoG5aE+c4Ws9Ek
jv3s2XUMvwHklXcdfak/gSvF0F2LvlguN0tuonuzivvmgIQLSNYl+g+Rc2N1T4cRQAiv3wAhqcdz
dNznpRSEPw5jrZQ6oiyqjpWihJN27rNIkVdEF4723xQUUMF+Px57pwTCrL8apyP3biQhzu5JYciX
qCk3TmIeMYoiAOkjgnkhL0/w58VxTfPz44jH0WZBOE88iRZLrzMWTsPC7KVnkaH404aZBeOnWq9r
tZMkeIUPDWdjbb3lDN0nSMu5U5JyqWWHFlzXnUDrSyTqdd7xhz5bqtKxa4hnDWSQy3+/wxLkgnJH
Lt21gpzVjbyTrS/GuksfSXFrjZsAtTOGmQ8YaPGfpS5nWCcYOCDTYzKlXeMIdarm7hM1cSp9XQeF
w+qHN8+hn0HDcPgfmbteQzfEdRX4wXJk3mHfm28JjzTEqDPH6WANthjcGCTUfUQ/UZYxeeO6weDC
D2S15aRbU4oul/cm2qujKQf+TgJAzs3Vn7qt1xmnzK5eN2HTAMz7Aok8XsvKfw8Qugc2WhkOhsgK
poNKdOch4qPnVuSihNtRWU7lg5rNdIYpw4krmjW+/FlYdgbRK6LUFf39AjDo1OHJeZnhYl8Z7jtB
E6kXoRt2fmUXPj/Xn7UZNHi8p6/9u7f4iDz/ighBAUyb5E0NGX+OgWJ+jVE4jeMAWUl68g9ATsD+
XDIfgBHGpVAziRwBI2UciFxgXsCMa2nYfwrVUt46+1d08xbQN/sI8Hu+y15C96r3X6q5oBAUGXlx
hY/PzacXv8bF2qCKAflgGFP/A5UnHCz6L94ZQIsFx/ptyksXBAwWjIAH6aaDwwgEYfOQTXraH0kL
VBGWTuzwymaceIat1G9C9hah64Q9OIG2fTVjpuH9smaSun2ZDPF6iIuZe4xT44i8sBbXEGbsIPW/
plWj+roTXH3kMz9wet/7a2RoM+ikWZ0pmYvNpTS+kPxwMAuSP5Q/I4G5XSw3wOsV54QXcsKdaxMo
QFVDXXSANQGJ7KUGtvZTfy0/QFL37WDQWJVseWMdnbddHh6/2ubYR4vM4alZuPnrecxe1iPhf4oO
d+EYElgppsNp4Lb3uRCqipEdtvFR9UTpd07c0t9yVxi1sl6RA+UC+V0IzL/Pmhzigpki10aDTC2r
NGow8KKzjgHfgUmPV9Br07q/wlJ5IzNaFOtt/XeNywSYluZNm+SjOS17/3G1hY8osQMZQw8sVaJU
ZZ0j2wWn23gZkQF5vu1sa/X+/KIRxMf3tZQ+B9SXcBQrCujf+pqDzS/U7YhEHYcRbNLNjmnQYKyj
MIXR+F0LJslehjMBl0FYwwo/vPZpp0R3fTqSi4jF6MUDiqOTUP7v0fxJYiBEfpQL4ScGfTHBgrNB
ft8U+Te8FFmI4dEkBGpMvicfD6IWna3qYJ8CEcJaLVL+kXCMtXYwwjVy3nt6nc5QjKH/9oWcEFSY
MjywEuTwUl2aNIr/yrEXoReB7Dc6nkT6KCL+z8Z2lQNC2PPPAJLj9sbjFnac6jJSIv/x98HPjluA
Y6CvJLFCdRwiUp1YLv5j9rI+uutABMm10EHkV34e3C9QyhNy/YrVpWGx6682nAcvxzI790B8V+qV
aZ4zSKbUWJxyUPiMyTv2yG31r74uisPsPJNfQEU8lM0v1A0L+yS1TAl1zq1C+bietU4ho+/fKdYT
AMBY9NS4XOnlzHHQBjZYrCRTjiW4uayQnirddowJfDrCo34wNzSsqCZHZjUHPALuQZvn7fBi0AW5
VcUxsKzm/JJHwyYRY6jXh0v9cARpAEanj98q9YiTke8rS5X9YDLwajKP9Fw05hg5ffV0varHbYkR
ipU0WtnltndMvfr/VVvUxrIkLDjcct84OFDhm/mBtRWHJTATLzTHosS0albfAOqTIINIXmFUoOay
d7vDWfLnKwdWEJJlFK75Uj8+7UH8F8qD8f5pSWvHXc0z/9jZgXP+VTL+OfPqbG+70WPaAJU8EIBb
Ckmm4OAQeMUYpTwSkqb05fDuNkNv7kDmPHf6BUuUaSvCL3t4EecRxKt98C/5shzvPBgBR1tu4ljt
ZgvQLljOsOs5RA/GTH7heQi0lacnM+EQrlbcx84N9JAWa/Pjc0mcCjvQXEJaHddEyYDORqhpKUVZ
8aio5GvNwW2Bx2WyWmcMszxr1YfzCk2cRmNacqMmva4o+53dlOckButML1j3+3CFHvQlS4p6upw4
IkTFUUzmksWu2bfSQ+zF4RVI9sV9+y0QzNWhMjB9y0e0ZfvSwGRaKaHQetghezn6AdxO1UizT7g+
yAssic5ueFEWJe99mYZ4W8VKlK/wXvzAJ2AuGuQRON9mtW7Y5CvQEnDY+HO/XmtUa/3BhTa3IbkL
kMURFxC6BsvusgOAGZfbpx+mQuUa3peCSM0OZvOzKbZmsCsQXecXiKAIkQSXeP8yzohz2ScXsZ30
AtLinyjK3kX7lfGRmwxN1XU0TPjfyZlV/kTr27/t6QtPLvcqZS6AqpEiteoM5pNls48cGI3GUKRa
ZRTb4QJsLdf2b0YQpHia2mu9quiPJSdpfi/tlrKrHiLPMAcfAPnMlafB1R+HEJkvlLmm/xaEWThG
0DAAEm6aGU/xS+ev91SFaOXj4xV1oh5bOiIYyG0GOMcABhp9Mf+nK3t6eh2/FQcH4FxQ2ZRHcU6N
eSBBr/jwDu1a0eGxVsoau4177j2bIVw8Z/S8RUFQRSd8nP22A9J9hhcz6XoBlLKxu3mNuWugr2of
KEk25tV3bTi8xm66lHTJgLP7jQE9W9G1xxiutGQWYBZpp/sL/PPWCo1/Rq+UjAgNQXKY6Y74MVph
5hBXpZXkCTJByPeoOMp0hrVLcZQCXS7wAn1UlZRGMPicnHIjHTcHC7StuIjoh7r3yZLKcC9A8/n0
fz5xIFi+pN42j2ChySLDJnUO93I1CzwG0XOe/3SwTgiKBqziXF2WIhJYyIOsNgT9Q2at3xSM61LK
A3lg23ixa4Faqabff7ptVwSUw+lMsSlHGY3XRJ7/Jp+xhMFuixHZTrWuixdTnQVX336oJoAtS1lx
h/0AaTy6lMdwXhPub7psgC1aeGGCzO2yZyMC/A79bIu1QNmyjwsg6c1PyZlb3qcHtb3pykx38Ksy
BBxbLforKNn1UwwxoxL7tO/HeU33CAjOMSgtOxr2jlb3OGuplJV8xPBlBuOu28/PouNwTMWMws5U
L18GAsnvNm0AQzqJS3IqkqLr57PyWJh2o1ZEXObNn8e0XG/rU4QPoobUQHVulUbcUoUhDnqum2H9
LBiIzPApBLJVEZupc77VTakWX4YBXlQ0938+xY+6Qkn/WxwFI2Zc5ZYcxC5t0SVun0uhF874o8dg
jA5yoQaOKbFB+y0la8qPtx13T0trjGJe4msIY94tokq/naoa50Dmrfi6zy5YWmqEufzmcIbARIvw
zs6TpANU9WubpZZ3nbgigpXmAJjkTo8wv2aSMfrlTDw+0wiZOCj+9WX3jzg9x+f7XvoGOtTy3nao
iaGXIU6Oe7pLBGA0Tws4rX5v7XjL6o0dNSEKB/IFcSNkBVieDNqXGA2EXTE+mq//RR4bJ5PbRPzM
cB1lFR6HRoTvFWOMWdrmvLAfWjhfQzQLc7an4AQYPAY9ava4Vq3ifC721giGA/GtIktYY7mGBXYK
hm2x7QYnqZj4KR/iJpkNSCZ35LL8fH6ZbXnk1QzgYYdLw3VGGJ954Z5zrp4XII459CZv/FLT5Xtg
ThmTyIiBFbufxK8soah7M3xlHXC6dNxOpgJ5aDpvhIdmUb3BJbIa/Fc1HF5U2KoXEA+GBv0TgP4W
Bj5SJuzwLof2uyo530pFazQVsfZiBT97WM5KH4bZrOjoty5ly245Uq8hyFvVQJP4dYue6Y535Vtt
B4/QzYvgmXh+ZIFp7BgVrQzB//36x3GAJKOo0xAL1DEgpNkIJkmGXNpaxA2iN138YPlAUvFl5DoO
k3f19Pn5PRukofCGtP8hVTqOBJ8kWCu8KFpTDrtxZF63fCnKg9FIfBoVZ+g0ODTtn2jXyymBXmR0
tjAlL1yXmv3u8rL8H/+z9+KBbqOBYNeAy3GvUFfcvrVMd4qFOJSdPvGXKrJoLDHIMwfzZU0Y5zqv
LToYxlCbc8bVd7X21emCsOUcU0iNgY5ENig73RSxfYmvLxX1/QJ/tKWgdY7+7OnfkvWVCViFQEkY
YJFa7JoCW1ry4YegGM+QooTz0+Jn6ZCC8EglPdYoiY1VXijl03jEsgA6uSo9Y1qm9JgXnhQ6kNBg
IEZmOxrwK2vN1C4/8eszXVmFUPuASX3V98U6DfkljGgQYvxKhCrNY/M2uoYSlEw9g/XPIzFnylGm
3lsxghBQGtX0My0k7qyAgkkhFX99Ol/jlMi4WxhI0v+giJlwXkilLuhqa/xTyuEp5uYHrOQvQqsE
lv9yiKQcnny30tXuotjw+wc4CJ485ft5rXyCq8RE19wEsKVouPCookl757FVhEs04Rhfd8/DbvUb
3uDRJUHU8miIHdwjDCXXaQyRugMNhRGLHsaimabNMEciDslxkBlj0aZorI8If2W8ABmtjMuMXMdx
we4CPqtuCFtAekKs6JVorVG4QS54AOeZF287fyJKyNM6dNwfazsNXMz/P7DJAq0Y+AlZ/4KZbTwC
lTS3QGK2dcnGhYWayWQWGIIn8o+a8EcO40VNYOpUpRKwKNdqIk78h+rq7kR2SnS2oIEythd5AFv6
uFBisbW1Ja1Ge+zRpCueatAGfUeVSAWci+kJ/FmhCoQBXRkMhpTDEqFKeg3kOObYPqa+bcOL1kzj
8pKD0KKpMoA1MK/RpfkTLvVHT/WEXvSKdLxsYBDPP5SSjj6FyzShYBfZKxPh2cGw8PFQXfrqnrPi
SXVN5jXtbBrI+j6JVkBW562PlTvUyegNKLYg8RTW2abSnNvkJjc/0eUazYj/VgiB7KjBlDyAUMFx
cXNBMHQo+akwaEqu8MyMijnYLyJXqTYRzNZomdN+SPrl+8GFpLiq6LlDBM/LGqgpihEQO7MD0tzW
3cuM3/UhWEvvszW9jwzVbJXaPdzOiRUldu0uGUGBBaoz9+s7oavW1HCXXGsQpB6kdU+4c+8Zr02Z
HRGN5CuccY7AmZSkV6eNUDz7d0S3Binkk81ZCPBApIsC+NTK0zQ+hXN7wapgGjR8MPXS+K/8/B8Y
Cl91i6jSFoWVbqH9ISxcYhW7qYqI+1zWzBRQn3A3HH3gLdoUd9moyGaQLjs0KlnXam4mAdlO678z
STwBdSCR3Pkh/0GRc5OmTqr4AJlCoT5orzreNOjwscQuocYHT82WC2iI/VAsZnmxmj+It21uK28m
WbGkdu875fBm+nWw89107uM/GMcmX1RqXicp6Xg77ynADOG2GLsfPVWiCJb4ooqnTBskjRCj+99g
wHwJtJeQVC9YqB9zq33Eum2qSLMXuw3p4imhWWtMm3sUIFS3hMUMGVy1nX/9ycdse1fSZacoGaxZ
77Z6AtBPRRl/D4PYMlAg+tZ7WpgnAKNu9Z27sCZOfzoHX/sQO6TanLsu3G+YGgAdgj+XL9rfjLLT
W7XP5l5EMUJRCTJzFMSh+vBbGgURizBt9Bw2UcCP2RoHYXxmnK7mVhu4N7m17A9bjVUxMUtp0b1b
eSgcb7SmYybTj2jnza/RXD09gGcPorDpfH5YVZ1po/uRGD93xT7uKDGw5pJG/kjSErrwVzpY4GSB
wf9VxIFWji4L5lW0+cZriGR9VLGpXV6nHBynyDd6v3C5SmkGhnIjf0rieAm9RPjcNndggGTK6ODT
ucpOIihRgQqopxFgPNa4ZIbZEBbHRO74wRYuu/3XcEQS3mclTUfqHOFs7R4XVRyvIi5R7gfTUK09
a+cJbXCXEqTEUag35i31pOsYw8itns1oAZWiG3HarudLWrDv0dptihsxskRzwzgC+GJG+FAFWaIj
i7gFjtt03C/+2N0vMh/Gfy0QwQtbYXH4TFrLowWzwsv1V/UjtXeKVLHdmLbgtSzjvI1JpVlBgRm/
tm+FwI2sho5QpcS+xhHR76hypa+x3mHZs2G809MD5YZx+8YIXHDd9J8qGytkbp3FDUvL3vK4z8HS
KkPu/1V+4+Y2ccEJSqLnkSN9u+dklwPBgQXHk2Suz8E3t4UV5yQHB+5z0Q3d+iCe3kupSNP7b0yj
6SI2L6FKbj13KkzJ+kRMP5XC78s2dcyoHzavDYFLqp82OYSJ9Vf6CCT14Ir9W93RP/85sUP5aCaq
QwanGUUA+aTnqq2DJhUWxYF6HWWMNdNRxiMLcgcu/BQ1peHmNhw2sEFvZs/O+1RNggOhNW2tdRKS
AbyARBPFZrLH2IG0et355nZLAl8nUB3Ql2cfmK5ium+Mux+DKVUu0d2GbBNKVq+bv5wA9jWP9Ebs
GWEAXEdNIrlyuAgEkHH3jwlK3kELoiCat5Ayi6JGhB2WACQNX47B9zR+JIk26lNm4GkgJX1mjYv+
jpRrSV8dDRR9pGjfXRBmKwDVq9M7p/B4inUQiqNvtDCf9dultl/E5D2qJK9NE2aDpve3W/5aEixm
WX01i4/QOjr1ph+5WCfWKQoP8f/9RVrMbxuGrYm09PIbmH5zU2XTOZB+CMg2/Dtdj5JTGIAj3nEh
BYD0ATTKjjO4eO3IeYiA5JG4mzV1xAPcqYJiXyDR5QLVRzZLp6WqiMSxRQUldlNd0lBxAvl9bA7Q
E+LaeiQsp4hT06cIPQ/ZY66aO0Jia73AVVJ3VUSELjmyqgxmseuz2ZEx7ju2VORUE15QN+CZakSM
BTDDjkQbp0KCFkzJ1KFR+6ICcbdzYqOzLlxoHTzWR23kLAHuvjbxbXIPp/+XmYVGDFJlXB/+4Edx
tejDfNsT+Nl9jrLVJODFxhIPb/xdg5gbLgi3bukDH7ULIt+3T0ZVEdzHL3+QACV9lk0kPRBrEuEA
eDdaIP8tC4LGOcEcBplPaqn0CEnxr96f3Z1Jdeg6QPSBwq2iwkOhgfCOmBAJEOX3SQ4HekcPFBEH
deyxVtE+jYgLFhIGilEYinOxdcd7QKKRvE0vECJMgLPDTEKHsBkmmb0e+/hYKTF7JvTFk2JWXpMi
pdRgzy88KUFEu/2uUn/urPLzHQaaSTBNm1pXPPEZgbDfBv31qjQKE3tPXgVOUoghUBhdYE4PiJXV
ih0pinXD8MiUcovlcxEdkxrOhG6i4wUQy1j8k256wR+comYrO+h/vax00bwrCjFEir1+4V3YjSgG
2al1HHF6Ziv+DFms43zRYnfrHB/5TmxvbZnQBTtxoqBnCFI5RRLOmRPgidPyG1rsShNSN1ynXqao
uXl6xVBW0s78JHA+ML9h6kiQcBWsQlJFj23TzUSSciQIZ7guAdcur3/Fv/mNoYLcFB/kcBDLH1Mk
gwslTpyNbhHk8JUDRX/iegHw06ODJr1Hc6n6Q5lKAfjtqKwO0ubjANXBWMgEduW3lkfXKjvnJDXo
wrd67qW7kz7VVatxwsd4JaygYz4HS9xda71AV5tTwX2Ix5dNuemyj1ZWkVx9uRn3JkPnFHuuIkP4
0G6iYoEGvEUf0EFzdKe0rRmUOXyPxIhSbyq9gx8oK+GCDmfHzODIyTPm4kBQYTb1i/3Je315K6gK
qTgKuFRg/a70K9VthZVXAna/C+q74HcQs+scFpS6tdrcHQZKoap3n1sct9Ywo1K8WUg97C6xiZ9v
yYjQ5EKMtJk/y/62oJ9+tGcJquO7E0Ci/dldeROQNeCrfOJMI7POBLo66loHXUnihwe59tdcop2b
R9L+ToyY6mosb8HzO/to40EofEM58dtsH1RszuLRd8uAHHwdwNUcPBcpMl/R06mDZhoH0d60Uzk6
Wqur3uAFCD12vuZ4YG/sJOHN/pZUizN6YqKT5GUHFMhT8JvWIftXiXTX7zE1kjIX7RenqzZ2LrmX
BZz0kSIbWlzixgTN+swoo7j0kAJnXCN1LzmhWMfRgi8w6/ZNXgLYDpCIPB2eG8WAGjewpyW0oPge
o0k3+zRB0S32DzLY498ismnIl9Od+y+DXKwsGE4UPn7jqBmZ4FYpy1Un7HSRHY7PsOmyVF3KYj3x
Eje3ZbI2vHWiwkRFHMvNewGt9ASxVRuGYJEIIEWpzyDk88ie9x6NJ1o6AHhxbe/jKo8Q00JgVBpZ
Oo82TjnFMiDn08V7+OdPS12ey/0JhMASYeRX8Q7pEQpMGwsII/a/U/tWb4Gu3bpRGb6vkcfXWYym
igGx2Co+amiTolLmQb3jVqB7vFKX62UOoz8sHR6ZkyIN7tDsimE01YuSsZRZhBJ3eRJ1kTUk3WkW
sGQbqI+9NF4KvZVy1GKvb0t79vhXvTk2XX4JPxj1OGNjuesmkkiFnQv3CXUBM7KM5e77mBMgbhZA
4xtTlIAhbSXK1bbpk7+X/Eg9LwcSeiZx5UftiW94x2O0TphDvEXuABpujk91nlDWfdLDKReCWoWi
ia+qGfWPqPy9yPJ9x1V141hM5W8E+kh57M0QrfWFBi6AGHmc4bicsJPitgWzVhhDR7G2NTODa/kY
ioR82+FzbVLafUHncq50z1yHFAmev9/3BzhfeT0UxrTCUDVeFi/UPRu4MMklQ7UNbTl/WQHfchCo
eFEpyRh+6JJK3h913bXkfkjsRuGEV67yRvfk3FqUsiu4WXVglRWpPmRmQbeeRfa//tAGoFGBIaUW
rraxSqU5XiguhdJXH6kvPVhmJJhjVOLfyTjET25PWNIfXb3fF4yej9ynKv7eX+ArBv6zf4OdcLHH
LIa3hm91o/u5J7rtQjstgX6ujuF+5YypfN5kRtfxkjH+G4ncNSsEEM663G2fAMSFUEx2HwS/2UA1
mR0kKpoBgekhFXOKkSJUCq+b+r3EoXFyKWuHsByRWOhg2C9E7rR2rLqpCToKeZ1WLUQpL27dmcuU
I50HT0n8Uhr3WCTxzGkuojV8tcLTQO1hhtHSgFl4qklcLL8wsJiAtXj+GCNWAE4ybZ8glgoRsmuo
aM/5fx+MUz9jA9cO5n9Hs8znU/JHQPjm96TaRyEMaww6Aa4IUik8O4a9LjfqCELJT3hXUm6ttg8X
gKdaGFgrFkAU0+FQtPnJvupLhj93BgXe6c5ZGdCYtqgiiirk4zqWD6F26bdPGG0rVmXBGi1iHxa1
TtldB4XdDB7HcXWuK4BUS420dRpCTtRp//GG0TfkjHGljZblPilDhfj2kKK/M4szvwiFEOxrF+g8
ZO/UOpwV82u8lWwYG4yziyDRxdLgBEgXv5qZl1PXkR2jg2Tz9HDxWcfFukEirGWhikjala1/z5hC
6HiocR+Q5f0KgEmQyUN2d9fVBQ4XIwkU0sQI+fsTUvrLu6d1cwqVe9kCb+NYZgIvroK//vtr11yG
c0OiJAAD2hvnqwk/La+OlVOyMbn7okLWNw0BXE/vklw3jQAE+VnHzyXCq24Pg/cG+T6xXqpff3xW
NgbqeJILHbgqrCTUyo6D40GFPfOrsC0AwBJ7MUmW6hsb++NVWUnK+spiovSry/XjRXPsI1OPaKbb
Vt7jRHLnMdEFmuoReToV9x6HjpdguNgkmhCe8uewcp3qdQkjHBT84/CAG9RBgYkKUS8nUtyDsGF+
ivJ1QUUEMAeD6tUE49/YE8YbF5IzWvQerQAq25M31S+2xxEe9Dakfg5u63zxvv6Id5/JFPBJck1m
3gzi3ddAOSC8myNeU5LL18T2jW3hrHV+BeX8FBaadWQbH211LhbVnRZsRLAFx5U25/gbKFVJN2qq
Zv1Vr+O/hpJCYb2FtXtK5baiQUuntUGPE147MfFeNVsmAYINNMrdinikiY1QtTadKshQ0u3n+Bme
qwwAmH+nxRyXZXKLjc80TO2xnCWrURoTo4B0siJZz5m9TfU/Q/gn8+CJoaT1VGp2773lZBAjlqCe
boKegd0mckGD/Xp0dnNiOcpt4n6gU04cqLLaUS5f60yAwJNrFUhnh9NLDK38LSWvgeS4DfdqEuV6
kMg6jfv2oQc6sq/BCnhHXGuLt/dI3LQNhfTNprLUYUMej2HvHzDNl9DNogbZ2IIeIJjaXq1f5PK3
40xDa/RaEsmqaiOoEeFVI1oNGuLQQ6WZG7Oxv73YL7q2UhUmww75HcLMTySg+TxidHo2kgiYpsLq
6Bwi3fNASHFgZolT1QWy9bXO+5cp0Ps9hazMBAy+NoFh1VLXWT3zXiSYHrA2GhfkM2PHjG6PxWdw
v8B8CvVYtAYIhbo9RpK5v9iIDFWhKp9wwjfHIj+3WVYx9LlXoU5sVpnzEOFoeKzmLQV1plZnUPCL
4qCcQlEgFlNyN7w9kPfbsRjPi9jaiji5viL9Ui9VPirQtinf6R36tNK8ZJ7/ojUxjDljWtjPA0nY
tE8r6kTSiEy6ESVkFbY0HtTD3SDgFRoQk0r4J2b8USGBlOW7GG21gQ9WJKO8bl5nPdQf0hnqvhpF
UoaCrlvACfvdF8YJrtKbdWGTkR7ij0U5ttlyMZppyup9TWOu7rXZm3uP/8O3hxdaEDUGMcuNYHSR
tQ+am34UGZYrFPJrgujaj5wPomthuUOiS3XLgCz7MZVW5tT4VYk7xNKG6YIaCz771ZYmFrfjvOdu
9mlvZC96JwJbvCfhapcpji9C5MDp4/8x4liBJGZLD0bE87KX+D9z4A7CCFM2r94tZ6v0yqJJTmmi
dGc0LLK3bPCvGGfp3AFwzQc9MlmgZ6U/Qt4XIXpIZXLc4O4AUprsBbhNoxdTIAdtGJEpORVeBQiT
fn9H41gclc1fG9Ns8GNN0thrOvk4F4JfE9QJoojufvovtQYEYMxWMZHSQLve0qnsIryDrgxd8LhO
OTMhd10wDKzt7JYv0gjyGwmfN7fKupea4skPl8FvyRMkTnivnOUDGIDZljeodkELMiW/D6TgGAFi
uQZ3QPY2WdJ/dlCyw8SV6z0EisP6lL/2MUsDDanyn84bdnoC0bVcyaqDM0FYX3B/LKBKUBBQWntd
vYrV61c8fPSIPoK2apn62yMqL8PeDRyjhvn1pnzYrCMlcHlF5aI7PK4gkgjE2hC8pN1UJJq4/XXG
z6EFXrAK5a56HvJ3bXR5sfDgbuDFckxTRGP9Wg6R+SqDOS0AEoLB/rCR4I9F8jo7fWt4i8dVmX2g
7f1vntmkRpwx5Q4k5ZSsn7gHiXp2YWdxBGW6zu6mJY+khHXFLDvetKWavFEUNPyosXh8Xhh7D5ec
HMjegwnU78X5sz4XO4uPKQ+NeVjkOHEkGExYjS8yPUK9ZwvDRLHL1CWqoHXpQEZA7D7SSsnrBWqq
SvlS56lc+wkEpFapR7ZATWKAYCz+0VxvqpQuFf828BPinvwdxBUYktJUiyqtMgo9vccBvEOyB/TN
nsoK43Q/giFUA2ksNx7qjEvgRembfaYZTaPExTikqDDaPD4QRQ1/6pTAHppCuy1QzS9xTaRQuR5V
xhOgoY6MUF3brz6qVJn7lPyMmkeuPTcFjvrQEjiiCAeb5029zVULZH+/kb7IYOGBaOC/rPB1qelh
8theeVZonxnX/IdNRuRAnLmdFICqVJMEAuZdd8QGerolmmBtscKmOvq+cspDlKSWOCULgMrPOLjA
iHOzNb1fRvmTveGzMa0SLQuqEFT0H8FImoobviBjzm9+EFfBe78S0W45pMkR2mWYyj/P4yNhqu2O
VAiOsDrY7Og2Pfpu2vjrlxFwp/goCcBWsdQf5HZnCfh8FPmilfUyfquEDyjKjcDFfX2Va5JtNo5z
gY/lFmucrueNCPtV5yyCFiQMGvGm2hx81dXC0+2OLVqVT6vLFbxBbZD+iKK4ZeUxOFjy4nX8fq6a
3ixhPvjW6UjRS67QUs1+LEsQjI8GeVS3g3U2Yc2p/xYfKJb+slsFRo1t0d9Pxjisr9J87D6DlN/n
aGupgZWcfSgbR9knDe+SJFRI7xdVCf6NK21ryHUkLMaE0NMpmiGfCQ61rkUacTlepM1mGH0Ui3Yn
pGH7K8H2UGGH+Ne7H2XGIun/G39vgNtkdTL8RbCaRBYud93I7Q2UrA3yQtPnbVBtHngDa0hNJVKR
B+hEy99Arb7r+H62jtmLsdfT/5fx36xir652+rz8r571dTPIqSzgIF5QiE0ppf53n7xCy+tK567/
jWq9RRSpZFFZIpb5zdxd2LXezUptaDN0yv3EBdPBnngGD1QdMKH27RfqHq1iC9bfIQcc62UF1u58
H97HVdZpyctylM8ONE6jmvHPP9wcbIEZS9th9fknABNfGhH1sI6Kxu7rRSmuuUWrsdcDXGuDv3If
EZTfnuaDmZbN/oRIBphMxivzwBbaV6djzyb9ceed/MaPh/S+IuLwMQYBd4KLba+a4JHdhzXB55hd
gkhvbOBc7e5Ch8w44yiw0krzPkyJdqC9X513bvSoftLr1CZy/oqkA9cjtemZpnysvnYinwbUhyYm
apwxg891p9GS3fpbiD168a7HwEUX85ph0gxOca08f22txUQjd1ufLxPB9y6nbnx/19ZTGimC+sxY
e6IoBiLKAZou5WHuxFJM6YloB21oxZRjC1tgRl6CYYKr2hJf3vy5D/eAvfLLpUZvACrXSqepxU7b
/boxe/mZkN3/E1ZwSq7wyTrKYKMxDAE8WfTVFx6C9ve7zJTPeFqBpl8GjOM3WeEitLA5cjRbKFBU
I21XteND+FHf095tlX2ycxFi+bFErDaBy/mI0c+S0ZsXO608vvyUt1YxfrR0EcO58ry9eInfR1f7
LQedsO6yNw9SCWjg/jzCdk/G3Vht5wUoqsN3P8gCibZSOWVMPQPAOscW0CRZxG1TwI3ZPzc1gDPR
s0LqpFIY0COGDHJ//WW8y9Qdyim9DrJtnwoBp4yuyn19ZimmZSZMofi7p3dwk5sZldUfADlH5LNB
d1uDMlGiYDr8txm3Zvc2svpcRVdGx09kpBOObHwrvkqdLn3nSdz5fBkzBC8G9Uho5UoPgzGIl0q+
y+GVripmkbfk8smgwxbLwgAzK3IIi4qIm6CdhQ+9mz2icfbZMlO+y5pWrnkEoeCa6S9s5qn8Sfpy
PguWJBFYADRINr0md8Xn+yXELIXty0yVoMEvNnJ/DCxhdpj9wsjNXS2ynP3vfg58cpC6IF7bCCCY
FM0/+hUaQDYxUxWdEh91vh1wI8eGfi3Y8rM6TBIn3YuGSN30W6O2IKUAK5qOm9/BkYi0qGW3WNuR
FiU18RxiOFeUSSraUbIOAkOz28Y0nSqKfH6Cg1DixP0rfm46Or+Cvqok5MvtYrtc4EEGcWtbjtbY
atCHH75f3b7d0yEMsUlmgLYoK2Ys4FqIFsHmdDKWsikFdXbsOSPQyTFg1ZRcjCmM2SJrb2FLcaII
oTjR4EgjuqX6YdDTdUrcBgYl3afelMYOdpD9imFUPdUpFYLFNYLWW9P4QKZHbMPb0aSny6o+p2u3
57Uu6jmR0xxUHXuhqo6T6JxCoZD5QF+uRaMRbAhh6wIe5vrHAEePCK+hXZLl020XXRkaWGxmUVal
DVuoaxNJMR9sLsgEi/RpRRJLF/wuucwvlWF12tRzVa+CM4onW4puQBa3rR/wuBEdFWOXHgd3sJgE
dYIteZLL/yfu9hSvXey2WKWtfLtJbZzk1D7IpStfszvAaUslZ4HY6Heo5Xi9Odflfq0UkUJGi0aq
orFr9XdvU6IAbacdY1DD/di3mzhkDNLRmAHnNVVtIiXwYYDKOdNElzYqXwzMcoy9dbHK2GQ5fMmb
s6kluSRx/e3UZU1bAcXsphBvsuhhueYkCh9O0rhkLdANNtC7dkkUKv9YD5aPbIMTuPDa/FzqksGi
Lgz9lqCb4KbCG+hK40Q4bHt3IA66QMsNFLDjnLft9r4xV11ymgZVDPincedgxRcuv951HCpRuBNS
rr13MwplmwyVx+EENctva5kKqdC8tRfTO/1S3usOKfl84yX9Wppwt3f6aYNem4YPVSdWUGj6qVjS
NzvGsBscgwMFonFxWlFR1gRK52uPPkjb+i1q/faS0BoAFY6evipLvPsojIytibB3HwpybQQfUzaA
sxqiixDkAW7ADca6jYUuxa5Opdye0PD+nGmetIugWnHFs9a12TuOWWo1x9W7KytqAswmkLC/P5iz
vpDo0uoEHc4XR+hpCP7IJmsiF3Nz1Tg//XnqE/cV2gtNlQXElwhiIN68/ZmMPPzMsSxFNx38pHY0
+fTHbI8Pjxs5resuZReTFXPMlBT7YO6TyWQG/Lm2ccSb0v5vVpkKi2eefZS/UTOFrJ/dq0Ga6eoy
xeSYiTO/grRvc2YvdUPkynYvvXtY5xRmTLvjSsKppvydveU0ynucU2y/Dg/UzJMViLgLkXwV9Sup
AZy2aGY29Cqc2+X8RssZeCbubhfENc2u8L5znMtNXFJZWJzNpdx7oMCVZAPnNzWcjuX74cOtm4Ih
1kKaPo6aHj+pDrQS3mShWe8svdwA7sHbNr7zZUjd5Isv55UuFzCIRh+K36SXxNRRvUSTCP49q5Di
gzEuIqhF85KIhXxe6hc3w4byhVhJf62h5ohp+iMr7FZf4AlBPRMJy0NON5Xg1oAZWPS1kqEnNozF
HDqFkFcNlcJ3sOmdcxynBe+Yitodow5t6+rgsbMkOw7U4XQLNxUavRBJDr+lPgCQOJzI2G5u1lC8
XcA66D4zLn65aPNTb/48dDfAQuSusMf+f6oFEgmg90V/vPAfjyuRKWYxjSwTlyzVFXFsuVUMwwtr
ToCgZRmG0XMK92px8IC07biGSw0HllIkZt0J+Kq1dvY4+vqXAEG6Ooay7KCj0RA2BmtgOu060ooi
G5aMxX3veBLsdUwyay+AWZfiFrYgK4CUPqN9XdXAqreFZYWgNI18LeJTJGGBrze6kWIontPoRLbG
Dq3WxJws/o32k5kOCfMb6pX6bltr0RGcX8ZpHuuB/7ZC8lG+2b94q0J3xdptXgTIsv71pQ6MiYjw
3tMqIKI5aQqhRwHnsKwqL/vsWmVHu0FcN0BHhYM98O9jFMlPFF9IQuIZiGqJG/2hJQGh43xDTXZr
rcwZYp9EX4lVWh6ARgFDRSTXEThZULjuJcwK80v41J9aj9hixSbSMf3kiE/qlrKUMgAgqEUeq4jb
HrOBjc0HD8jbEjX9tMokqQUS5TCEJadFt2uA3Z2XVKqUJ4A6tid4F79CtVazRES/VswNo5EFC2T8
km0rMrHW9Mt3GqP/Q1a64B4JEDRfZbQXqx5dTRWpKN6nQm2wvXLpduYOrhuS7YDTH1/hqr8ZF0ib
wxKYd+ht3Lmp/HewLdI6h2tJhqUpqZzqEUITaA9FEbJljRxmid/+JLD8ckEkfiHy8OMBXXvbEtC8
/LVya1+ANXmER7jCdKTAfrK6s2g6ku23unhhYz58MP2InqtUt979JTGVSK19SKCZY4ZqxCF4j1Zc
DPlwiS+DvOLD5spDTa2rMRtg8sKlygo9IiigGdw2rDO0tIs5NcyzOF/z45SdMOqzp+pDajjQvvoE
6k3WHSA/mwwCYI+0Uj4ZXdrPQ762KHmn7h7gleHCc/ySxCudmdqTg/K1drhb5HASZZHJesi9U0Jx
coKsWDa88grPssngZFPodDXtAyDLbo5zkFv9E6V0Aknm2fR4lhnBp223WKDKRTO4WtnAdrEFTM8Y
vE/aqP//6o+zRPKOI4RXKXn0VDof8aBnfQHQoW/yHbmPISa8Nv05Y1IuGvrqHz2WJPPIX9CO850i
fw+oaGUJRd1UhfWmI5BmI7eQKgh5osKnvFXATCs8DsecPnlbmwGY8uuDwH8KM3Ic2sWWJxrc26sb
fYJKfTUgiAVjYSOTD3cWSvMymogBO4e7a2GwHQXqIlcNJmwquZXAwS5FU3spQgwZkqM6Ua3/Z7hf
h9EFrn9JEw5EY32w+qqmu559MB3jPykjCYCniuow8WlJymFqSp8R8oGI5MzNqJ9sjQu5UB7lX1XX
Gg7sW3T7NNMu9XfIKgrcg5f21jDhQetTy+UbchHOgloxD+yi+Qn/NiIxiH4Vj8RWXnqGdBZckxYj
pC8DTUEBCwrzPjUAoIkOI+5C1TDTEzAiR/+KyDQDpPU0cbeQG8EvdQl5fHVny7E/wlshNGCG0i6E
9hMxBFJfIVgpVFwk/kiLpj4F73TCayfz96lc0xtBd35ekkLOwhNQBNdbGRj8a0s8A6Qihb+H2RGG
LWcpfKHC0KWXH8n82tbc904CTteCKw9RkEd5iew4VCEteaNgo7RUbcHAmAzpM6Ron0FVr+4qp9yl
KV7MwuGGvMOYntVJMc3tJNS9kI62kxTcPNxsCe+6AnyQF9MPAY1Zk0/FdAaaPPcyk5JyiqAxzx/j
xDZGwUcdQFe/oev5poBcXUsiOnz3ROELRq+CSYoVbdZsJL32MKYcDXCfReA5PWh07P960QurPX0j
iiTFPsO2wA56R71WWnH8m/c9nofI9PAQpXZGtB2X+inP21vJL/V8KQx/TwgtzoJheKak8yZFbEW+
scD6jF7BN+nhCczgcBYEiHoB0T4HQc7WISfUpOofYcnQ8RHGrT3NkIAzh5DHrQKeHwAvtfQvegB3
HzDSX1rMPNe7zrp2KcINBN99rYvqk3Xsu9rFZP5556YSaPdbMBMM2gffyvOePdTCF/B9DDMJ8Y5z
sa6Ats2YeFc1xKkwa0tYWVWY8TtB3Z7oSIhXpgMAVrL4YpqCSKpYBtiAs+ednrONLhhSLn495xV5
9l/OQBzt3rMP5dA5i3VwMof14jowl8jBj7M8LRRLvBirfUYfLeJFrU52QCZPz0Ati86xlB34W7Ie
cvJTsgnCBDXNe/d4ZXSKHB1A7TSskx//m4uIRwUsBCccXrbo74rPi7iluENgMIaTV1ud9ZZY7Vsn
RsyacKtuDAjt4AI63DSupL8Yoj7SrhXkS7LnVdEKTYZ+TaYyfOskIowWyhIb4e+lN+HNxbZl7Aoa
+N01BabYGpuiudTJFSu6gKntYx/ysAhujgZhb66jaael5RpTEKpxhPbxmMOmBfrC6+O61RU/icZZ
RFjTTHkTiy2/2Wzdg/56jIC1d1D+RfsovPaKKycR9UklrwE5icpNfMm6l7kgHUU7Sxvld3gmJKfy
qZxaZbThoToczgQYQfJmIjMhG4vLaJDY3ZhHKgLmJnpC8PLKBltNd6PUjt50cp/6+7vGY+bhdhmn
U7pTEnuIe1wdnJESA66GYcRMNjpVhtR3D5xiaX0udXgNJScvtYVjZtRYCFAbu7BF1KMwjzPQ8QEN
sR/6NTdVfCsCFg6aOf8EAFRV0oqxxuAlffHU7O1oLcAvgSUISL346ykLm2hV9Xgr0wLOiHJ6IQeN
y0xT0EF48bNk2CChtTFJUMyc8klCOZTPw/rZnOawti2mr66Qmbuehf9iBwnK4+F6h1Ph30UdIMLz
gGz9Vj7E/yb6BAFyvV4nCNuvXSOng3CYjkuqCXhUVcVy+AoACvNbVfJP3RrB/HGYyg+u0IE9sFHi
145Y1bsMUrHSNMLgKzoz0THYHQJ+uMJKthIuc5K8GYyywnj+0VCVWczPPhTJJsINAXnZwyNj1gjZ
wGcaufb8Zsopq07Kzwg90d0e2694q3J6P2tL+lL73KKcl7b8HZaUSkqtdi8IrlWMKEvbybj4O23t
p+jS2BbmLfKb0bFuw3P3aaBSJN2kGdv/QSXzOrQ/yQHu+dNQkt7wqBZPbZtu6gZxcZn7eWb4P2kC
+sES57Z1QVb6Q0M1WSOYk/NwEAg2mku+Dnqa1b2djCnsguaHZ8wKwmDAAcGNd67aQULYNLIECTJ1
tSSs1HVF5Mocb5mUAwJUcAS2W9rglXA/G1+stTaMBEJPcmXCk6q9FLRt5nepFP7fnPvrksAUn5Tn
Zy/7o+QZ5bHUE4IKYR/HYTA+seoOPFtt3sguaZ3lKasaxFKc4PAY03ddvr1F+sTadNUH2QKo15Gj
m1rtciOGgPhWB1/zdZRjBgn5dUf71ujuDi+v091pBEdbYSZ97SDvYl4hQ7a1RX1H0sKMQqmf2mAo
2Soqt4W7otTJsyGp8zoisF5Crma8BDbcH8k37tMMUhVhJMjjY7znCHDN549nEy4dm7/YYLdJNUHj
eIamXC/hsaG7Ywer9cbFQTvuIQhB/mu5hFgcdVeeQzpxDY7lO732wnUce9jEBeDhTMz7igsAmdxo
2HnYwSUuXeUI4VEaRbDA1G7rg0U2pJbrkZwJ32UIQzPv70NbfzGHizLGo8Zr6XS8d1wr9R52fn7j
aI0D/JdB8RJaZlQX4id3/oXAb9wbmupCFyfueiY1zCxdMWKbb9UKmXsuykJ8Zg9aC/gIxccBGnkK
sF0Z3ir8SiXt/pRRrbLHWaThDyscbS/NdnkY45NdSIdJqA5OUD4KI8qNk5MmOsPA8LxhkQreFg9c
aqn5kQw73j/HnnUcurYDwzan9V5z02k97y/Y+sNPwh90vSeU/1BvTcMgjDUYjaySM8srpiSJzBkJ
uLm97bxb0zEKjZh9SJ6D9Qo440q3qsMm+lYHFSG58W256C7aBi6HtiBzDDF+OUre7zJxVdATf6zQ
lN0pwmhpe2JI1FZ0Hx3O2R9RBSJJspzd2IfWI5E0bD+kos60YGarzg4zbxL6NStzPMilm0VV8tmQ
l/y5JNFX2EAOdyDZIWx5iSZdMDLT4WXWhVssRhz5rHp0BzZPWkjDvOiMaEXMq/wuBVhbv/DhdANP
IvIxwx+kAOAik8Xi4yPmEvaiaPyR/OmTQ03O54rBz1pnQZSFsmAP4yx1wgavOr+6chVr0880HIOC
uAMVj9bPeLnbilNkHMzC1Dh/t4Tw9RrFGacmHyBtQgtm7p6D82+AIfOHrroGqfWLPP8Mgyl+lSo6
xlzqrIUeYMJqfDN9j6iZJFfoEyn0cWOwP1G4v8MIOnC0T/gFf+750/K3BnCpqgyKeoEpr3hSgVlk
kFgQrwDaWraKHRCAmLImo2WGZOpZTtkfVUOUt5SvBFTYiI4Jp8JR9dyxHWa+JBSLJRPS/MvaU2hS
SmvJfHsmvntf6tTG2cqrUpW7my7i+uE8P7K9FMQRSQr3c8QYdloxhNHIp79quPvCfxF99/HD/7vt
aeVfMYvqrP+QsmGjZULZWWKmqMG8PZAFdelHJxBfQETkDTbVQXTejNtyheZIIcuJxANPTkcefrmO
vF1U2LRCzz0sPyWpPOOs0kT3EfDdap8yFX/BxT6Guvgvqnu9qxFcrvopliFSHlUSVsvfKNxXPZ4r
nXXINmON2ZTinC/N/dXPlyD5luK6E+p6tWJBnW/CHKB8Ue/H6EALbkbbg8+xnF8+5yz/ENyEgRH5
11XQFubb9s9GJOYEBwrH2Z+0EryWOMRznDcaTg+birM54OjFKKbMfJKyIAXXg3omCFrOvYbQt5vU
GHbEmYf2Z3BEcXX1Bb//66fM/gVIG3CvytxTYFkl7hI2lgvJBDWocFE9gLV8P7K9gwuKH5tS4qFp
rVhyngXreggBjjZGIaB9bgw50a6OmA+Jnh0QZO9O15z9EWANAbcBRfpRywGGhOgLg9PWAVjSbgtX
V/rYVkYP10g0Zac8aCTjPZwN702dQKhlmhi3wMlJiZpE4b4fL0to6kH7QoAf3/8nKMpdWQRKn9iu
wL2Q1Ijh+F9o07A/fHN/J2cR1JgvCs7O/tgDHxQRxKzK21w3YLwN1pc3+yKfjlMmj+sjr5Vc4SJp
iGczjR5XWFdW79cAPFsF0myHUp59k2pPOp3bqzppOu9h6nFeM/jTFlon8TBHY10qpbNBtBsryTvN
7/9xM0C77n79uegYl2EBMQKhXln3O61636M4gaQyR/hTE8CdgELBIQVz7ByaxzPrNsWYx1glZBe5
ktBKEF1HQYkQ++S3qrb4dH525LXPGh5IEcFcyZldwK0fdGcP6YsS/594C9npj/wmOkv+cou+IR9F
Y0eub7z9fM3uBYLWt4FPqzF0Z3XJE9opvlyoNojfM2s+BoR4j1AXNJSddhUdtj9q4czIs6h0COiN
fDcKB63nonbgy7cztko/fcreuMjaAL2AcPkx2ag+cyIUgpXKkZBcCyed1WOEm8iN941XNNvYW7j9
bTjjDOVhrJZ7wTVKkzKOsVbJjHQJBdRhpINcmZg+NFbrvxQB2/qMxmbe1kJKvg9JklV9Gryi4geS
Lhqv9cVaZTLBG08H1Dw4xZA4MAdSJ2Xsuc+vcIrNB4O9DYEapgKXwrctIPwCtyq2F+c0SrKCsKE/
4b3U+ZQZqtmjQ8d/5cFkiQFp6RMWFsCqbREMpVeX7C7jOsn7l3mKGxmGdJTMbFAww6RcVxFz++/8
EmdqJR5A/KPKYTveX8mC6uFd7qbSkJqegjDgzx81DRnhdwV5uSDYvXU/QWXQDZRepDdmFaK4/ZPc
5AXMaq6EfcPJfz5RdcqVL54yTvpPFdrGxwNwNhzL3WTg0iSz9E+hK0E1G7EW8pBZeu9lsqL2KzJH
ZZ4EZy9V+ZKv9XjAkuxm2q0VNI5rspnWmCy8wM45AsC5L2iv6O+f1z9r/UdTVUG69J2R/nt0TS0L
LtjuVpcGJLwcZrCyLFnimNFFiyB8AtN0UahTWPUcQNbLjCP+P4OfjRjxbgKMHp28iBGQww46Myhx
C0rwD04lUnpKZYEaWKWmjOxOnZuC6sB/nGzl/rYDW2yIKVT0aGflRCe1TdsKkeH1Sly5/DMAWxIT
Z3120zp4ReBavlhseUgXdSj6cNLnUgHjQ2HgtgQTbVPLs2uDexuXh4hybRoYrQOtWd0VfMliiWN+
4u2mS+0uPxSeVI4e7m17CrNdIwKwivl0490K9TOgRTEUVxbYiyUUkawA7fx+OYC2gOzYI/SDMPvL
lzL6X1H1RugYSKpPIsPL44E/WpuuIuiP9ZWYOZD8caR4AnM25sQctJ3HmH2dGK4TBJ8WYKb/Q8ZP
P7SerOS+Xkz4mIrd3CTMXgM2n/bZqt45QSQUADhV3jB+XPyeb5rWjjg2WxZVKqOGt59uIkFlHBgV
lwMXIDN6d7S8o+RitROJg4B0aTyw3zWkCUXcVrgF5l1MQzCUIBmH9BEJZWko5A+MFgLjwUu74G4w
q4sEP1nb/r9w01lArBVhlOZoeFsOxf5lD01tLiVnMb2iyMDHVJsm0Ky6SvtxPBR3MtyQoJH+68BA
ZQtqJ/vRsY/eARtJ6Xoq+uNyz5Mq7B8iiqRUoz5KorNqJijWXcE46Zj+A5uxs8bqBDcTQY+3aEoC
uag0XW9ATsn3bQt8W7x+mU04iv+OQGPs+/blwsm5qCmy3pcQgAsO6jnKLlMC7/U231a82pN3/nQA
7GlnicGEi2bceL/2I6FUmJzgRodWzFVD5XJguOeXeV3/2nwre6yCWYf1Nnq/gCppCjlUAoM1zxcU
fanue3IPM8xBJwb0lwDAHm0LSvX5bH1xcVixmdMigwhwKIogUJsurZ+TvS8l9xQXsCY49xPK7vh2
HEG1k611BZooaRD7DtMoMSI/ldM3DViITOLrbILD2JdpgzAt2HfNoaMy5yVWya+ura9+Ih8fj14z
VGydOxl2ji+m5XRE+m3kKPiNjHyfY+b/HEsYfG6D1qjVQtx7XcKZYAdIIsMQ/abMvd2p2Yj65gV/
E0fPLPu+W4qUXBvwZCJjAZ+W9bG03HDPiGZWsjhyd60CUfJI9QY7LWBeNnth3TAqkTauxT1H+5zf
9GwEo2uGunKmj/xtjVL94429w58ZTIgR4+CpzUlycDd5a4HP0eLbEqfEYwK2DTm9Fq6SqVhLidsa
OiX3pdKDV+HgOodyPjWqq07WGNIrUsl9H3KmQjWksB1H+4lq86ERUYDl3IgQrei1RJ7QYz2u+iCO
JG7D39kEo2P4lDIYElvE0CmRAlHZdtCuLSeAs0fzO1GSPpaUtqFgktiH1BG957RzklBaLggaLiaZ
vFVTOeEpXu/xTSUCFY1eDlwEvdvuno1HV1IuprBVVVZqyRMiR852Ub8ghgCKUIC4joPCjaCVMlAR
RKnxfX4kM5VeOs/HX9XCiY50DOz2MqlAY0dBChmUPbwDd5OhL6CL1vFffsgORQmM04TP6Y8euRb/
BOSqGgWv8cBlNOS2kmNmhNc7eyxeW6GotJnr8ymrxF8miAKlCrWSk2+UHuASHpY7B3J8/TnyEaeT
6KhCvZX1IXlmC3Vv2pX/3NKKpIyBYrEGd5Uxwb+YRkWV3WqWQ7+ju6L2QRzIXgu8fj3lZo7Lokfw
WIUVLJ8bEMX7sCLRwmNN4XwNwBAIhfYUfdkrSaSaRsd4IK4So0F/Y/W3+WCXrgTYeN7IbyBxiNWG
ti2b8eT7D06dJuUoS8T7GFw8qPHBqlPlalo+WN5hdpSD5oelURAr24IKW/MW+AH0aXtLmI+5IWsQ
AA5dlfB1PF8ZvNLYZBCx8Zp4+gPZ3yIeG6SIiR2JgDih1X9MRI1jmDzDqUZ3ZTZ0jpWmI161PE/N
1DRrqTXcRqdVc1EnCJckh+TNkkIxuKmirS+0qQ9baOrtL0uNK7Gfe8WjmQ+d3WU67W/Mps9Biz9A
BQmmHqjyL8ZYNbPQaxk8kmM7QosUrY1EaQ3pJzT8FQVlaN0EctV+hZa4x+0bAV5gJtak5FK53vlZ
hWReeMFWdKa5NA4Vl5Knb/PneZ4AT4R2BFrkDkOXviWoixk8Mqu/Cq2Wko9Bp2+3XdI9G8B05xBn
hNvQJaZtXVSNn1Mv1bnznxFUR6W1x7TO2RSMjRybdmiS+i6SRdRLo7xlnd396kALxcfBuhS23i6Z
NKmEk+VfJZ60gTzQeawFk/97HDU7bymvrk9Ng/UjF2TAmwDMB10Tn+gd2QoV6aXrTLrLv5y1Uj/4
9KrKrWadBDdqJPNVAixTbWNEcT8P9N3j/PfYfiMjQn14hU/M75Qu3NNEetffWgjaUL1Zkx5c5tZA
OBfo8pSkDRFqoJDW4Otl6fNKM5KePxcWtS9+a+MkhMiTDtTK8Wakose2f8WZnD8qHj+LcYvEGadO
aD6YkJ2/T4+dTHE1Y5uBMbdhuMQhWQq7EKQZHoSsfJbjQ9ihAeYvLs7dTsPPhs7yIFOelTiaOyWH
Y1WHgVqcVkaD4xy/2tSPeE/RbdHBsuq8kaKYeOjro+9uzO5hbSelDm7TPYcbaW5gAAX+lLiBCnTL
2/4/BL94HY5L/y433fido/zLV9pGEhJEojYJouBGvlDS9LA2gw2lhqJk2K7m4/fxjuP6ftQAhpF1
gv6xcxp0Dsjx6/hNjIVZLeaAvMbZv694WQ6Veue76p4KaZjHzYRQXWbbem5TwzDEuOWAVaBayaAh
5voM/2VT4mQu3vgT5Oi38kx+8hq0hWGWhfEKfAHQs63YPIPmQhZ9wIBfLxLCVrF9hY9SkYY8sTbG
Vbnd3PUIBhn9u1O+NOT6XQfWKR9uWvZRMMHsPt+PCBguFCfuPZyZa9IBcsqHuvUtzj8rcq7jpq/X
Di7lGdYpKFk3a/WyZ0HYMMyyGJOsr0MREMitgo3OpDLT25WcvjnWpZ4KN9IlJL1BiI5+bYL+Az0U
z1FES3XuscIdE5J5aUvZo4JdW18uC2V2mFx0SvqFtFMoom60Ck71n3HkVazet6dE+kAP7zuSDXHO
bEJtQnu8gpXEmcYmucw19e7AwrrPEInm5iCW9m/5AJXS02XC6TSD/vpe4Y27wYF/qY7JvvjufeeQ
yy3qSN5uRBO7E4hQkJ+4MsLdyGxuqOKP1KoDmgCvA+lmPwGMIvRZibkSxneks2+h/zaSJBzvC+0j
J0MuuFGWQ4QFqbGT7Xn+aUZKztNpV9Y/0Ny2D262TqK6ssSbb0n9iSO59OoP5jH8Sqao2Vk8i488
btkRU1eUIPz4sSspWovXMsG3uvOLXGrXe0QYZE4q5FVTYosgtVgfVgFvs5tOcyOglgCOK3jZ2WaB
6CBj9DXmfk9qFMUv2PZmcIL6TS6UXREmnscWQhJSthEls6aekfxoIBkvY3m385g6D59Pplv5Zfxr
/pLVeGElb1oWVTSz2mzbuDQ6TV96mdvF7JWIShfPUr58GSBN94n09u2zhu472tzw04+pFIecvfOV
Qt6k+KWB/PQSfahNoJ/QYQ+LUH1cDPIiD+cdRWIdPr02GKSNn35m48FGN9yyvP5ilmOH/BWxoVNH
BHKoqiNrYHQmDdr87/lVtrQijj+vCBR3YzuMc8PEwiAnn2Wp9x2By31KZ5HN3qk+ax4bMtBilHMe
FTDo5Rb1+3OTElCDArPFsDORjXTcsnU9TuHXNPSNO1SfiIEBUU2q+oNIAkosMB+r+XXKIK05Y23e
fdpeYyAsob6IKhPlMegwveEQQkPRNfD8+OwJ67ly+VfsEqi8J8HYcrGAdo752fqfVtf7YJTdlBqM
wqyW5Fdy5M3dHAEoxtj9ZCFpHGhPXWBg5/Ml41Y6ymP8oNZT3w1LO0WWQVbAlGGJEKDsb3E1qgEl
uYrdLJ6FByd5HbZn/fox9trpWja9cgYClRWRyxD23oFmHaccmYC3Zp60689gFIZhsEYVdKWgVYf5
yHBgsYC7qG+l8qiu1B826EsoQaeih3uHL6GqeBiOlwIFIDOfHhnePu8IED307WEiF/2sLjq1uIcE
QdeFiTfhygJCn1BrfPB6SGjjaidLzcHI+R1z7ZUookRAX9G3lMlY0hnY8i1G6upz5xKkRz4ZVfqU
doCWs7s3PLlAWaHBGNUYxPagFc1uAhnTIXEWYeNbuheGvucRX6Ods8GH94md8oHEJXj2XkjsNIeN
1icVqGLbAILiMpX+spxp5PzDP6/Q/b8xFY0EfRplNmsh8rTufYMCEV3uwGVqn91BEheA2JSBCIxl
eXDz/43sSN+43O86xxMQw5xkDrDjLMbtv4i+VDboNR2EIh4lCtVknPTJjhBUxd38qHmKlKtuVYzz
NN/7MC+BTyCmc4l95dS/W1d8pJds8dk0PbXDTb4ZrRqGfrmtOu9JAksKYF+H68KNRzgFHfsR1VE9
FWZu59K1qne4F9dXPbl3a1S/CEJaUUlk8AEV3rkkYJAQJHhgiRS1Nz5Oi6x9kh4kQXUUSL/cK+y2
Gzk2DXgVotqHOTyDUQyIAThjEEcc37n0HbvyddnHSFMPFiaZZ8CjYoJmXZNx3UQwvasn86y4Arvy
OqyvG+VVMbWiA1YqJcfaF/Fbwf1RrnHFDaEtPbdmiDV3BM31DyxAXK2DhP7MHZCZHM2V9FKKfM9X
vwiCKRo8UveqtOPbHYfZnuuFmrUy4vpFmLfmy5BaDJTjWFX+Mx8ozOVoxPsBhJGp5CzOyw6p29AX
A7nn+UeLJ5o9vv7PsjhG4ozk3gAIT0MJbcU627p24BYYDevFwh2EFH2d+NEY6+v0W7d6Eq0dr2wC
2EbXxb9SRIQlN2gW8VVUVzNNNNXSKgyrMfuoUdINDjnKz6zD7/diSbP9NwOc1EnmbtwpwgMYpM5H
SHR9FDKUk7mZIJi7RgUt4V2PsedQ6vPi/QDM7Nk7Qj+ZNvUOWJdM+MDaAm8Uji+iGOph6qCemV60
EQ7cefyIQzCLPRwUBMDkD3bNdL7rH3WQ8M826YS/jjyr8ohQgJdpdnhnKIyxFr3aiYN4CSgGCNFU
hMy6RPBHCX1CgHajlUaQM9Q9NASwJjMKhPcITsgJhm9PUN/fycliGSgWHZYC3HRLbF/2y4QJCVX1
S0oV/q91WLrlsqE0yEOMNmTiyphrs891EKuZCZi7lGnFTm/xZD2p7Dl6NxVsNRtDhrLITasWR0lk
MZ72DLCVJEVbScxEgHimum8Ldh/IfBgDOCAGvRY98PdA2VwznYNPOdCv1ufJcMQZdBVlAO43YF9s
rPh0bknN9kSY5XCbGScDoscNO2X24Kc16TbX9FVO5DCZj+dvYvcclpP22zCutjz8eBG5/rskFE5W
bwIfqFqSuKQEGXx5J5w6Sim1glPfPzM6wmZJ/a/YkqAD5UKp9/x8Duva3rt5Ky1bCgZdC9VYIA2j
HjXEy1KYyu9Ez/Mpv70i+qUPE2zJja97nclLsXL/ZCoovt8SC0amrXvoiu2Xk3loSisxCVIkPVIG
dRr6pL+yv7Qz4AjdJRRKbKYF4E1Zozz6TU2iUT0RNwGLTMOpev6DR6PETNj8eg3XzWlCIl6SjcGs
pG34+LkaS6o1Kp77zo5WS8TsvCQ4tlxVKtf5ChtlyKFCOB3ek13k2k70b82hzYeMiQfJ2RVKKCCm
BuIsnR7Cpom6hqcQXcWsyZTtpcuCay8Z12u9yqA9gc2RdOQqXpw5wSBcRZuXl9NTyjPV+hjrVijm
ySqxFxacLZOaREirNMcwCLMG5+vKz9VeNDUmxZl05Ltq84+OLLF5P6d9R9CB+A+R4/kdGqYxi8tj
nWcOQt1MD9pFYntzZChK6Yh3p0WYK+fxIfVS6F8vKcfsbD65nnQY0340pS57d92XVg2Ou7gBd/dG
IoeK2B37WLDSur2n3Qzdy5yKvSd9ShiEdscEEYccfv3e18VmSpLiVOp5UcKZLzY5pu333ZOs633r
UIiyzuOaNIEMFkqelCHTJouz9whKE6YbYto7Ue6xjarP7pE6Jb/04Yyn+pzZ12YVP10yH29B7avG
bXeZfW5o7FDPnrCMwhN0z9cBY6JDbh+wC/KnGV2zhgV1OkinoX6WtQup9q2i/j1CVr0shvEYenn7
6FjquiMtJ4F5D/+FxyaqjkmjdVx1KE1u01N9bHZNia5FeiJgs3jok+2emIt2fOl0DeykLXtSSMJW
ooAO10iUuBkeVHXsvgN1JFwlLz/fJbX7Lw+A0xJq+HYqmoW+VzjU7SiCeN15Yru9dWPVA6D636iG
blFQgZ2cyVfp54AdxkWfLj2/+G8Z66ep0RWkWn+L5S0BdQnTnVoeLslHi0sw4HM+YYF6o+7Cz0P8
3UKbEC9vxQNfdIQRvVFrsE1QQocZNsIJ29bNhNET3+J6LPFVbN/QZBNmyd5C+04mKQXxfnZm/KNY
upGW/uov4N0lqtOS4L+YhfIciYrbjgRiD+iOG4wkJo9QnTCvirT93jClcr9ngisEltp7hnqpdO2m
MGZIpV+C82m6PbTMNcLy5mdT6VF7Y8w1qwrul+uvWK6RJlW5kueuezwK78hWVdsOyR9u4ozI3BYi
aeEFbfTpFqEexyip6M4TUGTDfOH0Hv3vD57vTO8FsYRWsps64HRPEFm0Qjm5ianjPxGKXe26UpDK
cCf890IgJ/IBpciV8Cuy6wS7aCu6QbSfTwgGiYrk1GFwP3z0mPbVNGvUSLhEkGb+Wz9xN5H1bswR
tGnaHI3/BMyPbgKKV23+tdNt2va9ABM5IbWG8M+gygoKwX+XwC5gq3xGQSC6O1ZoNeyrNToJa0Fn
AIVv2UeqHGYJ5pzkqhz6mjrDyWFcXu96GxVFYL++cGHXQuJVATYtZVsY7sRJ03SZxvNHU6txnxfW
0ZFLiodbCJTeYeUsn1YjrO7KotzgOV1wfy1hGyJRk2W8EYI7GPve5N098YCgiInI2+Z0ixH/fRxR
OxF2uOQv6EeMimmY1m/zraf/63emVpNdQ1iQr7IAXTWBthimDWw94q8UnULkDccpTf4lpjlk9xdw
qf1SODKsWg1A2FxqaLAxbC3dajS8mdVYCBUKApCC6ohky3ZsVliZrT8fdKUEdF9n67upNF8AZAyt
vHJs8iGkjlSj8R898VZ+HEzYJAwAPQqKg5WJv+7dnI+/n0wOL8j1uLIr2lqrwNVIlTAC7ffEbhgb
FwJsBcTeKudfAq5vA6qorC5R9gRiLka2MKjFNrIZKWG/8hxfZ3cNFTq6unbquRMYh7BK9+84D3Kw
nmqd31/5NEHdy9wNd3Ka5yQmzJtquLyCEsjDt7VLJJe0nurOuLEpsx/n5TOpCSJUkrF+1b6SOBwD
lRbW1hs+UQZ0sIInibIs4dghhwG+5u50LbwToqboXg3ytSMNoB91LPrLnpl+QqCKsoYk8qlbNRw5
eFYsPS1r3lcegGAbq+3rZiYezcMKexbFswoI4oyq4WDywgR3n/tTurfg28ArxVVGBUCukRJYC8UN
U2U95NJ9K73Xp9aydn3RjIOsGokZl6GVYD9lLqfwSyMXkdqCMS8o38JLvjGuJ47r31ANeRIlt7rE
uKXBsVZ7ikrknQex1OkKoLayAswcS5fQB4nos/1pLHP6MGq8m/NH0Pl4lhd0hfXzeYgpuppjsUL6
0mbhkDcNBQlPES2eabxxpGVefYeTox1DkeVFpJzxAXmipNFKLpRRlewJnLULBIWmHrskrcqZg4iA
kWqqbOgSi6zQEUEFpbndlO9lMulw01QI2CML1yRyHErVOQ7AeG6zynISNolCdq4ADAv/mWd1WXnp
+9F7No3LDyAOCW2kr/zPOWzx0nUwl/xa9NGq4YpMbZbT+RPE3ETml1ylJNIWgiOVy8OpfbbBCf5e
EYdV9hBnQiMJ2uPr55pJSeSFsWa9qI+uiqYZ3rr9rQriXIQc2jDZnsF/pwFlaIAl/lwRcJ4sJm50
aVu9hVdU4T//iu6ZNDe5JI821zFOS+RCvbD9hV4mMzQduvn4brSQPe7L28u8bVtZnXRRImAjQeXo
OstCKXGan2kUEH4ukGQWaNCx2wrfWv5ORF/f6zJGFnKnzw1+597uyZjHWK4qQSWGJ68mkWSuAC5Q
0ZHq+BsINy2TPVTu86wQvvwLfRfCvN8OLx+xvjzQwQDbrGLTdvGeUDbiwRe1YBNLC1ln8ie3ZtDO
TuxK+v46jAChIuBsiFQhXruvL57ZR9Fcjq9+mg9WR8ru9BL6Vd2avxXFIr0Qr24BkGfiSxIAq1/v
vdXF137oNdtPdrdnyr5+npe/fdUGc+lz5X5+/JzERFcQNTyMejwfYUe7NbV+FUO71jKYHvpldgvX
qtun3FZhM24vCzxEBLXN+1o1RnqTDf9N3m0UIaMo70yJNAE+mRJW7nLa29udQAQ1OnZIwkT8I8Dc
kpGNcycgmWUYwHa4L3Gm4+IdRNAF04z13SXtNw1zDQJKNu/UkVC/Vzzmyow4FxHfimm3fciXnSs2
NTdtjTIsWOCsMxtvh0vtWtxYILKQEiXhbrpGwD4n1s/4huD4BM3ST35GjmwFjrqm8Nhdwd1KStMI
2BwA6kqBfxoqYxdpUP4rvuClnL9rLqCGioAwnVo8MEJyhQE3aK70O1ov1Y5bl/QrXJzcwIaGC7qd
3kEDur3ghHA6Udse5HaDh5Gi6H8grstc7HTDFJvpI/NzN2zL6R691wwQfsstkKc/3b9bc9PbScm1
U2spd4elBey52p/RBR2I9xwtipPbKHO9hyZG9Um94uZOxsUj1E1hsmb9kqCHKPjzqsfcWKzbkIL4
NMDcZ2Z59FVJHIBZQ5es8YHVBF7ECOAnE9UeJD8YiDILQaplRkRITYrm1bhpu8cNBktjacKtsSB4
prtusUL3aWBK45XEmEiKogWp9AGOtUORGiKJcjNRQ/b7daRj6WYy+/EDXqlpyolCMjqISWTTWtJ3
Vd5P784yAYCXafDKRCKB5h+nM57N/ROMGR+pDUmmaR5MZkWBGoi+AY8XQFXmK4LEhwUVjv3KsNBL
UeEHwRNkv8fmhV8iDO14y4NYwOMgESd8E4gO9XUkA4eVyLMOqHrT5o56vCTmE/347/ymZy34P/On
b+pOdSCI+SxL7OUBdWaTP2cY6BVB8/ER8pyRjcXfgLc89SzeHIeol+/M+B6HgHPaXG0GGUTB8kkD
QK8ZowHbj00LyLzXLTNfO02NZfKmz5CGsS571Ldw+0OHmtAtBvESjpqrN7B6KckwVT4r+MTrlUm6
t7Oc2Muau1IvwRIovl2bc94uKBcy6barHnAAXoi9VZ9RJ3q01RvcWSx7eXqX8qM9CA7ys+edQ9tq
5wyUTcOgN3owvnfxKYZWvdbvXAobJ7mcI8mgt6bZm/AH2G+IjPZkPbLZQWTAJ+98YccFsorQaKwv
QjEiDKjHGTfvTa4kbGzspGNThmUYi0mj5SvrdcCJsIWzajVFauZQwjUE7dRvBILbPi8NOxApwbRT
l/YC0af3h3S21tDbefciygaonbSKMfEg+ez4WO/y3VrdnEjl+Wt5U0V8vBpPVp9Y+swrYphdCs3M
fQz0OJfkOVx2jTeIawl7ZULdsijWvlLLYwmgVxVxjSqpNBaJLS6ahbsS8DelNebtUlxC2+lFc7zH
0bLTijFd6K0bSnxUbkhdRsVkK02oywScdKwcg63oWVodhm5Gh2w272oZx6gAbwu6SKNg3HfDRaAW
6dFTrbYJxjkEEsU92cta78r4OC0rIQB00EeDWZBP+m9QSJW1uAdGGWfXZfYBrwBkVTGe/H1FuOrB
R5A96Qvk6uTeSnQ3/yg2pkN5wbUeIa2GFV+YJMDJN6TZhQexabR5qJJH8MG/zCe9TLHSTbdBZE7c
rTeaXQLfypxRTQlB3Ui8lJ2nZpG6G+Xzs1arMJ9nfGbIVcL9LJ6I7VMNMbaV1O8J2fGGbmY8EgYa
EeYyAXox7+EQSZizfEKcFc40Z7wF3UpRmYzDk6IVsS7qKvPgF2ioF1yT1OBZsq6skMs+0ixEfcDl
QWOuWAFxsCsfYXDifkfBxJPm6V3vCeenIY6pQNJoLZMjWO55/8qWwFYaLEjZDAuW6QsI7YC9ckyT
r2o8i5+bC4ByXwdI1PylccXHeWYkim0AX3hCDM83/CATrXetuddgcw8uUpgUOfMHiGJgOMOBBx7Q
XryoJ3sRjRgKklqBiu8CI8iv/iO0CbYuQfF7mwUN0Dd/tEnnpKA9NXnLkkCk3sNhYFIjMReO4X7c
aCr7//vXPayG+sbxs5QlQBvzrnIwQ7uhNa8vmhZ5kbPedOGvyi1wmJRGnmulnlDLm9UKcKGNISAT
mNogK8nqq5/zhh4D35wLUIERfc5JnC8nNHC4yb8txQ6BM9woAkb2sMqQiKIO99RTbtnft9cNJKim
1YbTudGZ/eW5Olm44RMetiZQVT6CR+w2/BeYaZZBRXcnDA0FddJd4BAsXOnl3eSvB4hWgDCRSCkk
TW+kY3zs+A2PP749ylnmY4Vyxml3+gmsjwFm+62k6GcYwFvXNd+I+qwBN2fgOTk4wz4lv+EOn/01
WTM1j8xogsWkd8G/G9z1v2Wm7UndBEjdPhRLf/ICHRYa2ebYgbhIdFDsIm6HblOv3iHoRyfUUHCz
y4Fwqo2GiDvfwvc6zX/Efoo62CwWr/J+ggxO7BI7OJEVoyGg3g46qXIzWXsKoRnCNCNSI95xDIUP
Fa/8ERbCGiVOePrpNWmjVFy6soT5HMwB+pFW0+2H3PNkR6oakrE+XpFzWHIebBXj8b5zzAObHbXA
P75QSr9h8ebuILAM5IuOXbEtC3KB1j0yekASihuQQ3oH5bWk4QSBRPbXVbcrhppiOSliu0tKf5E8
nhIUyR8vvyQk4jQ+L2rwPOSf4yBTsjpiLqGi/nXlbRQuYqjveFCxoTExkTVQstwbnSJI1XsSSwWl
b1O1Wy7XgXGOx+bnLU11Fm4GeucMVCrFFAb6ywQ6ZDZ6rJw0of3MAcZLsP4S2szCr8fx9SGQ+ZSG
BQXrQwfWA/4HpITOXG+fPQpl11Yizc9cLAFDpD6oHuWsq9kAnQwX/mHb1i1v/qzxgzn+FukvgZsV
0xfzNqYE69wZF4J3yRCp4CmW+d359GmpObkXOMMGXo5vXQDHxE7w4qX4JXriLIQuwjNYQ86BfUgz
FfQsgapHaP2610763wj9kapiXf7IaElYBaBhwYF3VqiNsGpRWgTzS5Ab/l7CXL+dmzk4RXNTQHJj
2DwJ3JP90t3O43l/JPl0eHA23PfYncL/N0RlrJz08gsYfNvtvWoDsIXb8M5BJuB5Y7F2d2wjdAFP
OcPh/gCGKIYwgJXc777b9eHsruEqnNFQ8j860oKoD9VQKbd6CQKRAPdoedSoFbF0tkIv4Xr4ofPu
EHWBzEDBTNf0HlTQtub0Hat3YSWgpm1DC3HHZ53C7ERrafgpdlHoMKbla0htB2CQcgcGmaSB788u
PK2EoB5e7kVrwV504oEo7mh8mVZ/yjd47dYIAKXuT9SYL+NPsiEHrFER1o82ebXJBKPCz7TQDrZT
egkI4RDIp0wSRH4fryX97gA8BsHPdk4S1zWsmv7hTylUdIIyXmS4cjLQHclygMzoRCptIOuCxzt+
daFy/V02hOslZ04e8iTMnKdy7Qh6v9BYPMyAhJmIqXJWB8sgAAA6BFO03VgFN3aEJ8b3kE5WIu2b
yElKSKlY3+P84lD+RPxP1VErmYk1DFngI3vEomzR748VcC9eryJLzWDV5XQNGAE+ir2tjtBkQ1Oq
18TSuVgLVQDiLyK/QDg0Nkv9Qq5sn33nFGXo8Pws8YYTU7K5n9Zre21ZBrjexLpJiRusomBO4vbU
NgffjB/Y1Qhl2gt3hkgM0W5uM7s498QGTS7BrAaIC0XyGcDhZIHDQork5h/SOR6/v3V/hnGZzMQY
Nsryem6/imHgWfDp4SP5Z+cZOneYQLQgBwUPscrcrPQTvLRtLzI+BFq5LxLZ6x/cU/1nO4cIyTD5
cxX3QXtf0QegEl6c8GcAkftx7jfFijvYUfWOr0wCZfIwPxZvgzEiH1IcPVxfljMCOaywVgEDbYQq
r9HyDaZKhKXw4itXbZpgWP8BNNtjSptzEd3zD/ygVfTIsOXNT4XN618xPyi/Mh/eeT17LCQ2i3eS
LI7xjdi6PejveZihRekA3MdOndmKQa0JU3MODXDc8ckw01GUrw0Cxf7yyVThHAhG3JASfcNici6m
QCJGjO3IrhmoeCJ5MVKN5nb7uACvWB30hyVlUko+Tx/6dg7CSBkmnZsc5zc1z7TWeGETUOl1HSu6
kclp72xsO2AmjiAtsHTbVbcnovpAh1j/f7DxG4SWdM+q+3jPb819pG34IiR7W3ZWZSf1DHyG3ylp
dulm9h5rVIu9Dfv9prqlntlNko9skp6OXGVDbWlyttx7//Udrh5pXYKK/jkPR2wVcg2trBN7B6D6
syNUTUQSH0Hbj3+FFw8nnMPnnx1bBInEK7cCp/enGDjC/nZdd9AscjM69WNpIVFkJhguFOxt4wGT
RT//vuqZCOEn+pGejX0xyw507LR+KU6gx38DhUuJRNwnzRTPAIB4kuhYujsrMXqvY+Fdx2Y4yb8G
tHilI3E1V6p3B8qACzlYBX4tbLPAsrSCAAo09KpRLPtVrIi00AABofbxmSgMQfI/Gy3mpKKHQyxC
rgMCqyqqdDAJiL5D6zov5IK6seU+RGmwLuPKnIK4IyRCrENyRHPHlszDCY7vGas2AU87ShkRFw/I
zmP1ehQ+SFUSsX1gEtpl9oq1GeOH36LSk3xDPqzmlK3sfXjMqSQ8bACYCmCAOH4ETBrGJsgzxN4Q
PpGT+I8Qbd+CyjthVRa+yb7kkzK8SXQFadWGi2d28cVG5MG16iXW6Mm0oSa6ueu7kIoTA2ZJYCgM
i9R+lLC17tUnahRq815QzQqRLgmENVmJpfUatRQhUkdeSvQ8r8Iy2wYW74SYskLaNix+xN1Sh0l/
LyzE/Qa83PpHpPLTTYkK7HxAIKLfm/TGMeVC0/Uuqhiyoh1nnwlrsoEClBcpRjix8JmmPxEkN7d9
04eLCBYWFmr+JFjISMvp5o90tqurbyvd6kN31w+rdyxlZtMIvRmoCa+hMMgK0YnQ5JDUbY9fuusK
sAEUyX47aqwjwQponrHiEOlZcd11D271/TDuYKYv3HXPFJE+NrPTfGYO6+RxOHfQ79PLKoYPwp8W
Fk+vmFqewLRvvFDZ2NYjtl4yrzA/Q1o5iwaS4ZYPzHkHvAhSsPqk83e49uPkmWwZI0OEDGSDWeL5
tlP5aFU0RnGgAsbi5sUKJ9voyMJQL3Y1YWAv1hWA08eiOWXrGWveA0dYPl81jAnAEPRDVK1aSuXX
9AFVvfdM9fin+M3eqOKXTidBcejQmkyZZFuYvjkfPHP1m+1ZTGF5psmiItU4Lg9Owcj1ClLopHdV
5bRwxYFwswBpOZS8tCWGgSm/PnydLLPGEf+AAZUxff5twAtNIHImwvx+c5nF7jLjqutQTUChaU9M
bwNbcKOl8O2RihPcKHM5TQ4Z/oHr0Gxj60Nr+bjWONHV+E+UF10tgBlCXuLBoWr8wFjMsDylbexs
UPZvqi5eUHpFGYHNjOuiimVhgXQKGqz56mV4gQun5/8LADet4m10TGo5JEZAPoiPh+9EEjpBeeb8
xquUinpg18T2OS3jFu/uGUM9Qxduzfd85aGltSMSdaFGtQjQyePcmklv7vzAadFyY5DBb6LqGqsB
+CL68FA5dPN3Am6Th3Sf22mXdG+11eh75YY1lDZA7dVRQD47Pm4fcP1D8cFHyNmqqTaSC1gj0dET
Df0ejVRgp+47LyTBCyuFSk/oD8X/Oz8me0bQ3KdgEgJ3/ghJAuMy3Iw0xzliPiB7vkfwtF1M9Upg
+Mz3I3RdzW3KHaXBw6Kx+cx9QV3vSLDHRyzcFQv8rvO8OE1l0QtB8kCdrcpa8/WeM7oR5/8xkhEN
Vt0G0SfMvZFtX0iHeZ2kZkHP/BJHzSAowcP4l8tRQ8PpldGsjM9cYCqEBG1IaeRDV4EbdTf4Osju
CSoKRuQ9wEBhRRWhzLjjCLaERo4ms2AOEBeAUN4WHlqDPD4+EnTCTIbZ76kCJOSBnKomcN1hVdJt
Ew+cyRYGb6c3ofIPurSRTdMh7PMfyw9QPphhEOBZWN0hMcfyl88viRn44axSiOVGe5xb6jGPIDD8
qtXqK/uezgnq6U84X3XyhgBDgA3GjykEPe59k82/EnJkTrZmiCg3n2A1Ita3iOaiy5aicywBaD06
WK9QemLXbzNRklFOXlQxJfWqUq2PPD+WmrR7B0+hmQSPZC99m4ZkNJM1Ai4v4hJVa23zbK4y/sRu
gtZlpStPDdPvDFGjHFnIZoTzB1msxaT86U6sxGBuQTg0M9ZNAp4imwEkl3O/RjPzsD5cLBUov/3w
79sdJHwKl6g45ygdyzXB6VPiCQvqdNPWmb1sIlvRIQTMrryEh8eHoTPF4qge1zsx336HdztItPPG
wXrAwWT7JDbiU/U6xndi6KQEyodnmosoTqD6DY5lfoqI3G5V7DGrULphNIfsl6eX2GmL/9grh821
sFuxMHkPxG2JS4uaiirwvs0o+gow7krmpNdoVqtv4JnutA8BX5PYkWzN+6FUgMGNNAxmAl0aDzK/
8opmLrlSk/OIGGWapPQ9idsWt+DMt4bbTStI7QTPPN8TX/lActox0ger6IfXG2cF1lMFJnrAI1Lg
f/9B3Dln8FFg0vvJiCCugLuuaZojYPocpPPWefbR6nwishde4PElud1e7IcKZhrOge+cUE4MMNf4
9pqA/SN6PA8eOCrkY8oKkXCH6uzXnLhPjYWNZhOGeQxzIrUE1fdjC8YQiR0Fi3t1l7cjylrXLvHd
FKjOWo3jW2o7NBP0K5Adp2Ag6PPTq5kHEA7QzxEpjMJBRPCvwlPv0m7y/xTTQXwGfU/U374rwhjP
9zAA/2q5Rs5wGuzxsXW3qUGQGFL8UPhERhG4DFFdk7hiJw6laZQfQ8ZLdyBBmfmQshv8Ob2j0iaj
KrlgVsPpuVz8Ofzy9BF2CIV1n3DPyrp41uruBcysWkAEiR4wjDSvrKKhMPrHmiw/HzGv3WEEzIsA
k/Y+W3cdv6onyuGoz1xJGO95tFdBcIKNPKbhgms4r/1wBB18qELljffUQ4nRhALNr0WCHP45xBJG
NfE6IBBLmuwkpQ6UtsugtHawNFH45K062vBdlkWc5BTl2Zn0ucuop4vGSKuTe3tKA8RyTHP+LJet
cVoV6gcn1pBYrLLbyHmI613oLNobuk58kJ08dkA2fFwrAfMaVnmBcfBy1X0hJ6FZG4yuQ+I/M+ev
9GqNfpq0hUftZjM5mzgpzsFKmAIsjttY0e7UIfnZRrvy2lrNshE5yFQBnCbo+pg1e/2isH3Uc78R
sCyBlvESd6sirlDFD7kxgHKujuZits+eUY2Av0NZ7w4vu8yteXXrDAWlegSrkccqMuGqSZrKCIEP
ed/YSCiIatt2esHISl3w/aSd4EdwRXAeC0S0BFXB+9kDpZ2sW52iYXcnxTB7j3G4p5hTrkl8yOTD
6bklkjnHdHCZPUG80+IMNUGQtbt5RABprb+h2zdedbFVL0FPGro8R1JnKSuqZlnfBp0Kg5Cuzqer
+Jc6RcUyiH2ERtActF0ZzHHafLtIOkZCrOYTK63zyir4SexeB6ZVHiWKcTH0nBL2yuCNHOcEUfnG
jq41IfYLWL63aCDHOdzkQW9X653YJqqOaFofJINHMNQZZS/fHuZqlXJPvkeu7A1PutP1iiLaIXfh
2+9jhudJjp1VOGKSx8X0B3GksKRNRmUs5rR6hXX7JVle1hWLm24GmKseNjFLhPpFDy1f/BrRjwne
dbkevK5MipB7pBFgdSrcuF1RNIYq/Uijyvlhb1ZBhXTybeouQXFJY56Xh0L3Xgh5fCqEqOO/zSFi
7zO+xABx+W8c5jGcm4NAi3G7NtLo1GaB8M0pJLKWGgLyWXnjlYN+cc/BAbY5V96ihffkDMIaYGBE
JMH7Yx2ZWFi411Y/XbfzDrIYcWGayFbkWdv1Sm5J4/z2Znjs8bIIpz5RSAyq0qXIUaG1fR7m3kcZ
9e5Lew0lWRxcBwZELakWc5q/MAjNhQz9jKiOVJ1lMej4ebe11wGXxb/lHkx8HRG6HY13P7g0/TK6
xCCqSAISx6pJ40WuAx2gDRq8XfXGj29ds8EuoH9aZkEVFhJCNu19jDr0a6VvUYo/KAxlxmOEDA7C
sMIQsOteIygKDeoCn9iBjGKJXrjgvV6LBvU3+SI3jhD5O0vIBR/19d53tM+ud8qf2ve4MyXDMCLG
ZOuiBWjsqyqu2GqUSVRfbf9tSG787HtfkAIvjC1mVj8FFpGSkMYPB29MbZNtvOk5/L6yb8iVwQkE
o5eHrXYDo3oPnCleuPs0rt09Qq4x6w70eh7avsM6OrQsTx1qld5DbsL56p8Bz6IOBCZLBKKCN2MQ
1h+1Rm+VI1crkMjtqmHv6NaMW93hP6GAEjQGQthORdjzZIRreq4Uvggb/xYPzCmPTux5NDzkOPUT
IYA2IkwP0oymxC5s7jbj+Y9l5O8fU/Mxybhg53RSmz/aJsRoeHaB7gESejjZuAVOYxJHV04SvTSz
GbBMLAh1y0cMkE7HenGJzrMzb+0kcsxXVamOLR9GsP5tqiecmnmoAKTtBfKwFH6N0N0Vwp6kz2j4
czKAkUq+RYJyW3C4fvHOjCPe7FihxDBB9gWgd6WQRltbiH99x5vYK52QW29IRGVCuY+SWRMn7d9z
n9ApnCpa4HGi6VmCz+U15YBJnHY+uiynB8WSdEX9WElJrJUtlWYT+ca1FXuZx5iaeisUzAdBsgP+
TTIW+JAxDJNX1zshn6XODRouiwwxT4fKH0iQxiSok80RtsHZ9tGq9FuJ7lp2scq/Y66KNasmihkg
+WL+Sjf2LEWMshucG2zA4bV55Ov3ssU1FeOuNKSJSXPLnFVUNFaNYWvxDZdll91kRvXqDsFDaWYe
CogkHQfl+fBU/f0yoP0/ySDVEMWV7+UH4NXgFeBv7VtwJBKteYlF4Xcmvnqq61z+aXdghKTVgB4M
BG+hS8PfxpQAKJqpPO8pLoXzAZQySwvKFGOeV3lPadPxltTRkH4RO8Zbz/Rzg/WaqoVuLbGMBc3X
2O1+xDWalvElgjIyBtXfqcGgh5PJEYTvwXBl4JRYUeV46aC6vKKH/xOaiqBv9ButeDXuvp/VqUDe
1I8pWH5+dTua4fUkV0ZMvJDFSKT4yYQnPlvditIoVuFLgAMxMVk8KToexxYWE/ds/Dnk+FsgKsH0
Cm2HwpVWWcYTORCZT5K6dSPt3P/h96Z42/kGb/ziGPTC8Wm/2VOwkmuSg2gLS7VKPwAWYyGfvUpr
GKuBPQoBGtIRYbJDmCYDj2DdAEesolXv0DYfV5Yxw4xge0jXnAJx5HLhSxybsR2RBd/g0yxmUcxG
RZIG3eTetgV0/WSMqGIC9AwYMtGGVpWaf6RGvxNqNQ4CLgk9Y4JldIu/4cgyoQEo9SP+3FL8JjrE
FLkpe40+zLEuEzQgx/K/p6tywg1Oc4zusa+8JwJjtnMA1h2kSB0JTqV/JhmIppbpRrlSgFnZP7h1
Igqrt0+dL0BOvC1Vo4LMATNV+N2RvywcFOHfBIweleLAIICcKHNmdo8RrT9wTlhfo+hvfSXXy44/
stnYRHdXXNOr+e2g27T24Y66HQOV0Jz4w6sN3f5w/ol2+0JJtVmdZfJzPuiVED/AC5p7BvP4Wd2o
LKAnYrGQhK0w5FguyMLCH/TumDsSY7B1ITqlEv/8BNP9MNCyO2mM8PMHMXyJxcMUS489r8E8ZMd4
z/fGQ6L+jSKyoW3wkKq6dnnIwuhVujCBJADOdEXx1mO1GeDJ62OHB6JHTWMsuEOS/W4APfd6PJor
nEVRmQGq8LredP/uSsrvuYOvDUh7t2UPhtcglJ5YaoMVMbpTtM1a35XcjwWUWaXLgmcdvsQmFEpD
0v37XTyct2iQftr+qZ3G0ut35H3ACnOs8VMmBnASI7anye46gaCImvI0iphuNb8AdCyg9UiW1hLP
347P5MYA38kZTDlfRdClE5JxEtWorug3tRHS3J4VEQE1IF485B376bqqoOLegE7UiTjoMEAhwcTz
de8liUbnqT3FJPAyatZ/Iwy9PJel2L9yAgcQKkthocomZvm8XhhQO43vHgr20Ii0jITT+VAeYbb6
NfLyKnvCSn81nsUtYGAav1q0DwW1gD/7vsLRH6zOT4N7Fg9vxeOb5l7gbxZz1V7X8Zqq7Xd1zSYT
AgoKnUrBE2WuZzQSxYhnRuzO5pe0tgpOYj19TcwFoYrlSqstOhpjMYuLNyvZcfOZ9U7RW6RwuO8l
SZI+K8SbtYKivHhJmQSzzk60N+gIEo4Z+c1/pjdeSYul9kzokMzLLZrf/yCrH+VT6//6tx/WQxFK
JVbgT0km0IGRfrt/2SSNQfCzXxPwghoASFOxefEObPwmC/zETfc/0ouAwFV8WK4fRfdU/d6ozQGs
HbV4S2SOK2HyifFMRT+CChP8XlNl1bzvb2xUx4wnC2cXgNdt0B6pwz7SHM38ujfsAdqa9cnErevn
JIIoVoniyLK9gnngZz+WaLjef5v+pQAgeTe3VCgwaeZIDLaOtMis8K/sdqUVeb+YFQl6x0ToIUYZ
PIJnY7rfXo1uXFj5GuD8P2Ymn3qqIz/QL2TV0O0xErmCw4pud8tXimPwYi/WXbSs4c8lmYLOGCZf
2+fgSmty1O1ZxJYHM83GGuFc/drC6pNaNf5lUSqiJEL/DcSXJSeGdZwY0me+Z1WK5F7LHCZ9FZyR
4m0d7+IdpdWVEXbAhBV4z/lcKEgB+pWJnWC5T7PumNrQOXGNDR8h37+qDN+c+cjZK6XbckWksk6e
JHNcPmEZyh3YqkB43KL6dZqS+1gvMxEOdpYON8qL5eqAdcrfVsRO5sSzW65SASlD/EWbazX+J+6W
KCKbZAtUm/Sttthm76D0+I4ULG2hzNQz+S4r6gwf/qGX8Eb/wvqMYwmx9BMGwXirjOw5+ZPqw21o
h4aGS+PLPUTVi5Fw+T74U1xQQhWh5gJTnuRQc3WO0h67GA+QEYJIZ0kGTpvn+oeQknL4ZZ9X4mkl
+rrn4lv2h+5zRx8+uFeG9CLB/CtCX9Db9EbyxT+A1BXZbDOoq3xnv9fcC/akbmj91K25mq05dFHh
XXZyo9c8hcK1PNTeUkt7AnIg39FkY9coiDdmUCq+ghvW/d9VtIFrjIIvsvwCVntngXCZ8H+TX5oM
EA3+Zw5I7gznn9i0m0jlBdId7qppQ7QqfFArer1Mi94Pbj2ZIVj6dLbefMbUrbjWgi82wwc0TUVg
/kGo7jAKFeGhKQhrqNpgoeZIlHlX1SLs98qJ3zsc4gkLArjRws5lS/Dmo0LWnL9W8gczrg9w1Wk1
pCONAAWeq+vssOqUnLy6UFCIZ/9ygPTX1m+8yb3/hPWDpx+zzRrPh/MCS66b/BcLZgTGQITZUOTB
9Dy8iOA/VxcGkXrgcbmSi2wLSGnDNj+mzvkpAm/VhSGzNPp344EE8fPdcypFMF6lFc3AzX/kDXni
Uu7WAt+fgFgAk5KVTMnN8uHcpYGyWQ6bkq6ZhERhLke4GfVktfi5j9VeO8jWQ5PYa4sQWXuKKlTb
bwtf4VRsZfaSvyZd5cFnMNpmSJEu6HnqnUForr63x/nKX+I6rp8HXjqMST1JZsYq1j3lQBLrdZsh
e1uoeZslUwr4H980nBxH0DPyGgmc7NjoVadiolQBmfuKyKOBnM9x66E2nxKBdeX6ZldF2fbyHJZ6
iDTyZ3egeLnVlO+lXw6S3miubjRCO+ss53E27U02GleW9tamFbR8I/oaizlDg0xYpwRquGrbJ0sl
PqWnGkH40PphBVf3VqDdKOK6FUAPZFaUFld6ZPUyAGifH/TODOQxzo1SenJchDPsICaofsugHZrV
41Ha6vCJFio5Qy8AowYNsIoGIp97uscylGf3EgbbKvtfs5rRRjJdYRKgx02T9Gn6ZXKb9z0UWvuJ
1aR291UmA9jW2WYhvBih3lFzF4lf7c98GQDJOMQcKObeA6OkUlFgminrdQ9oUPC2e4WDRuz0jyLW
cc8EVnHP4BuJWuKfftp8jzcyAvGFO1TVixQIqYGIv7YhOoWc3gtXhFX+SgWwuy2bakYBit/1KDG+
a8jBk1h4ievT3wnNScrGlJXkFUdEoUAVIVIwVdlFyiKO1mRRD8nm2o14Iwj+XkiKeJDwLmnb9B0Y
INz7UpmY90M3pAYGbDgZGamiFBOAP4HWGi4xSGbP+oSryVL53eHxE9vGrggxCBEiNOLhW1IS6w8h
l8bEgma6C0Bwg35Gzr2UcIlpIfFfKXCHpvYBdi+TiBLABDjK0jBbB9haM5OKXIo1GnsH2lbB/PVQ
keaED9vxQjnCawX8GG1VsxPdcCxDN9MvRpDydtsAEXpt0pDonh/C6LNJ7ijrdnJIXPV/QP8BJrzB
8zV4mDKO+3DsOxNWLRQmjFbxVrEe14usCH9zoTftuL6/sW24BCiqJ8vTvF/XL5Jz+dQcJhavtF+W
7ANLawW9hFYp+0U4M5Q2D3BNa8u+7vqkGZxUWaMOtRPc1GtWM6zA96D0umt5E0+uKvYSy1IuXJhg
amNyCKGvWsU9YbX3u1iQSyZQjTejjnTTxYR44nOF6nioLt+gy786t3ViIWoBo7OgkgbP8u1DIhiu
ZdGEAzR53PEaBA7bJ9OBe/g5K93W4cWcXBjY/WrYVSTidv/md2CMzQ/ykq0hseR1xgLureB4Xt8z
yrP05VLdV9raSDN4ue+AMw9d8WmOGGenxbvq0CCL7EPTIo6oiiR5I+BJrXbaxQzqnThwkEJCHbYs
LTG4JFlDwduqXPyHCLYUfbQop/0UND7/14AOte88QERGgJHS/PupeJkqI55l8mzp5kcnGA1lBTvA
oJEslYc0E+FKIMSYWKrfKXK/5VJw9xsm5my7krbZrqVSfxHt+LmA4DyWvnzSf1E6BgtUBIITedae
FklUuW3arDTVLTZHowV3ISj48GvdcqAjgsHSjPd4FThLd3UgwsyNM/KBPmAItxQG18Vhy2HQ+Hsi
/T1ZDNa/ZWOnidipAf1YsIavwrODR/py+nZEwiYo400PrtHH6p7yD+0o
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
