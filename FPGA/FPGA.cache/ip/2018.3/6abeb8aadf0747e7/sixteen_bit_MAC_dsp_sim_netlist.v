// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Sat Apr 20 21:11:24 2019
// Host        : erik running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ sixteen_bit_MAC_dsp_sim_netlist.v
// Design      : sixteen_bit_MAC_dsp
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "sixteen_bit_MAC_dsp,xbip_dsp48_macro_v3_0_16,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "xbip_dsp48_macro_v3_0_16,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xbip_dsp48_macro_v3_0_16 U0
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
(* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xbip_dsp48_macro_v3_0_16
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xbip_dsp48_macro_v3_0_16_viv i_synth
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
RxR96HxmW+bUzzZHWGoxFOEr3PzRCulTdqn8iR0ZB4kUvwrdLJSYAHNFUS3CJackJrDXU1SmY5rP
Bx/2N/IW0YQuQTIF0Kc1+zmspOd/kWBdnkcmOrYCSEidZ/kgIyTx2eX6MGyKQ+zXxdtGdIQLO8Qb
IK2Ot1ga9zt0VkLpWdWbPMKDKXTzNsO8+m3SM72L7lzTN+J2tJg5xM+vf9trTxanBwLr9nKRq7P+
GGz5c28jG5bHGO/cqSlS3mEU3h2p7rHAh4GAGRPNee4m+dYslSvpGcHGaQqcKZSgrPaoIkluRucS
0HxVjxmNwwHsv1o7gnpdelWfEFtpc+eMMTaS6g==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
nBRUfUGkikrMkQ+/A5KfzBPYxONym6EfoVYKMtSk2jNl8O5lhKOnr704U02BCcY1WktE4s/Xn8wX
20MGj8+OQKkS//0ltKa/kOaUXP0bl+tktqsI3iTZbOJjNYaea7mgcTOf26DFO9kFA5ZqeFpd6sfZ
1aI0XMTfhYUh7jwUnC0RJx2BM/7oYPpeNRGLrFT0jk2O6IhcdsrNotZM3DdmB56zxGM+8kDeSI1Q
p4/m2q07U1I0g7z1mcO1G95F0c2laoy96rWzTG1N2bYa7xWAqM8JhL0tFrZ3q4T9ocra9mwAWLDp
DjLtYlaE9xlvStTUclLsRjVLGgqhAAZMugLMWQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 42560)
`pragma protect data_block
5xqOpvZOJzDtlfVfihwHhXo4i+3COCT83559jxIKLgpX9oHblW1EhZvAZEfXTdc+euPFNngJd+c5
8XcYiecYuPdzdqXev1DRVicZI3y5fHeemc/fSGpgPHMJ0N5X4fv0x5nwEdJ5jhrlFcurlCqUpwFx
z2TY1TQK/d8s9a8noKUTh+Mb6zkhuOH/sdSS1BaXzYlx+gJHOXQFSf/jIRARl/6JhhjBXfq1b5KA
q7jMQmnuB0zkCn9AV0NUXjhjbfmvkpBn3aDpew3VLI3VF6xp6m3CO+tUdiD0zOR4ekfWlY9dCdPW
oVRe9vEq4xpfnnnleCMtuG3e51vlNJb52KrY22JF21RCL56MJQ12OYdiU0s4Bj1X1zsmgUtm9Jbm
LX9haOl2rGJ8CEpBUugVLGKMGYMQV6NmXPGp8b9LYO4i+LQXwImZQdFawEEBZwuv3VYjbsK0/T0Q
CsxymZ4ojr+WST7C/Lpsc+bR5hLM9Yad1AADl3HeQ+vGgAvUyPO91A+x9WY1CX1gyjcXs+NsvuRV
3fdY3DUpHQrZ+nf+2VLw8W/zn/6U3qF3lagThZ8NF8vfQXwos8SGAVyltcME8QF3KjGHq2RLka0e
E3Ub4u7y6//zkZs+9jN2shwxmcn5EItBs7sO3sYuMAYiHWWxxzFxnFJ0n7BgGNsJ3HpqDSCc67Sd
QVu+Vo3LSgbJ0KY1FIC4PzVvXAS2UpuBGkr5bQZEFfhIoFc9T3hISpvOXLz3ySjM/2V2yUGqHMvG
EwCvKAFm08i1ZAaDRbAYCdZspExkZDrJRzvVvhXDi0Xv8qPvDmLQuqVdViuSSxfYDYga1IaYiH6P
Bm2fKKHPWPzNhSvi0YS1XXUyxNqwiChPqJQ4S55ow9BLOVubM2H/3oycwD4kaLxLFUYqcjmPk3Ve
jDMFyKDYLlIXe/NvRKoX23zJArJJevMVxhVTB/gY6/rVbgMBEqtsttyW15IdSXFxNisnsUhz6/Sh
KOHrVP7VUj21V2zJQo5K+WhEFzP7KNmsyR/brmz7cJfxI27ScQdL75F9R0YpWXkjdzLxZNLJXz0g
hZ4iUgLBny651cWNSho6xlqK8YnGzX5EVHjCVWPPHdxoWIWy532/1AvwH5FrpzwsT5qJyP/M6n93
k+rmrVHMb6bWwaIaILv+jAd77cdYQfcpPFQAVZ921XD3PpTIrPx6gcT3Je6sDjlX1+CLye4lTV06
jtz4NT0WAMaZfWddImWR3LyoHaiFcwQdMJNHl3xgj8pzKfdXLgwG7WpFhpAGBZh421khbp0v5Xqs
iTtIMm45K9cfsMK2XciC7JMtppIfWh+vN//L4HJnwJAzSdhKPDspiEEY6PHCXj+BXjT5KZaA/nsi
Tr7CqP3D9BL4Yvr11W1mSW/+4YFuGI8PASd1ot2Ozl0VgJ3vTevuV0yI5wkoiZUHemjBVptb8pdt
Mwdxm6QUXlyT91HCsYMHjYyt+cFcu+P6xIP2Wh/Icp8P/LlwwNCnwO2t7WGpdwDg+j/Oy5p9W/6D
2fay8FO3mLWn3IsOoflIK4QVClTKS2ik/I3H7Tp8rlHVArkks2jx+eLaRXvVVFJ0y6lhSvnc5w4j
s4Tu+9CcD21HcSEkHjDWaPkNXTlKeCAosMhKrjWw1+NLueAXRVUxfrrlqPlBl3EndV6xjs8CUgNy
VgZ2lqdoPK81C4koiN0Ck8BZEHNJOpMlE18v46oVVKRcPUs0fuqYIdWtKHJSB/B9kzZo+wil8OXP
vJNlhxp0T1wf5q9uwds5TOY5TiIhObkS0TOpKJ6kJc7VtiPlAXZmpWWZ6ydDPqq+BHYnnM91J9Ft
jSCST/sUsEmdJ2bTI6tCNxnIFEj0/k5fLO1XTo12yf9hS33D/lrNXmDwIrG8cwIoZuqpCRgWxUlD
qiyUZp7tiaMVn2b4qjBsChaY4cdq6Vf+f5gd6fTOD0vC23frDQXsQLJOoXq4XkB0aR+tEmJ4IgSM
8O/QRBHFfiqgl4kIGoX+TtXUNhSPmk6MxqZ8mX8MokuXuUSW+l3PZ/gR74otWs60bH/4vvgg3V4U
fUEkobo4UBRsyFbdaj53EDTKkg5A6lIcyYUF0xgUqcbT7r10FriS41oaFiBdz99NRb/pjjgvW7rM
D9pGz5W6ab++CXct42Wk28/W4KiJFX/7hxBPwqgip5Przr4FJLZfoF3dDYVaNiQJodliEzlsJZUZ
BvUp1W5/8OTsBooTUDWS0kxdjWBLoPS6GgBfsTaLnx9ZvnAYe9YPeQQXwbGNhGm8zrBpvVBPUzn6
3/r7e1aMJ8h1jCVPZ0SOWIimLaa9d0QU8FESF16QgLq3Og9Yc8KPI5CTOyqTqDIRiRGX1/DIOsB/
6Y8HG7zaI4epalNIBOssVCOtFe5QTEwih9vZgNfgHJhJeQ3HxXJ/WpQQtHCLAWre/lU2e8vHlGDG
yArfBt1a85MBFfj4ABxt4Fw4yUq2FmW72MW7wavofkOSzn3eWmhDVu28o0eLRyixjP+Qsec8L8ij
Jyhr6c+SJe3kkGYtPTujQfowIQbWBLmaQTQr4uM2cggfNaGnbRnPXa1ZMCdyH5IstRRGXX0PwqNT
jg+k3DSzle0Z1ymqDe24bNMLgm9PUDuRlOLQvPLDzYE61z6n6QZ+WYlTMlDcmiz0KVDm3kI6Q8Om
2lCfVmBqaXa4AwuvLlRHGCH2WvR7b6dTbW7jY+JO3J11rHC1pgyBFsRKYyKqs+ua6BaXP5fXyXwU
sRVVFNN616s65ll4jpJnnTRaI6gaIcL52onfVO/G/DdtjFEA1elZEGOzWUNElr8A2yKkmPH/5sEd
JbZyfAqqd4R8rdjsPAdOuBplbPldIyJYPxyTcY3GD1+Isx2949H8iL8QqotcBF0Tz2m7zzvskYTT
czIqQLjbLKTj8I8oam6P4Uh1AeTgWqcI4qFVQ47Y2Vas+3F3ODd5zyE4yOZoa6JwJTJK7TMpUAMA
NfKxkMFCT+4Cm6pr3GGYD2+Fb3nV3uQF/QlxMLxukTpfwP5WIunC+BagkLBmu8N1A1pllX3Y6Yhr
vg6j0Mzt9HUURa1oQXDHBh9JiIENPYgvv9wBvU4wRFuiOg1fKasZMTmO4lW6aC0Dpg69EOyQvpMJ
XqNj9aR4fPpFMyQdGpf2C+OZmTRKsq8PwU+GI0zugc3RlZjDakRmRPmLVY4hFBLgPgX+Yw8b1e6s
QwR5oVKJXr8Qat4UBdstUrUsfPhBvFBo193CttexIqIhh1xCJfrcqy0emEUVegVzgr29tz/H8sak
reT2vm0r+Qim+EqmglQzKJpAqrftOV7JJrtnZ4h5gEvmUFLsYB282G4olEQOymwsszv7qFE9uh/g
cd8mbxCudP246kVhiM50l96wDnpZ871v3/x+YP9tuRbRjbkgkp3lpslBf3wpjuN1eMCXKehXZGcb
uiB/cW+70ug25/721HaC7ePmu8x2BAzVbk8hymWBy2euZPTYRcPZA5xkuDcPatV487tH+yLDfBvq
CasxrVsC/CdeK5M3t2ccuGvOsroOAoXQLHiWXNfnby1exbgFgNO8CcSyJgkLbHS3QFrJnKw8K8Zu
Psl8yk1WeBOFvK5CRAFunknHXX7thR9Zja1k3zYnDMOYS+NkcK1T9V9CPNF/UqwNqjPDKZeke0AC
BJO6g19vt2AacgZ/7vuR/OEN3hBZQZp20PkJKJAy/L2Ye16P8wJjRS7MHJan5Otf7bKQuh0jLs3I
vF2QUQpdAZOtNiQkwQtmHVC3Hj760/Us4RzYfyhDyuFty4JwC7m/MZzX51OfOwGYgrN8jge0g7tF
0THOPqCdVt1Adv03Gs0CF8+snNeN55nQ0XlOctJWysQjCopxJzdj/bzVXNV8lLUejjbJ1j2E3hUO
pQxud676LJxjDAlt2sUzPVrYzlmOJFf1fxtn/8IL7ey7jA5v55VWkLUHVUEf2G+cN6nyAHe32Gul
T3Yz2k2V0KN/B7HM8cOJ6ULnzs2AlHBbn0nsSg0FhEQ1GiKe/dmCQuRwan6rU19kkkYftHanTlxf
fKu0r1ZTlU0ZDpFzOwbUBJV2fOeMmPBcnU+WGxBiVSSrzp2WbYC8/A3fdyTYnugOAN4XPgIPQBJV
LqDBgJZB5f04uUyx7a08gWClgBC3z7reTd0tWkJSBhpFqMpq2wyF0xT+oxgu+1cmCMwSL6m/8ffL
qDauTeNan44KL88w1jggCY2KkX2OzMpok3XnI1tz8rTulAzXT88mkyapp9dF5v8tEq4J1qmDnVzs
qufEfRJ34046S0Mc/sdtGVa13mmbu/qw5qZ8L+yHRxpyB34k2mwehRwwQy8ERilHTrWbNswgMRwU
6/sT91B6fDgHUR/ZO6PSUjA1ULTa6pBs9Nz4Xu6/LDW+kajINokKhER5q0Y+BhNac8OsiiSDz99y
DqXPS0kGnLi8BoupsU1qRVNYcmjS6jWEkHFRrSmAbmoWtzv/bRTZVN6U2GN1/EBJGL2hQGpLmjTc
2mUja7SluyxQW/mpchIqZb2GIejQ1bPQEn5Ye2+98FaCoNruQgBDNY/F/zo3ISB3vmJwW7JKny6l
DD4SfFr5fL2rFm1tcCZPYIbc45Fjpn/dm/FKW5UOlKdw14yo8VF91BKtHx9SQ341Wk8WLnHO3BBH
t94TPnnX8iG3c86e+DHtfusWm/OlT0LTt9DLplynEIko1xd3BT2vT629eG6CJN+/GWMQBcq8fs9q
lWarvkJwuEQh5m5CMihYf78tfyYjmGoasEmy679XzizKbNnpXhHRjBOBBUCxkfSX20tFqpqjU5x+
VJtFWwreutvgry4YtUh5Bt5R8/DyJMoIaEOCXnNP9RR1GusoTAHiQH1AYUu5lGaBljYLVyhMPwaW
W0nUS7BONih0X5P6LJF+djSCo8pHLJH5owVpFfc6iXJLmPoO0TDDADYE+VAAcPv3ztGX5FByXVS1
K411eFrJKr/7R27alk48TqpJ4T5hi+8X6Ss61ChnKhGrHibcWTyyB0bdJyGFXVbUoLIQY0Nbz4VN
n4YRwFInHcZ+K7n7AA/E6G7xQIzmuGeTTSwDNVC7Y9TFVHe8GCQ3Bi3Hn6ZlYDz0eWoTnWff3eJ2
WiusriboXo5nq9R4Mws8pI6gHh/9BTD8QUOZZps391/6tDeTZ51sJ20TwskP6EiyyqZpBo6Ug2NG
cjbtyhjnaGnSv6NpPNEa3Lf2NhEkKCI0ADJI1rR1SkJ4yNzolpZ3cFWEqeZ9M+vkqCdprMx868Pz
ox0Mgc0/d8PtTBxoIWtiuVgKUJgNlz+/3N1ijx5oV0vfCGSgnAqK5WTWRt0fytAFt/paJ4yvqLYc
y+/Jb7PrC747ezYai0aMZRUoU9C8bYKInKeilTl4Rkrh1d8QmVttB7I2coWDbCnmgU5xkUAodF6s
t6AiUgKFo8kX3Pmm5/NRpDkp3lDa4J5QnTkIKQy1X/ym7HvBNanJaB4w7/OSxQQW4KvtYzmAWb//
xtHkPPs1y7JT/1n1kJMVbShFTdm2X0nWaZz+N9WJg9CxUhNufcXRWBP+YWXMUYmAoil2t//mbv6T
LwCk1CUchk2UKoTmXjmCQ2hxGQdIzyB2yvTrJm8KyFV+DVQ4Jxg63Mbxn0V5hS812Qfb+AL6KFuI
r01VF9eRudHlJdPZDY+C5kfFJai9Hb0C1YdSAiVW23Wd+VXZU7lcSypc4BMMcvY7UK+DDumcxC0L
7bOBEcxOIdwdP2fi3r4PMLlkaMlNVTweJ0q0d/MfYTlgazqTBNPmkeRg04DzbIBbr9LfsoDv8w9L
NWrM1f0FWn5er0KzuGkh4RROt+1L1B6GYn25lqimfQGr7e5YogzyT3vDRB03+6YuDeh3qNA+Ordl
evNuDz4rGeYdq6fBf7CSnQJ3u8rDurfYzuXSEcnHmU2AYc86C0lqAeZUp6VZX/hlVPtvynKtML7x
W1ByyC4ImkWxPmxn1M/+oX4t6JKdseMq6DmT4VIgV101JG5yZjQUeLODOJ+EidRcN1//XuEyFqpa
TdL4aV3GS9yTS8dddjmWKWMBsChgU/LOW1Ezw0EGz5SAol9CXfbyF24Q7a9EGih6n0qlNAymAq4v
F4eNIvlm4fk1ZjV45ODTrtr7Z4tWgZmjn7Hv3L5pCu/CgjesMDc0hL2mfgM6iJesthJVL9fNHZKJ
GITjyA/KSnUG11JA8IjwHetOhIuCs9UqdPt/lco+pOMb/S+doI7AEUJCv1OnVBM7qLUB0VgDcVOF
Pvp9wAx46l0pXE1wOIq28jZ4KTkul6cJYtorWPIrAq0e8SVSpEWE8tIJJYgxNJLwg7bym7GDXs0X
PBxHnZE5vo+TyCXusl2qTYHc3R+BB1u8VS7uXxqjsD1r3jX6NJHjHvmnU08HOwyL72sPbBbPrLim
OGTf53asOa1eBuuaTTWFlGN0oGcOOTRTHlVCMQJow4TnV4dJQfBxGrOFef/N6GwtOe7x70+PU0v+
XEOb4VXsGjTHsPyCERR+Ocz3Jy2XOvnvS+SMU003eoJYm0SIZaU6cDL5AdCRXADfaxy6RMSiz34T
NmIqUsYoppfMZzxmhRQM2Wet3gmA7ySI6kheYLEVdJoA7Y3ZeiMWPYafQxPIVcoG1mLOhtduU4gt
WV43rRrxDr0kyQYKq5ZTMlhtvSXu0wb8QYAv3dX50rCLF0gMAunhhnyotTkK9tHUooIcyQmVQ1C9
D1dzSWSA6fZ5HmvUYAJ3XHojg6CEycD1YdjhmYd9jftHWSL5PcQ9ayptckcUgMussFeg8jEm6Mvw
LZgW6jw2g8hiuz1/hlixyj6QbiBwzktNfRhQg/vsn05AhcA+RY9DDDc+0fh5odcF8FilXJi1MJ8J
bxjSt3npoHaidNbnY+LuyATJ1JwGT81MVA1+UT7VC7+v+m00mnO+MaZ5mN7yDC4BCZVX0IzM4wrS
Az6dZCOxi9vk7iDJvhFbZFIc9LBGLfDZvw9OTa5aEBWkNax+JcEr8btNGKzaAHEThRwNAVj5nrca
Nb0bzB7srIYtwJmyngbx2BM27gNlTSA6xa6fEGEEVg/EjNM/5kvunhykfW4qCgjsTq+lvVGcjfhP
QQ0dbQbXgil33oTzILBOS/dvscNcoJBH/Au4kuzDn1cMP1eCwO8nelF7vCSxe9BtxFb/+yDIQnsV
EvX9NoFg08+sQMHiVU4R/UoqEoHbAN+nRo+x2AzIOgYHLoAze1fZupW+szaFu9c1n8UrJBZqxUQ6
ZiErp9xQNcbG3iEvC++q22Ehmsk/hfXMUlbaCbNpPBnBjlF9/1vsfmfXgoOa0gGXGyDdAcmUKjYt
zqoP1ATibF4RJf6gkd9usPBkTVf8Pdbd+MV3OOxvVNZmj2x6GkEtaVSkbF3DsA9EPnPFyRQz1lOx
JSbFkooh4JseX8xTJqgfcQ+3n+Y4CP/OBjIJivC5M89aR5PYZLtmInbQ9+N3zPKDd56Tg3pi8fNM
nex3Q8GEi7T1RKAUk+LQmkSdVTDy+Y1q2EMtx+3dWr5ZaSt1YrvDC2ypFiX9lmvBWtFwEEmDmY8T
OOmMW8lQ7ofrNc9dvipkz8IpoTOPhUzK4gIu1zbCgj1KRzIPPwGTm9hSDi3hWKuqLlfmpwJaFeWY
Bhewp33hZteJ4Raia9xHzUJV2PHbpFSdp85Jp0lAw5eMuGs0JNc7wxEQ4kwfpqLDXcwKjUylsvGC
qIlONDBxCbK3i5myDBTDpctRZFUZrSXK7KXjkZ02TB/KAsJgWzwZOxD0Khxf6wDO2jLaOVIl1TZi
emlXLdifm0SrTaJ88YOUeAZjer06L5n3LDzn+hCB06RporbVDAtluCU+/9gbOHONq5WdsFSLFLnm
prYVC/ZUhF2TkRIpARwu1fMlmVigqKcQKMXufThs4WzNfbRtx6iOklU7bNoIsbwDgxPyyxBtv+Dn
T90WoPi6fdS1cHHkHjZ3WSyi/IW+uTCGQGXUBSnXi9F0Hb5LoYK8K6DVvo8zAZbsolE/PH6raitZ
kRjNbZh5MUBdwO+a9iK7jMSDW7v7rrRNwVKOWs1Q2Bs+rsfVh3x7BFvxPhXrfDL1B4+/pOdbFl4x
kuk2ZzeO/kI0kYeT/mxbX/z6MW2BCRLgPpEpUmcRNupaT1Ink/3CIPd1ialzw/rDr9EFc/N1Dbgv
o8W7RAsUmi/2cFlQxyaAnpCSJnZAsXC/pVcpbAysmrt6qtSj2SGHbtF2iA/MduFA/+WBUBO48KZY
5MK3roWDrMP6s1owT8Ye5+bixGJnB9SQ8vL/QLNDXJyZbuZyVi9WjuVbwUC63SMIU+fHLKSTwZxW
o8n3axNfISTTLJpYxZABKMs+TLP57iSIW+olIHfGpqxibXM8MDq32Clb30BRGEIwNB1FCKlsiLeZ
qCY7MdVHqft9EMU7xm3i8sojzw6lZYhxkU2WgjBTrMMHVEhiiSErQ8fk5q5h2H901mj9IB0cdqMT
4ELyLsf8nU9r3nU11zlCF3ZbqPPDLbc4/RH0p48MsGkuqi3jMrDkYEu4fxS5mcpWhj3o/pfT2Nmi
qiBJEdvPsq2TUQK2x5M/DjzCHt/1EebdetOjCd4gs8IP6to3kdWpsE6tLtiLp+xW6PS1JSuL3hYy
HxjM3MSmqKiwwqwPZohzGCfFOBVKVTBspe+s2mAl0gtO7eE2fyHMy9tXOAT4FaBU0R4XOkKwTWDL
Y9qk5Z1H0O4i5COB4eC8Jmqzs/JJsqDYueXfd02WKRm6XXq2bpjFjeUC1PMw0VXcR3fl2KBAXFtV
0DE68CeJ6ZyUkkaycto5ODQop1O0+E5p1CWE3YcE+s5dvdLnBWQZwD9zIPMWTWV4GnOoOMy4NSr8
hO0grDEzxJkrkkbE/+W2sXTOqVmX+gQ+4FgEChyIa9pZzfCKyUMI1N6VcUTmWukBgSqLMouRYGD6
F673Lwcm2m65vI6Kc0wCjVKSEz/MpfbTnpxt8Qt1e0IAu19rV2eaoWQgSXRZOmJSKxFUoOcygySv
eYtxsfWrH1hORamVW08e22hLX3u0KfsmnELOKGDPQi0Ms8SZoRo4XcJLSDDOnZ+/4KH/DlkvOC3N
3AwvIN9cSJUaiuVp8eSjlyZ792ajgJhUJpaBKyzvVKFOZcPQOlt6CFzSzPZ7KYId9/SC4HMCoDI/
Y6/hueiubTmDGK7d+zPGjxr2aSwaLpRC1uMUcskuOODmUnmszPmNyfg0AcYfd9suQ2mmCj54+xJj
chPEUQQ6yq/UzKqH3xyAdjgkhYQeOXebsWArCcjmhor9mfHhxjrVk0TrOSxyhTpgYdqSp6rPtPPh
FVaQsEBLfqJ61uNcq2RBGNvxf4HbphDg9H1mGV1KD2lAvPHCkbWp8yBPXvAyDN0uNbmjaC6wI5XS
XUR/b2iOvBsrC8kXfC8En3/2pR3sljEeJsA2BspkR0NAtri0CJzAAv1MoX0wL3lCLlpritsL7ve3
VHW9EzMVCxA3LwFVCaWz+IegkcyxHoN/g/+z0K/khQEpoSo3fg0XjwCbRViQCHdjgK6Ovwwauj3Z
lWegaZSt+aZx2t/owlRSSROisMHClTDoZIKZbaZGnu6GWKmqZiaPdV7LPyWOvqsZupjlzQ4b+H2Z
PDCL53dlBRsFNq9Pk6Y8dC/0WLR2GJLkTRdKzgNK3tPD1Q7Lse1US04DRCiDnleprjrCmPIL5fwc
KqonGVotDsXabiF2rCZ1XNPyGkCHLUcIis7dA07EDQrlSKzu+/FSpwmn7Q1sNyQ9AoQybX0UCSqY
/n+aw+me6LZVeakZxYLjATriKqzI4yWeK5TeVjq477/ulMDm51mG1RxO1ArpGyEGMTTlD+xq3m3j
XhLrwfbgkd2DbKEYihygCZA24xbnHW8+y1GvSxS/NH988f49hkHGymkwNnZrFkh8C+pD6QvT83as
8iTz9eBXDkjohOD9zlGdSEikY6d/Wclrw15DAMJwKT/nmcw2TgEEZabB65W+6gnrDh5JBCpRbvDG
4B+Um3Cy6UU/4gTZKPnR2B1WO20fDO8Jw5fhEv8z+w+DIMf7k4RXv8XEPGMWYmBa5QxewUIs0HCT
KoW5I5Gor3/+05QFppmObub7uBf+xRvdRbWTsW7fWgjRmGNVsmKzZsnw8gjPn1zLxvOuDmaYM9jY
81terdszZ1eL//aUO+YkZe0L7qVr0qzF29AOe28VFJF6AeMH494603AnBA90sRBNwp9ZR6YRP3wa
kZkWIgwNltvgnBWzNst8T5EYruJX+wBIhOf66awfU8+qFOMbgvZF1fWCUt2+pqR5ST3RZZn2CAWo
vAQshlMvczle8uRErRYtIRl7PaN7clawGl25P3bvhNA1vJABspVuPB3f1TmSlfGj8HZLa9dmS/bA
Ra5nsVScG7R9eoPo8OoMCynmTWwL5iqVlb+EygTIWYJernbA14uRXSZcTXcJTmIvT/L6L2shDfm3
UioNurxTNVc1+OwiKjn55WBg/tPt0vFfllOTyiMARbwgEQKdtNem17F6ROmr2+Ilrz5H50U0ZVBC
t+NK68R2L5y7w6XUc999PPO0iFJbSN367doIkV4qyz9g0IXeOo+dT6MIGSPSSj6mKs4hcKVX7ngL
heWR/6fkU/kw6B5gWWL7NvKKwClkYCySGPpE2OALKchvzvOMghqHcH3disGyF/ED5I/3QcBE5BFB
qUtRXTwJSeYgoRpFurQXXA86nVi4aDzvvQgQ5JsMQ0bvhxQs/G8+vDyI81OrU0kk1+1DgcZYt+5e
lkhFrhuZKi0WS5CN0l7ddn/Wq/CLtdLGT2LlSikMoAdAKtC9SkVf89K2V8knfK8XQ37nnwo/I83U
0rJJaD3/9Nr/NUhzDflYy+sQpUwf4nouPF22kDw/Tg71ow0bRNRPUsYARsgpKP8FMQ31tX4Wk9yr
zzLEiCnfHu5bOhh4Y2ZUQBukXLi/gb3l9OkaNciehUQZYmbOkaDEvBUp89emRHIrzd/XiJ+DCkPU
UsvjNMDW5fPI/IELDOOTYkH20B5hEmeqOnIfE9tjldx0aC1Ph+I2nCuE0JzOndFIkMBmZPNz9Odh
TpDh9B78OE6r0bN7jTSxrhWGLzGwiD7jX9jqkXL2965PcLPy9OF+T5fuFR9f0+TC3n/6yVLJiCbX
3sSuhO6XYgIEuDLH4q8Q3hOYpCNFtjbDZLDqpJfcoi6+Bceoiv1u+8ynevg6Wo++d2Px+e80H1c/
ILPUpzZZRHX09rf1tizIHgKOlrJCZX/DgGJ1L1T8PI3kv/P74bFAwsRZZjYqlbS4IotRlDeXiZBb
lweb1+HX+8Bjd+iJ0VNiyUoyzTuObrbdMzORD0+HHuYndLDetzXy5jMbWITeml1dZdm0YZ0O65op
O4odA/vwfWSpljKub6idN7uODZk7sOzHZczdIFT5EuaK84WiLuD+a2fZNA2fdogEI6GXqG5pSQBC
a4lGuZddE258qvc5oiv6privJYJXPHvtn1FwkhteOzOoKdZVsYOcIcAjvmaeHR7UtZeCT6rxEm5o
xYcCpxvVXalc/D999hp1cRu7oeHiKXKBzYweLd7XShVkxokwj8CsPHK4pKxW08G2dlUofkd5dCPK
8Q/Lu8P1afKCgsfy1s24D6dcNFXsXBXSPo79T8L2ulzMdI1PI8BIHIroTTTpG4mv7k3mtyb3uMkI
nTwA7VDz2d1eVhIKA1tCBiKZBaHOHMMbWOoTcIZkEKgXbUUsnUyooEQPSxiOhZk1iCAOfUCGI9sS
FRdEHOEeezPcGo+Or6Ztb/rlTVoejqN2KwFUY7DYI3JRj4h4ZVY1wKWqw0GRFFCyQ5MjzstkvHU/
ZVw0mbPGM0z+AigTj6bsMzwSLY0jnplCJEHCPu11etbUYRY9EPB33DZ9NF1ykm+E/iNRMNwC0oz6
zINTlKelGArewfaZd/tBE/JuNM6Kxaxl7aUIAwQKokxp2CFuj2nF9qtr+U5dhszddTAEEdU3L1px
uBzASkrV5lSUgUp3e+EI9zzuKUxVv/zOF50xkqId2BuaTbxebi1e+NuNM+IzpF/LdraqUwRTmASs
NEqWAaJqUDV6QCHAyaGGgTtfXZc6B3fsnIIFoGJObwyHoXzyKxgC4+EgmZdsNzKmdXFQkCmQxK8E
zkL5NFBmgNutW41DM42Vgk+CN6dewND6Irc+Aqw+u/XiPNiHNuQohglaZo6PoJFhJvSkGejmNV1I
24vInHuby3M/68dJWKeTdLICjuAyjNn+fSGkZ63M4/71Rmscx/UPHPrnZMf8aorZrwn+mNwYOakA
w5Fg9aBazsfUH2UXNno9d0VVQchZS0KvWkNGHZTLMUkiopFjy3VKEr2hOg2VEipzc7EdW3D72uVD
B+J7rO9SOO+AI0RDcp5rvmWjO9LFS42TE1b70Efhsk9itLkwPYzMluZx2L3fyZxeJPhKBxLxh4kP
kPaUWnfq9psxubqtKmCG9QXD25JKMacwLPDCrcj0/9q2s9eTHd9Tksllr3dbO7Pv6W8zTO9JRFgc
Nuzp0jUXVCNIAUP1WK1uEZgKF3uzoR0s+iJhb0T/Orn9ymLeo52CoG2Ihp86Lbnh4ImkucggotIn
18C+jiI0aHdlUvcUrp+YQfa+0Yk6NIJycuxflO3bfta1c7whY+bZKkwbq1XLsQj72mF6uYpUA4Oy
sYD/lA4BAFk47dDOTy3ZSelC8QC5lYuVdxX1ubKDCYWhMObY2vPZRJWH66xWnZPPzF3qPzK5nIqe
WUguw/QqaKAHV281tBwkc8EiSkw0XWQGGn632VUPwoCAsr4WzDsHmb2hiSr3nkJ9C0PUM7StCf75
XxprMvwbP71FAZRY4kskU27X0aWYHsfjyL5LvXxmNqxIRdL/cRsRDCg1YwlqSGU2qgSsmMTfJWWY
6thl3zZrxu0ViYuS67c0io0AnRZgfo06EGJayE5BHA/DXwCnmGhBRBI2YOBdLi9Nxp359J5YO3M+
sC/ELJaOruqCjNLlCnIsg32X4O82s2u2r0GfSFWvbLyHh0x5yL4KUQTTRiFtuLN7MH3PCQQh5bp8
tGrVgX877s/J1CuNYdF2vuetFTilj+jop28sl/8gtrXxbNf5Jze0UcULyQfUmVSxUqkXoOtmtJqy
HGqr5RvWfewR7eo6WWxYRFJoiw3TPMYySAq5BMMl80KA+3GyntCYq1xbWCpO8bxaV8LSUIzqOny8
V9J1tG3KTYyK1U9kaHHP3fnzZ+l4X2gMXNxo47Mn5nFXzu0jVVsFBCVxlef79BgE4dfW8VaBzETi
myaQV5y7Y1soCbZVWcD9hJsWciklyXmGJE44f4YltoQFvzWBODTrYGynIdBF2AcsgmUABGCt5+8f
trQTYC8BgcWlsRCtQOiZcX7Iz2nE0lIOZauYFPwRe6kLxH4lJ1QVaau6+Fy5FWaukxmZwTD7N14z
oYalSZSoHcoLUe8CkLMW21P8SRmcF6z4TgqAAVCbtNe1ycvSuwrNIg9PxCB7hwggmQVWLnFCSBJ+
DXLOONpTuXwqA3ltNjyuBq2z7/VlQh1dD51s+Vo2d/GmmBCsMmL3pg+hDpC6CRa0pOIr5C0Y6PCb
8uz/tCL4CDd1eT7GaaNmYtR632icM6p65kl1Qew1rW9DVt1QwjPCMJLXQ6wL+2odSbWjYCjsLRWh
3zvox1nVE+z7KntyVq6WXx77NgPw+5FFNpWZ2mWGDom4ks0lT02Zz7LGpqrhRx4/dltLMOixWmn9
acank2iqBNV9GHKIgvlbzgLecFcPdNHxdYpD3Zh7hRQOxfZztQqvEQKFZ4LTIN0McJ0UbphWWjwB
37NSyPkZFR+ByCuXb1uVGPpGUE3lojUm23BO/N6xiknfpoWalJJQq4oG6cX7bTyqddMgAhW35RjV
cHzpuMazabKIEkEko9awyX6OvoGxIOOeL+/KiR0Oy2w3Wlp2hFWVQgXKa6LnqxBK/By2e3O/ny/Y
NqfnaWmH9l/r9eSt38/wnB96RlwscXC4PTbhyMyFnQXfxqfMuZCrI3BNSYREYHzHTNU4X9xpxEFx
EbdxK70hUrzZLfvy2eDvN80S/Qj/fR8yaqeS3oWVVeBAUVCBZr3XMefstlSV38mcJcTKs7ZlRwjJ
ibcTa7Imrcmf49Dxq9emne51V/bSU8Dsxvy3ADzZfm/4l+BZG0JPoY6ScCS8tvcNBGjX3Y949wjY
MmAAteX/BuX9c+wqjAz0WVyJbdENqZtJ4bLWt5OUVworIXar6ETApW0XIhuTUuZCfcSm1wBMPakl
5iHQc3m2aoabq0ZPoVhpp4Oeh5rPRJ+p/TxVaALBQn53CGwrQwuVXXjV9IVfVB3sZnV0LJTfZk4V
IZfWdFSdeplyWcmd+MTX5/qeBHBldhHDUbLYyIA/uLBbwbwZyXo199j017dKLc68/+5jSc+HN3yy
8LnLXHlpfwjIVtRIJtMIPYOI5IcUn3nYbT/baHMLDbG65as7HiFWAfxCE5cwNK8MVJAGP1F1vF+v
7/h+hGeNqUn3eWQhhF68dynViu0WXHocKwZHxBVhUTM1VcJBWBvgwmt364nGzF0PHV7z6pQ0J5Dm
Er+ZTrHhebHB+I2gvnRGt4q2Vo4W7fG5hxYZa2SL4ZJsHupxJN4OzhZOjsBtNCE4mkNSTBq8ymB8
V/OmSUwIJR6Y8eOckN14Sjv7pG+s7rLH1W5dcJkwQSYe32AnQIxPOmmYMlvwUn62VrWyAqtTgGxz
hdzKOYecuxCS12nRnex13EsFbwaLvkOU6kkTymDjh4JNlkDQ7b0XFpf8oRKetuohjPajjmU0shMK
6w2fu5BWT9uQ7K6TTSi7rx4Wf6eFQwIPRR26HhPIHq1AydrI7IoNfQ+xgzmcq+MXGFTAkWsdoM8s
0eljukCGgk8Gc+4gno5XirVcfFcnTRzZKZfRaKERHya/67KW9pcANyHzvWb4pK0H5L61B8OWa/xI
QCGHkrm6cCuvOJ2qDIIXMJoLnz+fdzC85mljkTeJSXk1U0d/Qix5otvarC079mC2orBoxgbjYxsX
64hEd7TTf0KZS3lCQ1xdrYVkRRF0XHtHenXSvTxlOlXi2LdishjHWl6S+UNlyG6VR7xG6p8DhEK8
U7dFe2sv1WfxJwqiQfv0L6iYjlW1jHfCl2jHmQ7wrBiA17Kp+xRVeLvCtU4DOUJYKN6e5ntAou8e
nQ1mUHQXTKvYbBkxPYzB42tolFxoSacBUzirJ4fRe6EzzTOL2IThg7tyWKbwoLkt1VZq1FiWgt0P
Igrf+WKxZZ3rfZCOHjLRpBX6OSJIcYsjVtUF+eEhsIAbY5FN9R/dxs8HZTxUFVd+GEHQIDgNXlNh
LMjVSwcOytp5vifS5u1rLdGkMFRuIj2nYzR2zL62tP33S65LI9FqLqdNglAa6YaG9/rd6FNXXbQX
GQCpS0dfYdDgZ27COhPZ92Xppl2H5Au2ZDMdPx0crClenVXVprX5rXqPnXMulINDbsJL6Qq9Yc9W
BThcuKLfJG2OyY38ItidHwtmYu/W5SZYFJ9VQX0iwcW35TR2XwFiwGs8a5gHg8ZXC/XjP90GlKJG
jW0gdD9JccaPVflnIuO8nFPU7/tfPIygQXTWbFDENVNF8bl5bJ+oUIBA5anQSpUy7SsL0A1+mBJv
S8yIIDTBK90uBjScys6lKQIoZKGCOwFBKKQwuWgTNIFXuk+xae5cyxCtS+kJpw8r8RZIzM25hE7s
mZRiRvFv5EGN4K6CElXbg986ypuLaXwSjrZ+Z2hGTmU5mcVv+wOYW4qO5CC+1KO1oX6SIDpT+PL3
AcMkF8wiVoBsB5szmQBQuP2PfgiZjeScetfTwd8p8qNZVZAbsA6vIm5LY+O3I0Smn6wKjdwrotAy
hxPwR4+//SOc2eCX0X8ZJNZ1j8xrA7ZPzjOZb6/36SBckEiVl9i6njqDZU0kkR7hdHHsaNgptTVD
0Ht0Y5BI1aOHmP4lnvCj5jsj6JcEDDWf82OKSB9neM6TyWqPifRuITFOy58VkbykZwVbJ3eRa8Rr
eS167EpMHb70X02bFZco4hhsxMVBaPeZHo7Ft7GbZIDa16No1p00VFc8+SN4l4VFSK/SaQ7QNGTo
1joHTKh39tQmwEk9qGXQqjtmgXF132SgIgxbTJoXsO1XDEczU3R0AfzxyDnX5QXiPwIZ+00q0Yi2
8kZ6duFe1iBY/Vw7NAZrQ7tpuCTt6L5cz59TXspjxWh15NqwXwyPyEHHI8AH6JQJx7B9woQcskrL
YDrl6Uf7XTlDUvisaxyhveIySt0JPVvJswSFsDCK/hlpTHwNyJzOrq0X3A5UwNphjCGWM3sUHU3b
bKUGM50hgFJtsQCgRR65wThUmQRV10enNLbrv+oSnwbz0R1rJW87a7qFv5wppdynu2oyPUy+IsnT
Am3Rzer/Ev9Vp7bx/lPZQI1z042FphGNCrlvXdx8fvz+0tDDVI7RlodR/F1t/hC0DWYAum6UXuwz
JE0YiMZJ2zFnmPabj4JZJQlhIEYF/vMkAR1feK7xl/m7mh2ttA/lv1VKtHPUA3VAPujgIzzm1BeG
VAe2P5R+vd4zfwwDelXVlgEB+uqZrtM/NB2/Ypd9GMpNs1vWv/Z9h0vKxR+yJ3piOjIF7P1niem7
Q3Z+X1PBA19UkXE0srOe0QpDCOeVsq89LPDw8SRUzXqFXvow8E+BoTA42snJ7Ri0ErftRc5QYZIZ
YOX1es6YoD85f7O4tJyNQh6wp6RajPJmbEYDG1U5NRfvy6RRFNvzFpFx0CxYcCtDobd0b1LXSF6y
atnKsx6gCI4nB3dW+GUKS5xcZQKQrh+LTD6nE/bDaKp0MrhYiRYyloo7WzoJDrNJvP2iuWm3YxA6
PNe4PIDLwUmFeLuAQw0hA5d7pCS9x8JVSsmIeM/cj7jnEkpp1yE2WnF427PNU4odGD/xd7K2Br1Z
KW8SwRTllh0zLsdwxwYCYhu8V9iv/RT+FQY5OeLm9SQPMbbTCJc+7cK1F+Ol4QrzN5yTxRsD34PO
+iFKDKAmie9CCoox42d9rbVs/GMoT8EFax9TpUD36g5/GnIUWEw1BxjO94uhVowF9t5PdbfamRRK
UMKBCiGJ4bWVXsh0bYRqT0LDIzdOofeUCgFog72ZpLdhcI1rYZR4gPWBS/Bd1ifp740a1K5drjCR
RJL4vJkoNY059TlTW7wmBIJRyC15N5R3k8cIQWRqvvJ6VUKNfSietWlSan/cjQviNpn7uHvCYyYV
pYALzrxzA2nMxFr4qPhGevK/clHMSdI9ytlmnb2nfVmFuwOmE3rwjv+sO4zfYjmwftA97vBPEl7T
tbS27ltIq2WDgCma7ZiOfjrm+FhCSVJLNmn4l5uPFgZtMo8U0IXixPBMBSCxbOWT0RoMSqLbkknB
jbBo+YQQm/XWMNykrMFhBZXiUYx/gAW53tXZcZElNSbO7Zzh1htemNdy3teaGeYstAx0Rr+8m3Gi
UB2hcXJ6ohwwzOR8BkHRTletuwbf1GQetpaOoljajiKG3u/9VlrWP4gMXsaIH4Mooi9DP5GZ0gkQ
jM8nhO65SH43CiBWUiT/6w3l4tT1dmoWs8puHx4Ynba0pghJAeDWT+MIbLEq1KWe6mU2VMAXcWuZ
Pv+IpLqP0NSut57siVb1MmRtV0k+D3DIzJF+SKYadvXrxOnPFeZPoka2yHeuCND27OdgkDzoj4A3
URPgDfnrEjANFKVzzBMuxDzPU2Mj5zJonyi6NYQ3DAy82jdHdJ70bPJXZ3Ulx+BrlZGL9E9ZS5bi
aTY9+23NxuaXx+xtK0fwnYIhc5745IagzOQITFj1hNDQGGBd8IdHr1pP5PtAhHVAEZcNQR00LwXj
W+AtNoXyOo/jFGsFVRgtxm8U9d5qWLsW3wetpniioEugoMMAeM4XI5SaaIvDL8NPouQD8644eyQZ
GqQm5QPKjEv+GR/K7Vi4y7AJvRd3Uhw+rtS9Sbx+1jiKjYoG+cM98tZ1r9oPeBUHjF9iwZCz47bL
aLdj54x0T7CU2LKESSwDxUAfSezCqD0UcKTzkYLnMdEm8XiXRWQeg1cb/BlxnZLfU63EKX0ikraK
4qxQNSUvXgtB6At8G1DfHD4mKHygbIoUS8WOIpq2JmNsPlFJmAFSGBUuXTbYSsN3dZSjCikxnqKi
Xmzy5YdapzR3O2GYJm0pK3lBX6J9Y0vAOBIO4fkkOSbV/ySZ5Q4u0SMA4wuVzBx8qZrSFD5FLpJd
7dweVQE6UBDBra/dsC3OVtt1HcmkXc79woJHbmtnrKAUzTqpSzhqDjm4h1uo5e0fcLuM0W1yEJKb
NsTkec4P6bQ4oHISXzqC0rd285aeTTcYA9HsmJhUn8xDFwgl+wRnn8AQMrQYrQ7KPCo8SrFOwyMe
qi3NdPe7/b72MPKHpxs4+mvYvEnINuJY3ZcR9XKPo3Cvgs3+/VK9cmcE48O3+6hQ+Wqf0roSh7VC
CEaE1Hi0jPnhYRDrRGYDkUI+L4kh3v3Ar3UmyE1wgotzvy4qEvssbotCM/cAdU5LzczGUruOgzpj
9qg6ZzkB+qrh/T4E7jli2qEF9qp/eXCBeV5i/mjcFpVQn9PMCvNY0IxmmlDv8unvrB7yG997MSjD
8n4/RqUzy6UL75bxos28pM4kozWw2mavLBgiGpv6aGSF+EyeZ9jYbJq0FBqjoBjdmrfqIyaZs/8l
EI8xWjNKODlDnnHoVye7qG5pg1hfPMz7V9KKTqtc5B84OoFhLgpXxdFuywN6o/qFhfdd7DUqqTOR
F7XbGdXFUnIo95oI/snSz+Oy2h0Ij/tWv8Or9LzT1w9IM2Gr/memYDravtW4Yw8MfZ9r1uSbmbVf
NQg7q3c5CHZn9UCnRRKvKXVQH5YDwjy2a7MRBXRCoOD6jLFRMMZSHS3/gS/eFByd7tenskfQYBOF
0wC4fncsinOO/9CEcRYl79HgaXmdtWwP7FMSZCWybde8DjMtuZib6z6XNoyV4diXE3cZKN1+LnL0
E9Byn9g8JWhhrJV+nPSqKxfLzdw+HlhAQi1qY2n5znzD+PSVAsuCUu4++1Z2qUO0i65J0Z2xwYrN
agU9Fa3+QcOq+U6K6jnr5MGJx1nk5oJ7Tj7X52NgJO4mhCdnN3stZuPxOiB0ZGwk8+ASykTIeN2A
m4WLzFXuHKLE+pN95wVziOHCyEbiyffc9lyQzkLsKtQf+q5zh8K9sMov32N33Y7Lcqdw1Omx8mA9
cfwQR2ricsx2+9eFVMHnptOytWih8cktP+GUlALIXqtVDNbNqCgCLJGBv3TofWubEBlnRveuXnhp
hqfaWfom5co9u62N7K5QYZ/ItO4npxeZbORy34rvNN4s3p7f+1Y6G8YJVHxd1f/NkbsGOE61pOR4
SLZvlwEEYuHkXWRKBnSd9UuSig5Z4lmHRC28m3QWuKiJqwVIIyzkcz4TIilQa/n1re/fGBuqSoO/
krY+p0MO6y0orZUMUN2p7Cil7KA+nBAsFSlTLsFu+MP2PInZGChrtjX+/vpjzMu1E8oUiTAXOHAW
LX0yn89qrTmu0omyrbh1e+ikfTYfWVW81PpcJg3qJVT3y9/g60BQT9tsrIio+aB6qXghW7qAxzPx
n6BKwSwekRdxyeUfPhYOfVklWYMGJ0PEdz1eM0PHB8LUAjUcV8aVFbqxXhWDFgMwh1hLIX7tyC6D
5NuyK230BAbCwOMVB+QEzcQmaslQCLX6SB0hB8GsdGYd9TPIdit8mnqS3oidxH+Ei0/DrH8r+AD4
j8ePZ0NUmIoaPuSeTLSwMn3yW4AmwJ3wBv7fWNLeunPbcbvRVr91/9coOiG5Jcbvc4Os38KfJ7Mc
w11jY3RfEo/yxzBoy8t2ggcIWDZ/NPK/DoB6sBxUopRKx/LUuVo3anv4uAyCNDSCp5NFVMNX6UlX
9sJUAQ5gWvXbcW9oeZdncitrU870aBz06TQA0i0vUOAVJpQaEt6+p5XhBGDiCRgQSjgcja7ha2Qs
/v4wuMAOoNhSRDAW8FzxKbwEHSha9GWQvUHVB9QZ2A4wcME8NGGJ08KcPnFSeLdyN8KpaLTvx301
ncXKjlzYZPYg563gl0AmCloESnSM5oMgXkw273aJHIU25jbnXSoq1UvP/gUdLH707YK52M2aMaiY
lof4QAgsQzzgwbtAJCKI2wU3KNckPr0hyd8yAHpzUKUGlFlFqS87j6yQTmstcy+I8fqc6uwJn9s2
Kazs4o3CfA7x1FaEilddPwDtofD1hYgpWgAtqMDlyWWgRij4vdaMG4riTLc6hh4ptsqt0nP6cgOS
7Qu6nAMfucAF39lZCFXbbqm6SGXNYwZLt/EVcRyTw9D0VkZVd98yNiPtpypvVB7CVyWINkBrbrNy
P1qlKkC46+8daMbuaQOBkdUvskrlwLY8Ql4fH+JYsKTNTwlwZbeTLZZQ3P/kVAkiqSZGoQA8sQle
UswYsSjQw8FWHz4swJBp3xUpjqXjM9Io7Jh3ryFqA6bvlFxjnmwultMoTad554wOqlllifHes4FA
lK00hOkS1jXcIF3m/KZwozlouZV6oa9GPs3unB/SQl99IcbXIqvaUBKM4vQGj64e8UloqAkMHIDI
15HtYpYCoYDTd+fJG11TadRunjQkxGjlTW/2qAo+FenoEQR8/AXvmOaRg86gX5aoTpZU7enJHHDP
yxzHACLIC2MQZ49vfW5yqY3kxqkuVoA+rzoos2CZ8Wb9KLeNuEGyCj1gr2mrN6O9/MGKqvGozhGY
KRuWwpgJdWK7jD/whvfSnMJFjuDdABCMcUIrZ9ekozIbVUpwHfD0gqVbs8RuyOlwTSpngtWCliid
hozhPVeaP/+OUR9pHHrM3xqRLCJWRtYwdKx/8lAjKjARLo0ifcEjjjywo+TYdGcVud2sH3TWLVL+
k2sRZ6xRqQxD6OSmaPQrgzpgIUBbtAMS0BevkxS/OLX6r27Kw63fURwANA2b87OPwW964RA+/QVb
IUtnOdMtyQkEILIMZuNu4y4C0heBPDEw1n/YZVNFeKL8AjqyhFdP4A0HTsID0qYpfkuKmqT8JVyN
NmI1ZHftOcXjHnq09S3ji2dWsZexZZFRkMbOKTn9j58GrZBx7dHJVPCMDAWSHdwbx5cqzG68kkSv
VjWErzYerldB2jKb1CLw1BMAkndWkWRDLuCOa2rp6+qpyaShDfV/FEoSH6vjo7xGgD96wLYZGTNx
yI38YQIM3AvI7AiiI6RGTGT/QJVr7LYQpfsCa494hamRJnA10j4EHhpDstxstyYYf4nohGs93Fi1
g0DX6mw+L7nvvPILwOoI8sYOO+w1xJypVDqCxQrHFr2c8BOpODIGAkUPhALB2VTZnNhFs/VmhNQh
64Icm+jdFAHKj8CW9+V4Z5KoNUERv6Le5X+Ln2Ngqm1Vw0VDi3VwcQ04Vf/3GaTfxmvHDzN7XfsQ
4I0D39BaaKTD6eqNmqLZ9DcW09a4PdYLXX01FiapmN/i8t6c+riUHGt5Hgu3Tqep0EYJmCG+k2+s
E1/YA0AYtXHXnPKgXEnxcBSbbMKMY011dBUhLBvc0z2oPrpgG5zonHNFKrh5vZOtJTJpHY1qbofJ
v6jcUAjwjhmSfmEblktfm1ciKN1oqvhldfNp4vq8fzXSKCmJfJDmlpt9EEVpB2vZ9TqIn7aIWKkL
eUVdr2TkBVNvuzkEOTNp8ka3LhB72OM8Gl8jW+06hT4rXk55pvKHqipXTXyFlyOlGP0XB/SmSAFH
Q17KOE06V9GGCr5peQg0pQQ8Hq9pjwcbohyCxLKXZrUiDrmAnvXcn8v6OUC71kpu1Ef4qlUqnPb1
k9npblH18se+8Z8ALV6VmPV6HxPlFicrfLuChxENhL+ry1A4ZFp1doBziKBvQylSpGoACEGSZYzR
Oln16zf8nh712vc2BIYRDsAPW7NwIU4UHfr7M2NKOAeLy6wMqJ9lh30tWrWJjxs4ogxE4CyS+X2M
T4kbv4E7A0KT/cqsfh28UMwZib3ZoGVXQtFktq1+sGzhg5SuomS6iseGIvDTVGa+bSChlKRsI9Wc
f/xNv9RRiBAi2ocXwyBtsnpOFrgKvYhXRXqTgQtxEF4D+BEin34o9JtBppSogbjw8Ts027Ary8A3
+i9VF7Hd/LeO7VvlqjfkaAef4A89tJTmbQ7lt78gpvUnoiH1CBJUVX7xhTXcOzG+N8w/KB10GV32
16PNxkWEK74dyOcMSvr9j0zNQvRZphORiwy15/NXvVZleac3joZYcDntERpeVYZrcb63GudqeJKZ
n6pK8kV+BzqvA+LekQGv73Z4VSWRyKdw4MdkUE2xIJGgZiPPSYks9UUydh4ulm8VUqxsF2SjKPL0
F/2kwGtqBypEYzjkJjdC5Dc69G8kxRCJtnPmLQSioOFh+8Oa0N1bhTETVmJy8qYLaDwA/n39lgtj
rogxgqJa426T8onBlW5Z8ol3hRMbVC2Vzgigb9k+g9Bn1kESEFlUHE7U8zh8BKjsP43/IX8mHmeq
NWtnm8NC5r4oSWdpKvwKoOInEOEPAZG/U0F+g93h1uu8KRPnkCo0o/+csz4tgWZK3e0KSGR8iKPe
/3lG45m5Acp+UWHuFMJ8/aMsytjqgXS8iWfdtyU+2DBi13FQlcOsp0FA5v3JrLwoohhoa5Bv0s7w
6fC+Uwtl/6rP1IGQGMyd1c+1OM2yS87WcrO43CWY51wnMPVZr++JtFWdyO991G+iTEpkCQRBEqE3
tOkDDqogJX4pSmgyHDqclGkSYXJJWR/yc+ssVYaeghWUajnRyuTrFiGlRYnYKjomJXfISEU/0mCF
i5LiwsMZn+TkpC+maD8Yjx3RLSdw/fC7Wb/i7/DP3xi5JpZgZcUcnzlOeYhd97MJfl72eQ93Y47k
qbLnlxfOMsAmmtkPeC45qE3CQ1ZCERZ2J/r5Bdi0Af+TedynLUfUdQh7PF5mX3UHmanOrS4MBGFM
TRZeMAGk9WY6HFElHiSGCY5xBPN+psvIWXpj/q7AlhB9ukvk1fLzEsJB7LgTxgxpwvcPt3yzBC8d
wlXkEzoSyK3f2HR8uxKk8mV2TeBQbLVXqXfy/SVBGOnYbstz/qTj40dir6/jagKI9yTqOY632zvW
aGlhzxMkJ8q/KS2TqjNwxW876qHUt1Qq71z4hZ9qQ2ozpUDr45W2rktKQcV8JRCnBnt5bmnPRXpT
R+iqrNHuyDrKonNxORJmaskgL0vC8vsy7z7QeknbIIRgpD57JzvahbgpQhibPy/8JY/4Bcefcblh
T03P7Zkk1+yz5qB3aAD2Vk7E6pMVWH1kVKiL+je0eNQk25N1ADuRdctMv/JWeS05hINDAf8Jg0Kw
7ZVFqLLj2LUvY7opEdb3G6FCqkHagNRigbqRHcU5zz1UFgL6ZjOOm0oG/3vqK6UDzrwI9UV3+k+r
JiPn7+MDz3BMnRSiW4Yl3L7EFrIQGQuo/aIXEtMhX6J/2sl9KFf+uWypbZ1jb5A7CGTFpwbDGEkS
gmW17TBl2x8DQfQQwpAtOJQjhYs4xpvO9n4RgMimYH0wDMGneBoOEBOvGxn7ypqt6d961Rb0ziZ9
Q7fQQ7jURAp9NI356EQ5bAYSHb8cWCFW9HcsFgQXaR5Inl9mlIm2sDv6K/MYFvKRpa8egMbdAxjL
rThwN2iEv6oA8PstMdtMQb4rB5OIsUGshHqewYmTbUbmi3+xAqvJIYXfh5OVwdOzePcvK7ZZlzDO
lsXYybkwUElyek10tXAyQyHb18m0hxbAAQ/Mn9xr87MftUZrnk24c23zBElpLyMlaXg7B4oNVJYy
j1k7WvR5wQtVbbKYVM3/NM11c/kSonbyGywVIwYrrtXvzRsTXGUVvbYU5cZQ5YdjEy7bQgE78R4s
gMQMprl/H5+nhhc33pyR+ifAfOi09EpA2lk6xJEzk9fVEYznDBB3FdYQfzCa8i7Q6jSpCjt71dls
o6EUPfsMuf38r+/Gctp9Jli6zbF2xle9omuNFx1tcIDS/MVBp2rNDtbkU26HfGEjNjaft0kQvYzE
yJFBZX2T59eZCo2ryNbdg1WbwDguW6iBXpVY8TYzY7afxjAU3fadJatVCq94+QCMbJAmoxRHJVZb
BOeEZqiJmtWUZbRA59PX8xDMMhfK/TYBRWOVjV9krQ1XO2WXyqfv3Xf7CDoWnSe3tw1NJFQVPesf
XKchwWgEx8cMuSvLEYjfaZPzplBrHn15Rgf4OBnykWoJZs4QRZW3+0RdVQ9Za1+cMXfg3HPZ405b
cvVEnrQQYoyJWJntFBa3HGTd8Mvf0XdJnbd4hrRfAzF4QsOkYNBTz99dBytIK8nuVHL8uEQjlcm8
3brhdYo/VM4yAWRoypEVUwPqhzwutmDM5ZMB7lCb/+La9fqOg9XOr71efZbJ9hZcwEcFssi38cDu
nXBYtUaak0J29eKCAAHQjtMyFul7HTUvmUnIaQGchAlhjQrLnyiII3Q4geBWZApJADbAIuPe8x3d
rjRGv3b9Qb1jEi4h8u7fuuOL8niJvHgK9w5OSH8+vbbrm7SxYffREJ19ir/D9VIQemZRIaWGcTsr
RRUJBFrwbFYcO8CN0l7on1M+douTN5W4xagdYC3FbFkuhzFoZ8xM3MTrEgvcy6DqTfmGeuudw8wP
hvdO1AQrYE/hHwzPdFpIjXoaxn3nrgju/+uYs0YaDuU52+sp/AuGRYoxFUIDGQTLNkWfRDjqctH/
3NnUNxv+/VwNlU4So/9dzDAjn2NLyT+DM4eZIi+XO2NKenbaJu/fFdJHhTKOnV1cxWbXC2vA3iS0
iRjRJ/ztCsmFV8piSmmRV+QKKLpz6gJQKvGdgJGJrq0MYF+PcfWSfiJv0EL5DNG2rZEz2uZOxoM0
3jG4QBKjbWW2aOvr8mqrgejHrfv+5Aq7napM6ZzIOarTp6LbUMMIPwkLsq/fT0yCd7g3vgE+OdCu
Q1nNCLgX/Q34Sug843gjyUtPOtEhoRlA3LN0R/I5kyCvAp6tgHKCkwqvp+0Df4PNcWQzTrxkIkM2
wCpvPxjMXDHq9RXyo/Xd7DqD3+BJRyd1apyp/+LsTaqs7il9gNQRAykIk0myKrDC4dqb6KlMvIJv
DAtHEVpz3q03W9Gz8XKkNslx3tQX5+2UOIeQy5Fg6/juLmytuo4aGa7mfWdaLBw3dEB0cjfOaOOj
o3a2Tv+qcvOPc8Zz9oY/Z9j8bbVHEzPNFslVtU5RqZAfqAuK5hH+7fycCnKUX2xdYBqqp9nQCWbi
ovAwn2lxssO3X7ahvldJojzjuHG6C50cVdg3tegXXuCyYNYC4xXcc9rvM1C/UKen86NBQDqL7KSH
GB+qqu+FIMizuUvE8VHiZKRkhToCr0wvT/tvTRnypFaXXGC0/6axOAiinb/0hzYrk2UzT8pDQ9+Q
pCrQuzjI7i7+PTa5NIwqiljN8B6ZhMbmZGqDM7u0z+UXsIdNRq3kLJfYTLV6aVQR9jbm4JLzZk1i
qVnd3ePUxjIP6OESlOC0LNSxJCjYMx4EdvxQVGoEombZxM0HBh8pNnp51sR2qydspI7ZMIRaUL8X
0w/kdeB/mzNetMG6JhivuFWbtppKKCPVzgY/WU2fhe2HRHK0L5nzKIPoYKtaNAV5FYkWcWTKVr1U
6HmLKHVCQm2gUGnnAyCh/7jmutIZjUBQrjPQ0KdXwnrZiltYF9npBekl14esKe7K/O33VxyN670z
2np4Mywi9HLvG3euCHdOTJgwPXV4mOLkwchHQjGVUTyJtJ6u7DKUXv3cuqJ+RlJQYW0TR9/NreZ/
jCWA5iv/KAJtyFlYp6rg33TpG3kxBobWgIjAS+IPa7vhIFvwQhosKq4bpTsOxrInaLIl3g0vv8jm
PdqBuM5jRMySOXZ36Z0gFNfBd/RqUROaNJ5ygUxLchFCuXpMVWONldOdyYV/26knw0d5wxLbXVbj
aidqLZaLBR9soFZQ4c/UPuWsCYZymtbTcl7Dn9Nuut8OGEFFv0S5W/EbspMoYdHCejB98qC0pzUe
krlgwz47d7HDS71Sh92GYF9mOmpftB92i6Yh29apmSVANlJ3wXipvHCqSF40S5HsYItYj3olDzQP
0AU2aMqfvyQEjL1OCrWy1IRY94+gYzxDKXCVP2TtRFDvV4+vOF/82xEqrVC8e6LwflLstwCq9cwF
dSp0S/q8kRupHeSwsPgmRoxbW7esTrytOqPU0YH779ocFRfKaXDsvrxmWomqoujbmNIBrRdMm9eQ
OwmIrOyQcab7M/wxBVmsmXDgdgcHKrC9bOgVh9/IYq4/WU05IM02Km72NqmDT3emNDTG+i2ffkk6
edSh285nPCkM+ySwHfm6/4qXs5QPatg299duHGI6OpxXInQm8K1Y0vZm/z0jIxVHMyN8kmyoJNDj
CAQd3G1q6Hen3CTsm51GG+lpssELmLC2P5vDK2f4lyLO/4yXNSkKOhnlwoF1T7RE+uflI8hW8eqG
0l3xoCSDDoOytjbCFV6CZELEcxyS5VSbReeNulP1U6Rhraq9cFsrjF3ER2N1Zsh2zTfLq3gVmt2t
oVVZkGnii8y4167CVNM2DXvkcdhALPNZhau8PGgLHIJewCQWg3qbu+9FZeRQ+7sh/4RT6d3R1S4H
3HvflXJdsm6EwGBrxoTaK2b47VPrmZ/R5K2RUFEJ35SqD94TpnSoDeVjvsx/XUV88gJVOFnCo7F6
J/rFxIH1sZu5yhhxBHWbAG3Kr7nS2HJL7lJCKvMc/ALzr02A2DAA6YWURBmnSP/yvMTMCU6Zk10L
PZzSiWoTPZdnflT+PHJ+toIipyZBv8mMhfgokKtEbt+3WBeotBp9tOe3So9NP+CIrc2Fwr4ZDwjC
Q6a+TqnaYuYD0HzArdrfTozHY0IDPtEye2Jh1rkVJb4yPZpED+ZtT8eaZb5jFvT4j1HTP1mmCWrB
7YOt85eVqoxuoN5lCz3aQF0Wk+3ZolUkQLpyqAwQAclnKx0XzlDJnslatKvE0/+e0EuPjlthUtEe
+lFE7sd73k4HVvdIdARFMmZX2C4Jg+rTON8jUDmGw0nIDJduDkQkJnm36y7o1M7lC9/5eo1uV5JQ
pWP/I0XE7JJKS+PsacuPxp4xhvNcBJuGrl26NVX2D7hjZyWz99LJ69xStHdf6F/vZMlats+vlPjY
rAGd17pistOB4cGiArgOm1On/k0r/howCYdi9nlg7mw3bCU+P0LvLYMOqE/kivR6O5ACUVxTzQSl
BijbvufKyMZwrbyRlj/L1CKOrNtKrUEav9ox7dGJvB/aZWTxrB4L2ZrSEp0jdVmhI/NQiv1fhRb6
rAY0ZSksXnQypi2AWgmi+61zJWWZ1jXBoHCh6jyC6zKfuQTCd9k3+rmj02Y00LNiFujm2zXUHuej
dnoKso/7tXf1hd2/o2E34pR5a5F1sB0YOZJAGEaxK/jhK6P+avk3ar99TGzIV3JfVHa78SDcFPpw
Gvzt+fnTZJo54AVr/nvBms4I3doaGLkwhLSr+UWI9gxaoFpqnC5C8fDDFFoGZPIWz5xbZz0c+49x
mrSzbsm4QjhtuwHkFB1dxNO6baJSS2NFWmTUNYnIRdEtMAJy+po6n3Mzt9enp9fuz9K58vLc+amY
Bj8HVJC2yOHD8oy6hdXDCQfmnkc1oshVdB//9//I3t+QMgOU3qScNGy0FOIOSeimodj6gSJcvlqj
CYrWRU1cLmOZsRqjBa6++H0s8ubc/wFkqh1R2qhGRgirrbe9P0KW6qWk3sbudo9wsODIIdtYhZVK
Ql3CQbb+wnztC+azQQWBnv023OOJfEJIQ7aJ6XtmUkDCszfNw7SuNtwm8HstpUrtW8FRQxlf6oBb
gT0cpuWKKC1LGfz6S/9tHAOhx62HO2CW4dFIOnZWMEvElnQVtrxWtoKcfD3ynM3IBK0PAh3i+iCF
g/isBKXUlAP/2S/ioHj1kjRQkKI+gArfDAk5Tvw+7+fG/xh8QCeaqUSSFpIS7gK28HvxUoKqawu2
UWYskpuI3q5uWB2tZuGQ03wvBF2lNhn7vzmRszZN4m13RZ3cvzNHismgvtFbMmpPtiWDqsxtaYe7
hsneFR7BECMao3HGbwfPvwABezQNzoCOAd5JmUrMS8CP9CUQOeurKXaGWBMEk7JClY1Wos4FfH00
rZ6M9yzUoQiVotKAvUAdp3uGz9PTBhrTZk1kuO7EBYaqhSuTnP7ofR9XI2eRy1S5K9CxaYBYVIN/
xhLVnvZUjfLzs0NEyFz2gmVHMvKMJNuzm3SCRg8T6pY+DIsx4ehOAuvuXVsRrqgiREMEAsH5WnQZ
CfCR14jB5zNaRJkl1+7Btgy/woNYuG0iri0Gizx1C4zhqETWDkrh2xP5IFVsF0Qgx1Asu8lL4XSl
YxboP9X38Tv+GKngaA3TqiTL3i2O7pyYnW2nCTufD7E+N+u8eZrAqQ30t5+65BaPYNWVydCOBb3t
cGyoAWTlXbARu64uFMa+2iWobh+Yh2jDGi3c0r5hyMhMnxO0Sl+dOxTbJIlmLH463kcC4H+4C1J3
WTAxHTlpsTIoKGGtEUXUjpyETuEB8VpJLJYDQL6wf67xXwFrXOTQ8gUqB/R2qTRMu6EDFTeQOorC
veM6g2h6Fbr9ZGg6sRRREjGTvKrWJISZJGzrM27CkTfgiCNYyolDMwkUw/owwvaVPysRNffRaKYC
d7Rr97Jqhj/ekYuMvxL/IKk+MNtSc/Yewm32o6ODhl6vyDwaU+R0s4MHwV5fb0tlLiv7sXvTn1q2
9Y7CTMz0WTEXkU4e12k/nRDGs13aeLyqaZ+2eAOHGUVSuN9XJBMEcSkHi2nqOlBmzX9FEohX9iEh
NoDcEd96J1ej6m0Ar0prey3ueyYZm7BuThEX/TOJb7igW90ceVMlo6NhpONnEJBYQiqSC9SsUeBD
57D23qxkmlYRTe0IiV1jFPMbTv6Ihxp9bv9XObZyIj+FtU1eGligbV4nBlWzgC8TyzUY54Fx5Ybv
Hsu3FU3q59xSfkrk2bwuNkoe520RQ5OoeehRYbX1NqWCclCeeg+/KBY+G1faNWMBug7oAjTjhlHx
TToqmwix+4H8SlFV2wKQACcs+k2BJYfy658JIowmSvGxE9jnzaVnmiCPUSXbMLn1LwKXAGve4lFW
VsQTcrkUa0deHC+Dqm3ykddoQDK4PM51xJTY7YOsq7GaKgyXWN+FYYdX4/79OE6eqM6e8CyYHQ9y
I1t04A/AJvlfgCM5FyMRNFybijWa1oR64/l09oTAFk5AgCDK3wh2PrSDGjacWN2mhvz3m2tKXQqD
D3tVmKV0yDqa1tgnRW3BHWqSos8vqywDlEwRBSDKO89239AJpk3QK6x3bjwzloj30K/N4tcQ1hRj
qPcQsdBKA9NcKNWrDbUj9GJP+RTQ5ta5tZIA8CY0Qbg1m8LhUpaAZ8qZxnpZkjO0tDkhkdUNlvt2
b42piPVysaQI+uLKTYM5aH3QyPeU9lNLuxHKLWISB8x4NyP4MjSYPHbgzK3ZqNyfZOgQ2QvtbhVm
KbRkjKNy805Mwj3e6wc2NcR1Ad8Q37quNzdbNCxt5ddiYZZntL/xcXuh1hPOuXh1VDMXc6QIxqF0
to4OKerzH54XbRhGuxvGUjXPPgI2jZTAxusAP0WBSw8kurc3vIAj6TqXTg3BVkO4RcrMQGVhICnB
7d1qVC2JEHn9Yf7yQvvhJoOIQ9NHJcmVsRlHGa47OsG1fhOPZrDNyzKB7lPQnleWkdec5A4lLvDC
uZWCbIxXac7gkO9DZhALpGAVMIOPH8YJ6WrFBg3VgNDXOtqLrXYoRg1EwLxVh99mDnVNtIi8Ev42
I5XFmdHk/Hb7yIvVRr92b3YcH17aDZXxEcGlXDI+iIcrUUyU9wtue1/cxQvUUBqH0wP1NLs/2S6V
a0CRKX/sWQ6BV4SUBTanAcAbWuvGoTH8ioTAqbwfXuLEWzgp5CXzo0gFuG2WlLCQrtTY0kbutMUt
20lHNqVNKMpz425FweR8s5OpiNfcOoHfoEdlAZC4dvUdnC6+ZHzpPchbvVxOVm/2rB4rld+da/dM
wv2UWULya7IlXRBUrQV0Gf5vYK0tDPdY7LIFh1Zvlm0BXKzKa1dFI2y6EMlmB7kXezDIArsHNlj/
Xy1JyG1sTYz8nIkk/z8Jx7uBwtQG3EqxsByvUBMsbhAA3TXnOcFq9i8ge7syujvWLB6ASzUrBoQg
Toqv+WIGjwLFAmqUK41vzW/abLxKaUWiA/vxP3JZBGHKJDolQ3uIWUR+zACZtdGgmQ0s8A9ofHUb
U8nYD76+TaCfooOxW0CTsgM+4kbn+59utXi+RbU/gQ5vE8wCL/evX8JwXNwxZV2SJ10dVPirM1Gn
akpHOjt9PFVvfKjJQRFDLppqL5XJVNTan39iKaksB22cruf8wM3Yx4A3GKAVLb9MEkrv+FjafThd
0XVzxoMJrK8rXnzx3OMxJjmp1KFXG5wbOmvzxsOFA/Cw30yVFeWa+GZipfMLjUEV4UZphMV7PqZc
LqELImmBRpuIuUIHQqksqpthKPsqiiu3Uvj5RuMGSKaZh83F07XQgMVgKXsFhiT2WeNGtt+MPn2D
FB7Pc84GYvyXG9X19w9fZe5uY1nk4hEMr74BWTrhpuC4mPTFqah848FPU7VN94R49/Eaiz8lkxZH
6ItnfWbg5NHu5bPD7jPx8od40bD+tU2Al/18hGrQHSjNjPUJnV11W2qnHIR+KE+z+GuoJnBh9Yfp
Le6FPYANF/7+ewb9nDxFyNluvrn9qInbubsObP635WvlvHKrmo5IOYlFDEFy1kgj9G9NYIT1UlBF
Uqp69JoY8Rg8v6cFC/h3uHSDVGdYWpg1jAEt/q6Zg0OHe8JDggYXDotrTtDC/mfC0DrmS6XEIT+f
j+BLFDtuMuvKPrMMH/oA9mOwNiY34V6rnMVTpSSb6XvENtGTgcm8cwhdi42BLGJsaL4wjJ1LNm1L
ZRzoXFATsq5P/Hkh2ymSqjftnLy6zcLrJsgNaq4hCMjHNVUlk80f9RqNSKTDnNGUEuyBjWUIW7JL
S2t5UkzByB4YSgVO92EVNeKr+/S1kOE2d/0SwjP6p6kMLL5FzS0LB8VFgNnFDkmJtmfBcgyTq2Hb
9ADiJ+VBRr/hkiCmSYrP65aAZhATjFfxKFnjobKAW5HyIHrzWGdxVOQvuzdMmNfBAc++hTlPA3oj
xLZIiHW7AE6SQJZ0UuH9hHCNfnXgd4lhKwUg562Rc0zgETJysxHyYTzBR4V0XxIM4pklZFh3kKA1
CHDZH9D0o9fVVajAZ0WgfnRcv8gSyWvcViNi2R3hbmpdpPXIs2RB+Q+wTdLaBDkSWXrzrQDu9h7b
8gCbew5vxd/2Qoso8tr4wo1zCuAuOn2t2ZzQjUsZdWsdAnugeKKl1wbxg4AS2+G4Ngb8UZzUNyEn
K84fSDu4wSp/91hIgJxAzuxM+ISsxqz3KJprac7JBonK7sQVKyNaX8gfCl2ekorcKjOfwJ/eYn7Z
kGGKzBUyvGRJHfrH2faNh3tL9HoxzKxCtQtPwnple2NdpAxrKEjSN2Xi2nsSMTxNt2JKt/JWLYF3
tYlcJh6m6Y/sczoJ4LEx2s+dHiEfW0+yo80uww07A5k+2/lXxw92BYDhyZwB0OJO56ygGuHjhvLM
tZSz7KSFrHb4m+7LsqybfGBwarSprrOxBGAZB9zkt+6ydNXDY3ldPhX+MtYp6yURygUnmRmH+5QL
6/x41DVYBtfQZFeBVk7aTN/EYtz76GuVv2qXw3fP2nEeJ52MZJsijEI5YIQRrgnFw9keUH5t0dlC
kfaZH6EJVOLna2imSnNJ95d+LSui6lw/+kKkcmjK4DHThgpxJeQGSuB5M4TBpWBFC8u96F8wHb5N
qxN5quN+Z51wMgF4MaFWa5EynDdFKxgq1HDAulL4PysjP2lbZinwpsMY2Ubsx0wamhsbHN7Lm91y
x8+aqf1pFNEPCmpQO+scIvshjKEWngcdQqcoLRd/7eHpMqplN0O90wMLn84uclDAOrPBDLnGx6hU
hTdn0MSwMY5Kpih3l8hOENDGX3hxAyyIgaqNU9dPoG/tnkUjnNJQQGTnFXBotg8gfLyWmFLq5k6W
M5/CsKsv+aYEs/82uJOaRCT8+/81A5nBlfpbw8Kqr7Ggj49aIC6c8zuFIl/SkUeunK024gZwSTI3
qmQB69cvPVHAIuBvcdnwk5Ov7yjeSes07hAF4CYABE4wvcvIYtj7UMZcpT3qavwqUGcE/+2xEef7
dKTgY+Ide3u/VhARAUEW3seXlah3kyqiERmlka8x4PcqafAXRVPEZfvmZoTF2nvK6QN4TBCPa0gW
ojcAOk5XnC9oYeORggy3X+FszoYXoGJXbcWo8R21Sw5O6J50xVYdfjvGW/YqZJWcsPgxCk1FJ2Hs
FwbEpUx+cqDTC0Y8R6KXe7FJDl79p6qARI3SEmESnO+VeZkF+yJgW+qMDTbgVpjmOu9DglmLzaPH
h2Wt9RgDlbCI16FBySqZD0+Cq9fCX5kRDteqwSkPqhKvH1hL3u9neEpKixbnGaxiCXVsX+PptF3G
9iVMf1s5iwy132i92Fqy/+B1QQsKVnLzMlWXz6tPxIOvaAbBng18cnjGb6zv5t80bUazA41plwmU
UVQYmTFzp/LWKXZrxN1lwa+48f4dsudW4DsmzOil/9FRtuysiJ+xmJOGERSC90RCruBPEYhAHyUg
2Nb+x1mk4vsE4t4UMxA9TCEeiof1izVoK1TWQymDKqSKF48ZsFeg9FCpDF5nub4NRFBLL92aNG1/
S9Rw7IsTKw8W75h8JvXwtlBV1fd/h0OJARqEzC3DJD47mchAtx07FmYK6ssYbopcoADP4pXuMsvP
vJU94BUS0pgaRtA5CWUGojjccUO3HXwPuTPWtw6Cpxxca8BuQUB6uQTWfuW2Cpy67T3h4RCF6dq6
IFGhjAIYfx88/HNgTanmurUVbmpYxVDQm3Wlp40u1ClMTPaFCkLia/ds4GDdvE6plBJlwRtVhDJq
dJT0oAjSF098n8QsD/CkiPLDBsL5kiWfwSXuPjR8frkRxxxKPkBI9O5UaHT7xiw8OkBp4pMJPvXN
lwffj2HOuFZbRV9SJwiQ+4gYj+FXSfo98PibzfVTFKtUuSn1r8hp0qJayiNYEE1AW8oKltreGMF2
H6kSWxfDvhVc2IqUSuS7jorn/nFNUztgLlggFRnZf6e5UPCYyBSefaKE0WoT0J4WqDEDS7sdt8jv
LGmaicuaOJLvlNAKkQOErHx+HPnY/1eZ+6xaleDFysHZNeITO2fP1aMBZoCRFc4jnl6Kk/oBhf3C
FMIXxgvzskaq/CCKx1uQ6pqAG0dXupuOBWr5rqD+1vGi4dx7FsE7Hqq5Cr0kZyFmqMiKRk2GnmAr
4ubRZbqaeS6kQejFgWLtEd32yxMMHJ4qTYsuGrf7qzi0V8RTV9uPVoQNxE/+f8JdVEvFmcknAAeS
Pcw7oTZCbSk8p42OIX72bXwdtLpbjF9i16j3q7cjvpt+fVDMrKAGGYWewyYA786Nxvfgfjkqn2CW
8DVpkMZnMxq/5NlYW4df64lLUsS++6QLFmsX3Idbo6ZoSXiir+VimfFnG0aQ29xbI4wFJH3bQpIw
mMOi/FbiLN2ukKtA0GhvNG8IxP/ViWNo+il8gO6Wh6ad8NfA/1r+OHpJfuEBkkqgzw+2GN/sHmSe
Ff6baz4yj4aKMQczFLVugcTIhm3qYh6+ZUg+rB6BZc/7U4fAYGmKEdlg7QtYmgC4FH32+j5FqBXk
fuPRKFwfryebWTURApQrbR/Ng2bKyorOtI7vMpjgSdY274zbBv2ki/QiSeMBn+FDXJ6eYxF68HZV
pxIf3CXhArLBWKo7q1ChwkwF5uxEjcBh70gTSdIWZ8AJuLUSuLPsD5Yb355zazHgPgGUGhCxBrX/
gXbwnWmjhOXUhWsIzD+tMZxGvTdacsK22kgC238drQuK/YBBQHdq7O9OUbv986RjucmOtqMY4X9y
lEVHvHS1tX1suXcGPznRf+3pRlUMpiizxu3QIji7zhaqaGbFWhjMowis84N3qnKNnMPn5ppg/ieR
o2csw+czheStUWJkVMwgBNtEyP4Yms8a5P3Vzssh4zlMk/NyRaMpripvazMbL9bz6lbRwo6xisS9
XDh3HOG96+//C1lNmWPtcYuld+594l2FAUxgA3Cy0zfr6kxS2f+0KvPpZLcXKCg+I5vzzffglfUj
qNI9U4zB7DEzfKyQrj6AKxT3eaYEhrrC3pPhW+/oUEf5Q2gODC56vbAMfsA5HeeE7Cc5bSIb8cvt
2lu4GAgCwKnPYK5xVGWYK+7RBKVaPFto5VzB8fBbHSFd5RCmCds+TOUrjb1MLHNTAhstZYKDldxO
DqJGVpd6lHNpxcPxZKBnbm71DfD0zWZSYFW7KkZ+rYZoyTR1K06y28myJ+JMbrB2b3fXmn7QVT+w
/gHlzDIQkcnrOvBBhkug2M4w8ltwtm8maLI/dgIgbckG1e4dg4OPN0c+p+1GFtPiZDtoVLdBYeIw
RR+qOmjywoPZSBGnyLwvOgegyyUqNIqo5PAfKEzYZcutbOWZLddbL3t1Kw/YSovEjwizFkifTVd+
vZDAawVu/7mPWN0SBE9qRJ6klN6ytsZT0iLefSEmCyxS9L34j4owJtzFYUeDfxdYcKG/un2Cfk8S
06C9I9KWXABFH6oVKfLC+lIoBOdA3JZfcW0VTwZy/PKe38+oCcR5+M87zT7PS2B0dnJb6r7uu9Ws
H3nwVt17wv6Tforb0bw1P1YClMa/d4kJ3K8XiKYkZuCii2k167/9e03gG/ejZSMAdkTydaIbb3N/
CxlTpi0KEKGu0P/VFgzpdOdd6XkRWMqi+BmEQi+gYKUqeYlfPHXv60PRVunN4klHjK7uaPA5rm4O
ucPbGh6BV6mJU/Smt/xKxxAZarUSJ7JRJX7piL3vx7V7tdD7kNZctt/o73e7yvCUz1I2KicT+PNz
3fZ4nV5tOO/75mmiQ4UxcPaPkTkTAWtI9Uwb1Sxq2iQOVNQCfP8KoHzKHjiU3dxgtkFPCBSZQezi
TQbG6iEZJMw12cO129cXDqe7ZGa/cnF4jdq1//aNeMREgEwWndRG1re0Gr0hj+sAG62WCoAupSyW
e+nw1T2nPBT+duk8wihcNKK+LWGtHm1UU39Mp/mAQLi3xdUEF0CiCIS0YVCt4WprcckCPX7kzBgR
G1V6FKv5q3L+LEb3z2g+a9vgL0FNcHP3+5+TZH8n5z4/saDssaohJ+puFd4NYlAQ6S2PYOKTwsNF
MTbvP7p0PFezRIVwInlX9/GweH3CTBJLe6GQhnqGn/yzG7JsllDrPWXngeoQV2X8NIl7SowiOo7W
IJ/CNhj7MqTzsAtmU9VM6qwQhGC8NPjeiwyF1aRyvClTYMU/Rd4eaAMuz5eXC4FeYJMfg92WaSiD
RKBVbTAn75hsNXHue2L2ankxVp3HzMGprDiGGdBci7HSmb5zZ+LnjL0TRXl8vQgrJfZYxGnKKVDh
G+AtFCxskIobmjPj0NuKnk4jNYaHr8Z5RcS1pJ1OQTOOyQPhuD5PLLfyPfH3LXKd/NN4Y7FFIwWQ
qS5Q9r0XgOCwOoow6n1ZOvm5O5oyV98S4TrDgaq3hu3d9U5cDRMv0ViJw5IMZ9egVykRXuh3r6QD
0e81KQtVDFblC1SiRBFoRNCYdL/SgnXU84Suj9zUzVaJ7tdBbZpV9Siszjoe1dsot35g9SOC42j4
F+P6vZNGYQMu774+q1fYuFmb2B6jTRBafNUbjhNDbg21rjvADOl226VsarOb28rIId105XQhrEhI
dnxPRQ5Nh++HiGdXA/vV+h2Hs20v4UcmgU1pn+o1L29lfSMFOv4roEywZWKK9jOGwQia/t8TiJZd
ooZZmPZyVvRslOoBk4/OcuQDcljFSMsuaUV7JCtBngYYx/sz4rSltEsI8eoxn+7XDNltNehqCaEg
Qe3BhSm5SkJwlJ/illoELPFTSi/a8nZHcrYkL8C9b/vFv354BpL1KgpA4QEKNgCaAjWpN5mXcE1V
mNIPXPUscCoUwEXObD2Vcxac4GgTQ0uCe3+bQ8bbE48hvF8+dF3q5tCx6Ik1kJXPNdKhDpfhzAmx
dVm7EbFJkgB9nkYEkfAEsjkAdp79FFTPS/E6YFo0T7dyee7KspX4ZrJ70w6XbAz21eVq8B1wzq5T
5DuGNELPgeU1RphBPdh8POZPq+1NgDEOQYjjY2Jxq0/BFXSu/38bcIeInTBAvnW6owtunghBQJAq
qp8f/jMLVtTX9mRIk8KanYR4N1pH9TfZaKsRLRQOUw5zxgmdawgIT8Nf8uliqOS2iKqTaZcsgPfZ
ckTVEMgB7tggkUcCZbp45EC8LljZ0znifcJTT5mgefhawwLGfXU+3fZGKCpZa2H1VeRUBMZgBmRK
iIQ2+3MvFbvswVvP+jFmIAAOGCB8OgkyS1Et2ePqu+c75LPcqPh4SWoh/rHYb8KRiJzOfZvYIX2H
/spWOMAnNujpEzHzKEkPmNH7/FTPYo8oBad+jzMqE8HlRnxdCvZrC5rfVgbz/DTxtUCyS+f4Of9S
ZqZ59E4bMG1SoD/3RIYAIE4Jc9Tr5PlJiFtVo8vAJ2f+y568DSkruUnSTjGnyGlEV7oRWpXPyuDG
0Y1hhM0oBHlWR9fVAsj5gWsyhTv5cQY7CSy4H3+engnT1t2taPkLg2qjP7MW8oLR5CKv6eCPuLij
s3ikwvB8ocwTFC7q1W+SGc+3Wdz4NRgBJw72D8IFMq6yekxU4vEuIab/Q/r29sgboXcuza6CdKcm
8bXsd6wnBd3e4vLp0GQx+lJx9JC0pLdMyqKWe2oLsVQTALnyNmIWrqnxTx3jxFwTzzgV+xR8MPDC
OZXPhmkVFCETK7SUspo2asw2zmq+SVWNRDmjMLKYI3Mx+qJb4aTpwFP4H5lWSbywtyP//m7Ic9Cg
wMNF/UeTL8egbK9Ddvf0m0Pmhcvybtst1zBcFGxPxX9MjgGXEG3o3T2HRmQBIQnjLuoNpk6KH9Bc
BdwSKbNuZa7h6wD+eAy+S8bV4OSL7V0+YzUqC0jbIQVBeWBeYA9R89nlSJ23538vNVuy/ICSAM8g
0EfkkvHdEHmLk/o5UxnHzjTPUu33VQNOf8OYhbY5BGAfjHga4N4JGEnsRYzdu/oLUFy3d5rLFXMu
bK8phHVznfuJl4Uwm7Fwmh5VIugMPYCHfsDoWohp9vg3S+s6yJm3bFl3isEk1SRWmFKUhQaQykdD
3SyYPmmSzwZIBAGOQUJXT2CAFVrQ1k+ruay8kFAsTPubE+kpCbTQiiegbPDFSgWg8uVpaoYXKvLL
xKAXKIGlPFQ2y5Qyc3uymR0dUxhi+MC7kogWklipKi4xS62biYPlurNlFVcD41yMPlIkbLTqZw6l
+wvoc/tR3sfoZVz11x0bq9weI/fAABAqsNoY6VV1/2x+/Oc6lLlQTCHpzx3kRi1pwOrmaX1Rt7Ys
uxpiPDmwPIxQA5+sc3v7OuSQMzdJPV17WyCXXpp4DwaiD8WJH/ORGiGt7VYgV5XtJ+37YG/wc7kF
OrRn9OOMQeFF3XpZmOf+IjMU6d18CDMULNawSB66uw9nNu5xVf7EY4klt1BhVAJ//6a0xzgNxknn
42uqOh+bDsFi6MWxR1G47WMAYHTlKbDBZnBMESj6BiWICa00s9vlSHEcIsdC+yvYu6Uf+qOu6/iQ
90aarN1yhsG9Gmbbc7Ah3897tt9cNxQ+jrlT28o4mniF0smSOj4bSA8M1URC/rbhHaqtvJZQo+N4
e3L+ixWLN0iY6nOsIpxUx67tObLfDlkyZMin05MyjOX1uYnRNu8CoEIlWyTSnvFfDZqQzXGwXSHr
NKOakaSA3LtzxsGB92VUHKOIhriPXTeivnknicJuPCrPJ/vsE9a5iSVpd8dHPpw/q5qZZUIg5aY1
+JThctefqW4AYKkVKYeMRIxJn/ARs21CV+3ceovcsjzonTdHbaLiF87nH8JEWgfd8b0t7fgKlw45
qG1DFtBfCN5XF0oyjgxckXWz6qYiODEeHbpqM5m+mDAEwVmdNQVzzGV4DNEgila0/aP0Bwj9/66I
9eqVhdkqJrXdxSuP9N2lq3r2eMZI7UUzhy6OkB29kFou0GcM5PgQMiLW/Vru53/6i/db8MfSUCdG
Xded00LimFPq/dgtkXV+8ukQ8MY6ZhT4pei8V0LfolA/qsbtAzilRhhVJ0a1kINS0fhwlxJSuE/C
/eihaow5XouwWsRTOqjSgWnlhfYM3UGIx8x3AAVjAnl71xcCAzrSUmSgqOg73QHMvHigjc0QJ/WE
gowDKyaBFyzcmCmTqnmGXuGyH/A0Yj+1IZ8aXt/Y73dScfV4mBKuIATWZ0p+9hCcX7exeGyQAxi+
hpxK3hyNxqplor8VEJr64giQC8RKP1BlSYCXawXYCBLAVEBe0CjCg/zn2OfPtT2HOYvSj9tM27oh
2Urv1gZbqoGkuDEIhGYw+kivQy5UL2IIpn7KRjfe+qK1PHRo6GII/3Lev5rg6+klhpXXJ6CpnvfH
dOxpNpn5oG6ERoTB6w3KEe1vA2ymCAEKeYAqvClQxX78DviJEQOkoH+wjwpyc+wBsc/kelf6GYoE
LyOh0VIx4c1IFEXg+TJ4FNVSxe5JebtapA3VSw9VZDhmkEtj4qjYGjxYn1IyWPKK8ailMFyXAlvZ
NfSrNgv9QGwiokQGgUUuGEaQj9hrPvL2fI1uCDJnK9xDQ2V2EvO2Fzfari6z1yMXN4lVhXfTIMy1
ELL0FMS2H9XwtMK6Ci49wLeyIl3KEAdC2NC7FG2pfpypNE9CYDEVkGkRr/H8BWCopCdP/QP+jkal
oULd7Mzb3VigEp5QjVrEVgDcUS8gARZBCDrRRVB4QwqLgW/aCgD1oZgntx9+qQfHcBhzn2PM2ptU
sBQ/Mu0vdHNQckCdzKtpWD2xNJIyTv1YwIWGJKJgUrFnKPJiIcsry9GhwONHTmDo4S4nF7k6K9Ix
xwPiMRA+QrltK5OoKGGjwTeygth49lD/aPLoBaER4u4T7hcBUzN7aIxsruVzNaxjcmLkpVYwSP4x
RC3zGCF7HXiTTU8Li3UKWjYGNsJdFnQx3DPZ9WpV4lbY4BXR8PWfuvpEPiSMv1zMhkCzxiTSY6wl
iDsRzTY9YEY9gliGHGEJi4u2t0iJk4DGHfyXif6UpMv0KQtr4CnM+v43yrKstEa4UDboEk0rNEOi
Rv+0WM25TGwZnY/ilL2KfMZnbaYQThVRQ66ilWUslZOyNsKahyFccfpjj9XSM3OI6z+dC1Q525ek
upaR/CB1DxP70zJOZ4wNU15u4imZ9hVih1zkF06WtYGMR5+NUzsmUOpJJP0RIivFLM6GPk7lRLSX
dj8OvRPxjav811KW63+mOyw1cM5d43Qwm+fwsnkv0OiKi8NTMydsi60lXa5JUjvqjAKwLNXM5tpo
RiCkJmg7B9lu4eftm67K2KDLizV55/XxOHKA449EQ5SGa/TsWxapffZTe7tw9NwzSGPVdrSoNhFa
f0Su90fN88FsYL2xxfbk1qGC0i/AvPP5lx4CrOu/l7SyZqV9gxEoBHrCxh1V1YoXMwngoFrxxW0+
NtvIbW37NrHX6VtukVv4TguO1hpEVLGj2SfIcFf4rLR8arBXGY+VRklv1ry7ZOKU5aTbeNd/+Y/p
qNoaM7MaTF2ZFHIqfTFez/JcNWp0SGRCvLoagm6yWj9IvSYHDgsNvc+qBNug02CveDtHBB9po/aj
VZAi6HyzL2mwTKaagrrtb0t1jspedi7yD8oDxlK1zYy55aQZWt/rdOMrOdDspiAghbqVMH/nU6FL
YlrGCU003YJ+Qhu4epUEHXrXdiisUpzJ0kYwrw8k5vaiWz1curOfmSVlh6tYBnUf71XPxqT90d+G
bI1Ty9XCU2UZNk/eUYpUuL9rzkfNVwCuWkiGZ3WDDuz1ZUtXxolA46f5IJCFBTq4bpc0LTTuTrId
QwLw46CcI1tpkztEEIUz2+oyZnQ0gPWOxttniMibjMaEeL3PDnGIPHJZhu9FR+wBRWJmDE0qRpBY
sKhSiPxX9lMgsHMeXnMIS68/2ZtHtGek62egsHw8mfwxENczLXNklvi18+rETjppGvYwXhdnRpKF
TpuLEQAG6SoDI8zw8+FMYYhMkucWB+yCnZdMoX5BJ5/lWYE5pqC4n+9uqNbIMjRs/RimRkad/ovc
XZM9ND9bLqnr3V464uCQcmks7v6q3zSEm4dZjkGoL6XAeflgNh8r3MRvrFXNcplGqyU6smTf7myT
9q0mfQay4iXRxrWOsjR/ie0HhhQlApw2Q8C9h37MIfU9EOccoii51oQdoLsBfAh+t8vhxTVBON5A
oEaQQLTbRlfDCQhXYR9D8jCUp7EeUsNoGoWbUcDTGMp303PvfoCBE2m0J9ScXujLDYk3M5iWhOfS
iSIo0JFVm04BTKPuV3DsrunVk1UgPcwXOCthgFdzcc5obn+Q7PQxz4DZnxQsZHZoInqViMF/QbcA
zjr7xJbu5RugLZhbusRhenC2j8x9bHkwfaf0xWq+LIoz+wPmElla8V8eJWhp+DJQgG8/v64JJBx1
qMTh2tTOwlRjdq30cq7NbmjWDzd6EfvPW/flVoQ3EO8ItJRJawigHQNStH2eJffc+0cbFF0exP+W
tZMWzyka4W49YDZc+7uoS1esmiwaDr3UBMRQKBM9qth0R53T0unr82LDjdtmIRXG8T1lZ4/hVFWK
0Sewqf1DxKAb680Px52mOqPofk9XRN5hemgevrdYOoWnRAER2IHhHkZ+yaQZCyzxy15vKMLbOEEX
BRi5+gTj09ED94IvcduYxlBgXla/FgI7pvNVRggi/IyDiC1Ls338rUFjqZpqV/tLcFg1IeS1rmci
lajkQu1HbIT7eDwq5O2IHmYipS7armecjU2LNf8MZ1vLv32crsRuJ422E+su9LVpS5YRsU4EtDY0
TLK2S8hbCSr8Lkow1KHdyZkbRkjuk6MgI/w6wJ1Cd1eSBREnjrfWCKWLFdZUxAmYO6I+orOxXPGH
ynAELY+3JAL7lpddTBE5Kzh6U8aUMKCM5s55R17hQquAJXEZrfGBDa2QH9zCNA3hhmjn85JGDXi8
Q6TJfrMZFKm8xPs9ARuHFCwxPUbTq8BPRdZ5TNTC78StR+sImX/QkvlzBbTqGkCb/g5htVbmA7wB
t7CD9r9cShDEnH6r6XRzYnGoGn++huqfNZ0zJGzAPqOVA8srmlzhWC64+NtqdOI/HNzZbLIsLT6Q
4dzH9Pj9KrST2RYjFL09WCSNt00gIJUsp0vHJowUm8gBv835KX8R0mqjlg6lJxufrqKa/RrpZWVG
0w5VbAttKlTw8AdPfBbucaAp9y80AATFkNrFXUGMvjiSa4VsqpY4C8+3t6zBlcyuYZDufHOynCc9
y+UnlW/jeufc+UhjzIeaG/TDaCH5K815aJ8LGJblj2sSTu/TRkSCoGjKMi7nbNE/1X/zDTpewtKd
lmtZSjMqb8NJjA4n33MnK/dxQ0U/sCcU+dI9JxZ3lxPfiHBdqbpYZ7x5wfEV1F/N662QGZQKbsCt
MJu55a2Yk52m154H1sjfYPvyx8TeV84AV46vh188lgp23uMOorzUw0+V+w8FLd8OWNLQY7QXbS+N
cllQh7Rh+2KPPDfvCF0A9QG14iBpWKQ/yCNovytWlwEem7rC55JLGD4/nKOnp/aAQV2xvbC18EEk
0fXSDSrVaNSQzeEW62jEGLQFvDBQ72BC3yJKyyGd88j1vMUYhcglegFV9xhLxe6d9FWkDjgxv8Of
PQvh6jXepZjUEkhXfoj4zJy5rwCoAZFZrLymOwVz81liCb86fG3ArpvUQKV6BjUl1KqA5+KmseLL
t4NaiVjW48BQUMRIw3dZvKGbK7m/lhcSpURrdkGUZa2U3ySEC0R5zo4h9bfaXZfZ4DU3xobo4Tj8
VsAu2pE/nBzwCzBLVLyNaphjc9276Iven0+hX3MMPOgHO9KGIgSJFDNE3/2+pb9Ej9vHz2HjlDHC
sEyYCljFNrF/ziLqLJZAMuGvfp+ICkxhuWV7L/u+Grf4tVgwi5brINwEzb48ZJFVsHQJAtGTQSOj
K9bGOk9+J3cKPt6Aj3DOCAAuhPB1OZXCUbKw9ayeNH/bjMJ2zNdEsz0iTKvgGb4b1bFnsphaMe8y
+KJAtlqlFd/3e1/yATgdV44BSeNkJyJj0dtqKCJrG2c8MScM7VVN1nkWl7/tCdQC+3sWuUx6QuzH
nOLC4J60w3x+jV7Qe+Pyjf22Y/v45MLXdaCuYiytOHiYaP6Bjlcpnlyi1oqXKW/U+1Ak5+9g1v3B
PT6N4lIKBNszJL0HGbgQZz7DwWPk0GbWDFawHvofJlAI92GzN8RAMp20QilcF7QKgyT6BFFvto8n
mhmNurw1Hu7r7goNe7I4UV+J13P+TPvPXsp6qw7uXdBc5qOQGwAGs+alZhwXnLF9Hmy9ULo5GXr6
3E6DhbhJfFhcIScCYXx0Rtmr40y3VkY1VHwhIO39pcBq8GWP1u0bKQ1tq1tnk41PzaafPlAGJrpX
T5MyzfaIoTT/SF7RCjDVQh0fwS8B4aUO4QYYwAbZhCec6ffphydNBvQ68c9VEeoXgS6i1R3IKEQG
Ar0vAN+kW4TfqlhbLFqWoEZ8scQTkqa3B+3rM7z7taQuEqFYzzhut/hAXcYbC0W4MRYIa7tFeK7g
Y27l4kCHRt7VUkoGpgLjZkkvAMyLt6MMkeUo12E07liZl3343v77YyBgHPj/ZL2lAh2gTYswgEUq
ZoJRbxbfJ0jt04zAI8v5egl8IToE4FbFiFbHpAOJrZjP4vflYL4GDfsGuot/ME0Tdaz+Yusc2Mrm
digIQMUwymI4L1LAHqatENn6VmlSDreE63SM6EnC4bOOhixBtNqolHpXkYAwgGsUKT3cLMXJyCUq
jSgvQ8pAEh1+13M2aatmlW36hVTWRzx/EWyqWeuBBEExcRMKY2UCBFMafiXj0Gt7IOuQIlHVmG6i
G/YFe6uER9D6KtzSoyLLgDuehF38j37TUjhzkSp0G30seXqlT8ruLLV31hDdn44nsNDKHnwmCGgA
6cUeUnUfX8O+kyJ6J0NFOSwN7ILmkW/BqlE7c8RJyT1qjuNGs9S4o3NQtuxNU9vJRKT9Z56DzE7C
1v1AYqDk+Sze3fVd16PzauFoO+CHLFW2W3zpEkyZQPYlMxwnlrzWjYqQ8H6QqF+gaFx4hcUZ7mrE
/+xF77RQkWBzjliyWEDoS8Q1J3QfbAbN9W+UhMGKzlbXUAI8UT7o7RhkH7tmSCJWnII4eb1Dp0P8
zJ/fhfDoCKqslJN6/hlCQNZX7aoq+3wU5YP+ygjUT1SmTnxKvSTUgyISLdr5phkF4DqFxiBeDpj/
rAv2XA2cdF9qILbP7Zwe9btslz5qe52E0p3DHdtANG/3Hsqupml518XJ0yjUGZvIGDr0wrOWL/J+
BOBLo+9dm4lqoHwp+/G2Yad0IHk6Y6ajWGSTAlifK7tonNpN7P4CfaIVBwdhtIaGJcw5XKTve1P6
qWXqp63NbBAo/oLIyBKItpx/ZcqOcqMURwnBa4HT4mShwnxKRCULHue++bNw24HQc4qq1ostehj5
Xqliix5BwacqQ2990cSWOfBJALfC+5vLCjiBDXN59n98qm+S7f1loaB1GexBI7ircc6gBJMpvH1b
7RDXSjCG2Y/gCLfIeQPKqqTKJwluI5ngQH2hbIDOhRmS7P7MEfx58qfJJ2p6JzOUHZIUsx+zD2d4
F78QqnVdhgPfHyIRNCOKAAVlRofaD/mRnsvJwS3oYK6aPNu6lJtIAUknjjZvVfaxI6A4tFlWNjYJ
tmJd733DeTGs8ItMbXJLMfw4IlOpm5IVADCaK0l1eagwV0HGdBnOA2lcBYbsHthVy9oPk021JxZn
Lkl1UEve961oEFJ0mKf6IGRhVcrOqdaD+XdYA5mvhPQZCjtTZRull090+gXAPkL2uWAeIX0kYvCH
bSgotQiO23QuyB49CW2E36SEMbh7/WbnN0ijU8JTT77nwpiLXylFX9rnwYvWWw984coduJ1ZH2Kt
ZouVucQ4vHB1YiKQqRzB6cukgTgkiN+moaLaupOgNW4RRNE+M5w2qkCfAGOG/y+iIoCOzt+r2Txe
SZmOo8q6g7fh0/FtUWQW7PE8lL47ZpH4Ct0GWCpHDjrG6HZivZua5hnvQ3BLVWodsgDNljuxeWlr
NG15BJ1XhuZKaAwm544+ol982psyIMzZzSmHV1dg8Qhw4qKsrVeEpKICGf5i6KqWutWq3+ji9JVF
JjfTrid5Q9lVXOx8jQtc9ScH+bsjSvlc0LCPxfPJlwN/DWas9HX1QOwG0CJo5fUX6yu7xTntN8Kl
+8bqYom+BF4O4cS2fEXKo0G+0Kln2EaSx3Ofc7LOmnpyfypzUnLgnRVIMf0hWU44y4whiC+vhKlY
wig1PvllUsVZPcvOCpXi4nMi1Km0EXWsCIJLzmoyJZO2K5N8KGlAfeqymiYPMDVbKpAkOpeBm0Dv
ubII6x9gHyecovA1UkAJJfiHTOPzBBPXYko5tpvztpynqWMLBLaq7Zx8UL3imhdLm1M0yMx8uScU
sOQJO4mqPNC42O8ZtTna+U2E2A9KQxoH5T+e6sBGtDPGF5lTd4ouIYA8UMxnXQUR9LpqUGWXGVD7
CGui1FRQ825CXWR4ikgX3CrQ2kwUjeuPIhPerbQZKo9Lv9pE2EpflXOf5svZq+BXE2F5tcNY8Pjy
g0ZKqdlA9tRrNhjbTu0kHOcrHrJYgNDZtKwW4oOc/sdFQhyK2T0JmEtOADoo1TieZh0uelFN15Zt
LmZNUfIJw6VYEMrnKI5KAdqd+RRiOhb+Dmlsj0aiyTbndVj00ujWM2E/50I/7HDs/M1C2SqrQhyW
L+/C/+6znK3Vza7YPA3BuaSD9THDi0kjvWDREDA88uhNSKnCNEofJDm8jq0c+ngR+lxzisVTFdS9
76L2bU8fymRoTenXZVr3bnLk/EFBvbHay6ZtMbKvmbzqLt/Er9roNiC5RcaXHuL42/dcRY8gGluN
1BDM+gxci7/iK2obW0vDwycKamDHcs9aR6Q8mJktPXlj3ufN0UnMWV5PvM7nr/NyT2QUfnXZUds3
KL0KkScmSEH6iWvBuKbTeeu/XxnyQqAvPz2X0BAZFljrBiPaqYLxUtj3uIGfuHn5nTh26KjjaVbv
M4/D01sUVl9XxvAqgE1jKK8fd2CMFS3vUdyM7ZpZx63UOLK3SLpyezumyNRLEXs9m8R8vm1+6T/3
xW+pzY/J7X+gd6Qbcu8ffgCUt/PonSEL9CMNEdxcxy/ecqI4lfGmjBs2PnNZ07asHDcr0Oixj094
repclwB9eoaZa4ywKavnBRbuU9vvpj9RJKj5hxITK8vOHWh2rByrDVMXzIzPhNL0M9Ig8FTnNXnU
5WpEhsUxngvAoU9O/HDhm7mUpj6IxR8zKwtVbLkFItJ8dUUzAylFUxDpE+hgiws5qiX3k3yv/EaM
G5bSnq7AAxB9paRAP7NTgrx6PNzBUxn+XVHp2aOPquyQERUGP4+Dgt2fX3Txhhc1asOlm/StXDTZ
83+5llCa/r9Ha7veWY4QLnPhEinRlYTrXHEIYf9dhOYCYqMlATvwpHC0h3s694/sSeey6120WioN
Y1TLihjGaa5JEfhUjH7UgKLXEtKkw/UiRdLB4dpLTbtIoUjkFErn8eGIYgrHMA1LTwsQlMXCZmCq
deIJvMUYwaQTG6XdyA2BE99lmONr/KeLo620GubYoL6a5TCMv7tQ7PU64F5Ra0/VmmRObwf7EnML
/odDGJbKlSZxoSkm9IgN8864/xCI/1UZC+z+B0NxmG5SehcRCyn+0MiINZSd8VGEk6zKmFnRGBe8
3EBBouZNRegBCucE8SJRwGy96mWMCk32VE9mowcgznHs2uQ8E02XHTnEF8exxT0bVqLcFZO3hTgr
3A/NzeSzBuTRdTpuHSb2VgaFVArhhKddo1EHb24fthBXSE0krqtFKfXmAqSAGk5uVzddMHoHBt2y
CU/dq6X/8QjSQNgfJSjJ/VNtpAAXavhbDYuRbzJh/CamBwkrF84yQ+0tnmwf2JCIunFfbRC2Wi17
oHtJ19Ia/Bud36VmGxTRfothb1T5Fdv+oXII/vYaiVShyHl3u+jclHLAIMs/lISiUfV2c8aTCB1C
0OuLAnpizWKElpIvJ+xGUl5UaUEmOux5VqH6Tb9hZLj4jSzoB7vWRCipRZNZEO12/Z35Vpne4V+j
DK6Lsx9IN6z9cOsCRcuQEM0+ePbV0L9n5Fh2LAM8UeBAbAsBciOKypohCnQFPJ+CiKlPNEp677Oe
FF4LH/5Tej/nrFb58tUMD2vvvFjxNnUmVK2Rmw8H8Qk5IgPYMmt+BzBj2X1W5uW91BZzFJVcPGAV
+lo8ayU6uw0PZHB3QXGZyzXViY9jW9XukqK4HgoNVQPy6EA/DZoc+Azd9dPvlJt2m3yle5bvcfVo
LDvlCXRc8vBkv7g7mbfVAGW9LZZggkswh3Tt5BFlqkduYCka/SejwuUhmCIOUTXVBZIJoXnGH4OF
NcF4mUsKPCWJz7sE9ah3w+zRfwv3In2Bnq2O3NTWLQU2gWBd+mhVauIPI3yKk7xgoZci0GzHr8C0
d1b4CN9lQXCikVLkZw5PBCD36oSTauXhS/PiKRaPedkB9nFeDd9TVZe233X6m7Z034XXYV00VbxG
MVr1e9OGXJwhIOYskVT7EsGo+jxNXHBvBdwqVxsvKZOjIURk1WbfVnSymSpum32ACTHAVmMAmkyB
HJTHciwGeuT/ic14DCrzXG6q9WDCZhu7UxZ6d+/zWiX0vw5mHBZtoU2THZP5AFHJotwUO/a2LWD6
Ns0IaX1sw0E0Ihii3djHbq5J9YJDXKWVoNUkP7WNFlOTZ0JPHl6PGYXvYvuO47O322mh6FWD3FYQ
IndlQcTcM1SFKQLn+WMEIETNR0DwY7hIVAUMzFkm9CRo3kUO8kHwE+tfQk27bJT20V5bk+vmGKW/
Q/6EF8Q7Z5UJQnJeWiGgx277aJ2F8yAK8yjDXofp1kW0KxZIL42o8QwhOMvmQ/03LxIz+vti6epI
XcyOR6hkAEGLFObgmEfbER5E17oePGkJXChMOhZFzLbMJDiyZ0Atj3VnKllR2EQ+b2Wz2EBaVgLV
OMR5CMCAv/0rvPrg7SDbt7Pa7mCSIjUxQi6QflCYkr80yHV3tmyGne7jnOqywcUO4CPkzWTeyuBF
1QHj2gQkWpk2ttXRAdOfO6AAx7Lf3oWf13sWkoOksIHpBPQoqpySkWObfaIxdd3k9Wa8nkPxfuIf
CLUHRxC4Hj3uZP3dm8eED29QtsHBL082bBEzYXIaaADe5BjwPexBX3PMMmJP4H9QJsaesF2AIp1Y
PAt3uLCN78S4lT6kKe8++epRfU9rgcynuGSWiA0NqUrLdxGH/KqfWGw932Oco3Nl7B8oBeyOvszm
4xHQXK5zIzot0EnvGaflImV3OWmtVh6GzUh6JnjuXVxaAW82qBXrc7+5bqKZo1jgHrSFy4YfxOIB
V22Pe7onmyE8kmxrkIAcGUL6OBtREcXZewUugrHk7RWyaWw7xFWKjoKQmbE50rnN7pvhziC1hMPL
tGixJylZlzLe6rK3JEt4KiSWAeTi9l47qJaRSGlXeugpRRaGFY/jZ5Dk0TPJEt6pM2Kh01u881v9
tTyMj/emG/GncVT62IAdrR8HxPMeROuFr/lUYXE264HTXj0bCl5RBZCyapqUJ6hn5GLp5LtfnQmQ
yuSh5R7FXh98HISo5u1FHXOOoroJw1Y0zv7xT1FTII+zWiCeyESDMPkHGw4MRXOwlTMYbExtMjOq
nd8VIf+tNczDcu1qNATrVXiQq+ClAf0tASNDlJybUUXah0ScLkpJarV5gz0XakXhSUeMSaXv9JlW
HYJF4saejbqNKevJmPUZ82gq+roxTq3X41P4WORtr6AuLZ0ZMgQ8koqiN19zVFcoEpxZ+zsgXb5D
u5a06n4sEIGtLfWiRCg95F1pOZxZ7Ya3fOVu+eThs6hTlWQd3kqaoc22xr5fLZKhhZgsGT4wbReC
zMaye8FgQGEvVQHg4kcgNP3Wor8GJykaUfJ2sE/PBKWsoKI0Qa5RWqgubXaDFFvVLMr44eRj0957
gPFcSeB628+46s7O2SRRLTRBG240Kfp8tzGV52fzyzj3cvgyZivsNgVo9WlL6Pj6c5396WBBoniv
qtzHPbj+q0Y9XSeRfsIso3Dn8eMLoe6eH0wU1aq9WUMhgVfvlEcoccVTa4Q456ijb4NRjk0pl1jo
xLhGG/TmcDfdHxabsO8MKKJPJCyblZfnqZdV6vpTVcz43qNPNIk4EkQZkccM1evum2b0Xocfai4x
ifZ5bMJy0wK7Df9K51jTgrH241K96y7y5anZZz63luIV5IuU6Z1nPmYlZ4JNIEYhCl+iVa0uexC4
x6CvUjuZ/nELGcSWousbwSPTM4//5xe34veeAq15hnRHFaewmehkrqJK62zVxH1w3dq71tJYjkD2
SflOqjBLvBIQyRXqQU0zmodovxk0Oyg35vDNKXbg7GES/cwPVzln1aG9fTwAJxZPpnCvpj5C/1hZ
9OgJtUJ5UJAPGdyKWg0QW36btpurEfr/PQNQxRMyWyPcBRqt3knaLsr3ESl2XYvOSyexBJr3d2PB
piAabsaAiD4o/txbg+PNErxaRECJBmq7c0ZXFevEjy9YiraEKSXAK+YCqcEEZw5lxfjv/l2lwRdM
DfuQvUGx+rdAQQhY1Plk67s3uxEfkNSUQjSVAEY2Lnac6A4MQdbSYEcU1XAklJTHq3Oa/pl+nn2K
k0n9uclsTWMvFF15dXYO4pU0kA6peBGhsR0CcxmK5kyu1ygygRjZQ/SIhmLjpsDE6wIHqzocfDFd
xNswyVDQ/fo3mOg9jw/r3ModEhNPbb69HqlcBL3a3HzCSv9c1q+ooEXUjfHJ1HLJZg633/vnmAvv
RPOLlUnFrEmQqMka8ySdmAkkEt0bWuw0uppjFjMyB04UzcoBBQwgYwWurr2yz3uLLWi6O3epmtlY
x7IxtyZFGvP30GAi0epTz+MZhX5L20SQuzeX/vug5OCUKJ3urrN8KsVcyhz+zDIBjgjVbEGKKIAV
T3jyIQ0k2ZIfTm5w5Jxl1d/B4dxiwDc3GkWAM6yPtyBhF0csmxP6dAqkwmiydfg81y/RbBD9GEnz
nmdHKdRWMOkMepIjN4I9m+crZR4lHT4OxKex4bQ+Xy2p5GkNS9a5AAWFr8dYzhFFg3QXNFqnBMh9
z/FELt7GQob/+s5XfZfp6j6i7rP1yEl3QK4McbPinU5koEY3HEIIhZndjcdy8r35HWUxktjF17g0
PVZCVVouJvYbs260V+Nhv9cRq/vvZHUwo1NuqqahUomxVzQKiTeQ2DAq700Jw1bRf4KC6cM8U0Z+
Ke0vDeHscmtIiW49oCIzpOEtEUU7cNwLKskM9jumM3e19DJIzRt65hhpNi1t3gcIdSg9MB13ylWQ
anMD9W7nSySX1abg39WES0wRXMPSDRB2CAwUwX7k5m5E6EbAN6BxKMDaWFu0hazT+tDjmAavJKxh
cgJduaxQfRuyIGGM978M78x+mBG1pcOdVA+1Oq/FqEqA/byb3rQqT6U4PvLVOPBqBQpTXwRVF4XF
wpEhyIL945N3+PHfTL3I2uqjsXBPf1lhiy66LhMSFdwP+y/5mAX3iXJZNF9yA5Xlo1rnsb1VdPyU
TB5y2Yv4VoT9RcLOGn26zAgsjo6ueFgA05TF8c1ZI1KNSt7dsPSqboRGoSM26IMMkyeGOlRi1chW
7kvvzo6EzgjM1cCpVt0Dfi954MCyKQkrnYXMxu3vplPDo+h0t1Rc8nGQc6epd//008PRoh4sq5nC
Sg6fUW6hxIFGqS+ySoShfM3kf1vCf0DtlmpXBniQeNgsaCYB0t/ZFg+yNLH51qaqIMthlb/SCr3d
T9nuLKorCNyaDdz6gVBeryTDy8es68PtWjafGrjCe54Fc7OW1nDd0J7YURy8hmghOdnLb6r2b3cY
PrK4dblHO92a729SucH3kOOZqpEFxi844e8pIYQAh1YVGtdy3jSDuGYmHrHv4vhWLPtDgLtWff7C
m/fzaUjg5CDHSWdNOVjPzu0LEuSjRfuASlyiZC5YYF90Bod1awZT8gVuBy8vsWpL7K6FKQwizv0P
hfZYTJOKTKbiK8vBCCWgGO6BgRMUb+7R/4zIVbYok0QyKZD2bXT6J3onuzzQphRbjHQKAp6AL3VT
CRqxh0BwOwxYvneyte/lm0THxY4Qxc8RjWJSeooJTqb3ykTI79UD+mE2vNf9HRBcQv94RUgolQII
HbONiU5KthCByVKCzNaWuWqgVbWj9OgYlvRKg0sl2O3GhZTt7BYfRxT7BESu9DWCvxoRjDIFhBIq
fQxs6HpHD8tnKUShyPJ0dqlhYAmBy/PZDGDYgmtjxNtitgxNg8Vn1CdjttImTBwj1XSGJy4u3FP+
YhqJ+9cOm0UW3baie2/Gv2jzWcaIbDFlI0ILNtiVPNKNytr4q448UEyaajgqu90xxfSi2eOaff8r
z7+FEoUvMIW2gfd6GRSiA3d5owlb/V3Edsk8gL9oMR6L2aaiL1mpTk5eOsgjYGwqzfmt8O/5H4XQ
yjIpij4ZT0syf9cofl9HvKwsgu5nf/1mbyYRFfibXwjf6lB/u32+YRm/pRTPEM0EaDBMoaeudocO
vW/AdHc5XTJEpIP2goHK75/uBrsSaOzZX+3tW4G2xjVwicEqZMX/urUyjo0kcDvUOPSDI4R03fKt
0c4zv+ac8BX8pSNaKMQun3LNGV+78ylzadc12AS85bn48GtZ7vhPVNYmzPh9Fuv5yRGMBNxNke3i
DqCXyRrmk2HlFkxxUrXdaHpJM+yJJNwpFqrat9hG5mlQ2iZ9m4ZzhAJneB74rnbEerHH/B1Ahf0W
7bySY3Y0LYStK1gP2vu0g+vr5Toh3TREMxVtQTCbBSgNHlrcDP/xJ+Czv5R1Hj3WPya9fts6znfm
QD3xEE9obM07GyhRtG+rQWGvYfibJ0mMPcRF0I+Lbc+7eCwyWG9YjE0oU5ElZA6QV19o6BuIvoN7
WJQV5xJhndslU6kHt342/IEslFA/BJZOzOKNfvYEPGVjqDESgSsvjG5Ew4yfMI2xXHrwm88A49bH
lFERmCiu58/lb4mmMTll+RhK9Do4bkA6wkJfWGB6HmmWTf7hsMXN/Mgz1I/+nLAc1ndjrMF8DezY
h0k9FErzxkZGCemTnWyVbldoFLhZIZqhAT15ReZLr2OL1GSdkZauSbfuXmIO2mssB3R8C3z3gXTQ
5BEus8NOG1lchHN3DlJ8ylsZnFakLeIDixO3uAntQPVegXX4F2fLtMSwQhrJWsYrLWHds4xcVCXe
Lk05QWLEr2q4ubJopHFVAQHDx6bgbToEM99vLa+XsFsdNV91zgiPf9eJo5k1/ZAODW54YnmyTued
zZeGsNbZk4QS1D4eX0xCUiRzVvFUYCwCnppxf1IUPsWOvglxdomvPfIHWelL8PxmQaK9M+hs7iKS
rr0WW3gxx3qgO17l36MQ5+Aw6YOR/WjmvSVIaZhwJkJqffyl8G7qmGG8AKixD2Zmfi7i0FKD/Nt/
UgP/Ki/0L/pd967vuEGubub0abqhW99qWkcMXdRWWj+akMdjRc0riOM4iE4xF5eJ1pzEiCCj/Ta8
IinU/PgSbpDQ9DL78fcDiI0j14hw3d67lJSc4ulyUDsFU6IbUcJr5sLHc/X3m4L6w/CKYfHj3UsU
DdFxuYTH8MuKWRp9RwzqNPCY8IU0pP2B1u+jZ0cjxxV2MIESfJ5a4wC1bMe9Tt7n/8yA06gwdNNc
kK12Fh7DTVgwzGWBDscw3X7+u1aUqfAMD9b+pfi6oKrbpwzdYldYJEYjXmt5m4q6QTkxSkXUWQSX
X6KKZzPOGqTF8F2SWp5xhWUsZiQ/GXzcq7SXzuu7sN0LFuVUSGUrvfu+w/5xwaPiSdgiv6195BXn
1ZQo3MIWCGPRXM8dmGwb2pYXa9zi+cu7rjjTyxfydo10EztvQttfqrNU8dBuh4k3ZcrgL31Y06qx
CMcB+5at4SNJLOjbbUw57GzLxPmxi+aSbThoaHB5PAPoYhziNdBWR1T9Md9pP/VM/PbL77keGc3H
X/7LzLzuvldDOVaejAAq7qMReZiXMWLQlrCQuX5Ba93kgUEoc9/4RlYRUp8zzwdquZlrVDVm26A/
HTgiahGzc2tYLk7l6vzaaTWelsI0YQ2FVOU4739u9HHv/OcOg/IwhuSHcaC87tPGr7OD65xGpSP+
jF5KIIM3XGVtuh0j70irEG/5/qT57jJPbf5R6IPtIdeb/TwHgKIhcr1WTpZ5Q5X2QcTBJct9k/2I
f3t159J3UuWhYtxTCVPsfieMbuIs6IlQELXgaBIjVmzsgEc2+2PYfGqCSQQ7EsOzgw4QN+P5I/Qa
jObPdSzS4f77kzi9ZSIez7efPS575PFbSgeOnbZnqPpaIKTy66FFifLu+5qfnny0hCS27KtiPlBH
Pey4ZIMMW/BFKZYK1NdRdYMtvugylfT1su5SKfKeahEXTd0IOXuLYeyWyRcQLHQDgmlxVuXXZC4Z
UpSu33DspW53ZdHWrzdFxOmNsLL87WnkGeYE4vWP1jdPMbSY/bSg92jOUAnNRifHF5ELSihy6RCK
Jnm7drk9dWRrz7XYgmeBtlcDUWKAJ509701t9w2JtqHYoxV2FOyg6CDHS7NWjGhWsOmE1tICT2LN
fVvWTKR4bR8YxTCSiISbXtBTf7sXZ/nZpYmsvA3+L5vBaTSFxClcqgo83y227K7ly/pYj8ZH5AtL
wAtwOQpG5vN+/eIjl4q192MOFFySrblwlaKs1kzHAMOFnHM1IWPrAOnY76CyyVEeLtzZAxiHX250
/LU+pqpgLyZzDoPdOsRMhZPhN9VX3X6FKNWwPV3FIrF9YhmRo3G+K7Um1jP2FILZv+fUP8IEo0mD
hBiip49TycoiC6mtow49MAFVQxYOgxA/RL/EYIY7YuCyma+gDzanxbMMvuTBNk4478WrIWlnsm73
Otowr85IYWoQboCAP3t7JfsYH7M+JcbeUyK8lr3tN5sm5WKlFBfnJH/fz+lHqZ80zcUX4Hbdu+rG
z2EfMvEnxV3k5XcV0x5CF7WwORreSKjyJN021VC/SpAuRDhqkzj/yOQgoWEiXgYO7JW+30zCoNXf
Hw5ugl/jW6AsaF/b3vCR11QtceATcjdravxtWs3oTfotX2V942oqMsMfFbF+1VVrCyMBF/dApnJI
aX4024biHcM0Ynvy8Lf98p0UMbq+0huON3+f5A1eBQIePx7a8kA7xAYcipXEKyZfao74kUQgbTiN
TONiJcQ0BJ+oQaVVC3vminYD6Awle3wSReKcmteyBu6IHBdFU7KAUjeZA8uIOengLYPl9CIKPVQH
k9xGcuhofPvzbSRZNqp0RhVOqt53nU9Rtay9i2PSk/dH+fQ1oSDVwk9mBv33gzV6bSgQtw7P2pjs
LhNGZ6aPt8x+V+JvRn+5uDl+ey9Cu4HddfPF89WK6CtgP9SCWbCBLPnfZ/CL69h+Z6yj4RB3EFry
qejo+dhbX6w86Moa8M3skgEAy9R9c6wTPRVVXO9ftK+N+ALtWdbrXfC2nw/7Qu4QfqZlz23CIphG
NDXjhW3+uUi1gCtdZPnajSCL/bpwnMmyHbNWUFuHUIGxrqTc8cl0WddVlHquvdnvUXw20oBCbyvg
V0tzyVxfCG/PN9l24UMFkNFHjD58fixXg4HkupTZjAwNpAeasEsw6jTB8VffTH9QnY8jqzQRAcQI
qKhb0L9ZpYS41Xirh69zdA7D8KTqmq6aIinVzCU13FiaPQagBoroqNf88Q6f+6eMHYEQgE3g9Csf
9KCyBKCA074RxzVN5Kl2uMzav/UZu2vYlTEw0nk0+FFZ6fqJwFtMKApvkWDdjOZZnZhjhkUgr3zs
1sAsfFOU+RBdTuePFK6MyrNexU/t0HOf2DOFwy/Xpku29RSX/3IXiBfC4YTKRIibfT6FlBSrhLu6
yoJ/CWOGMvgTbVhGE2AYIWLqaudp8wIymuemefTNb8Y3xOIUsjOaJwc+Uzz3416MfXE65QCzEw21
HJyPivYvhy6O+d/C0f7lrgCxkNLp2OhWB5pZ/tfK3e8staYXvrjjS92qi37Vb5X1MNtj/hd9H7mU
ctlXgRBdoPu0+MukKY0B72CcFmwypaV1enYp7PKotamXRkNQ4iFldbzEdmo4dQWmBRfYlSfxIU72
yiaq3WI+1Ca+ooB2M4RfhBxr8VVS2TqhZ71aP9sHO51Frq4EAwZ1rz4jM+137mxA+yDyiLJhs2cZ
tE+8cOhhWQMiMPaCWUXsUCayqKqpnj2JWte8jn865RLjAPG+73JiPOr6V1RQvwJNj9R32DkbsW9m
c465yx60zzyXUtjov+e1mpMo6kyRq4n2NlS53NTiYGHzAxv3yoHwOdhyb0aGFzc2Rlv4WarMatrH
6CxO/ZSjPwGGgjowG0Mactht2AWJyEXGNaJCXJzqU5WFKCBTkFb1v1c8Z0aH/19phmroN6UEutYy
OCF49DSTcwCVWfu3iMqh4HyxRL6qSX8RLlfaoUBrBUUUH8PA/MFesQdzHaDz7X5o6Nly+hEu32YH
vDaNLroer8DIAHCQ37BsPM3MW8opOF1W3gHC+GO+L7QeMRU7tkaSFnIUEzeMVairsMH2iSMApaG1
pbc3qVGGP5f2g7sdT5tuQnwW7C+D2LcCfZUrg3WYTNHcZYBJAvyuQDaF5+ndYPgw6r/C+PuFiwUK
SMc+kfmzcFiJV/F55e4wp5u5yYTYW6T20vyW8Oqex1jYq2kMdXgMllEN7atRzEGXxHMSzAlIbT+Q
flx11i7AlGnWAKjXz3fDzOt//lyWrcQkr/1a6NwkIzIzsiSjVaFgLfO1IW+US0oVyHn7uxEyeCT7
XlyHzJQaE7VeuAbEhGUE1hbvPMld1H2Q6yON2pddV75XfJ7rrA9ZDEv/X4dxHRRxhiiLGKRwa44q
QAADULGLNpSQhsQ2yRsDKgw65u65ZMCECm8iOeqCHbKDb/Ayyk3P4apuCjxQ8JCv3Zz02yA/+A1q
qYsGeSripsPf+1oDuPSi3EZ1G0PK7gqgI9lj8nhlUEjAcRTUk/gcZtGf/usXL5GAXTcD5RsDGZfq
Yqs3qBXcBE8/c1ciEaqQa5+c7p2Bwi61JHFihTk8rDX50a7PhHb/tQNREurWBtCXiaO1OjSLAFIB
PPpzUNg2MQFcsmGXeUuOMwkDTiM5mkmaoXo/3kTmWoDsKKyfCwE9/4DC4vrm3uVmQGbAyKqtAsXw
aodxpodlpuICaREPbf79fl0b5eEqRriiPT2GQYBGrfZesxrBmRbe8rXid8DIg8eCNTKN4dJeljJs
hszODtsVT0aah1+GA7IxlKsXhk3bT9oLJr/TLRPIrglKAX82lsJ6DLwaAbgLu4MvTkzclqwFSwqt
4csfmn5gM9DSZw4LXAeP6SJFzabUQSR5RL8zsn9qI3jWXbxB0V/nxr5s0JMajfFSRivG4REtmINh
ZtSaD9kqh8fjAYdUCbv1lDpq+WMyPV1cdGHAc1v3CYoPzA8vm5RXQd773uHaTrDG/m9jXiOGDk5X
Vy77gBX5rfTo+OxO+lX8HcDv19HzZ6DvbgLesdCLxqXuEfrlWxVH/7AXXhxvluNkHld4Ybd/r3s3
f10vY7PnNdEW9TLPkK5UCPUtrXl16m2Iw+Wcq5+1T6srfTHDDGuTFYXl8iflopnTTtr11lhYBSoB
QWvcM+I6twZ4wqQ+o4l3t9/pz+NC/NMsc6g7McuNakz0hmNbWSkfUWSB18z/2wE8TVAMJGwpSj3G
qagLoPrlA/uv61MPJeAfS9xNQHG0dG+h17ikGXoMNZUYWpjd/6CGJ0wUyWo1O2jSXiHpFGsq1IlY
UTcWnNzdg6Ik32c6OK+Kh0fakHnEK4B/M0vN0rO4ozQIe0pk6lWkEWRLyQ08rRIpTO92OkJJ6nRq
lxPQhpZa/TRFX5ZOlJ8xg40EcDkxn0UTite316POyRv9aPvuUUkISYuy70ofbynm/Hy2gN2IV+Z8
46T7+UGP+o6fD56SzBNFKKxQ3saZEnXCarg4oi3bZTO8LQKblFtDuapVPdZdYbeYuIOlHDpvw0dz
eehT7MKO7Za0L7C7YapOJVjafK7P0HVfPHlQ5ddOWqX4T82kZD/4RL79ZzOgEpnVXD4fl6i/WY9w
4syoO94ddZ9SfiNFJdDihmxDDjjRAeUgjsA99/0mABd6Yjqwdf1F5SyYoC0oeFC/qjrgyTFXNR6i
x5yGLPOM3Pdpz4qmihbQudNf6CAtuPDbt0JrmYAD9uUOynkdi+4Hdeayk6JhWAEPJ7neWtSLb/3L
GevvhgJ3UhQSjonh1yLnFGiADwYhq/i0MQmPRAUUyiyiwjWyouJXIDOfKi9yiJPgtiQzAzLaQENo
7tIpR+McwlcyJ7jnY1vpljLCh02qa4GxqNaQ5avSTEPEjrjqOTx+QsV+NQx6BiNhyWB5iHG5ht7j
VB9dO/mH7URvIWa4eSb5Tjy9uB87NZx+IE9dwHlAEWG9md0UyNbsSliGY8ydRTW4VqLs3SRSP9oS
dPE7K3RviVTwPs78/hokpVLKluU6JSyppg9we2J0wcI+rE0k1ctR0EFN5CrYgUakcg56BhXwChHB
JUTYXpanHuOzJJsAr1wknlOWoVrrxyeY4lDYMSBz1J+a/2qYIos=
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
