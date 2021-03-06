
`timescale 1 ns / 1 ps

	module axi_slave_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 14
	)
	(
		// Users to add ports here
        input wire [16: 0]        fpga_img_id,
        input wire [9: 0]         epoch,
        input wire [16: 0]        num_correct_train,
        input wire [16: 0]        num_correct_test,
        input wire [31: 0]        idle_cycles,
        input wire [31: 0]        active_cycles,
        input wire [31: 0]        status_block,
        input wire [31: 0]        out0,
        input wire [31: 0]        out1,
        input wire [31: 0]        out2,
        input wire [31: 0]        out3,
        input wire [31: 0]        out4,      
        
        output wire               start,
        output wire [9: 0]        n_epochs,        
        output wire [4: 0]        lrate_shifts,
        output wire               training_mode,
        output wire [16: 0]       img_set_size,
        output wire [16: 0]       img1_id,
        output wire [9: 0]        img1_label,
        
        output wire  [31: 0]      img1_blk0,
        output wire  [31: 0]      img1_blk1,
        output wire  [31: 0]      img1_blk2,
        output wire  [31: 0]      img1_blk3,
        output wire  [31: 0]      img1_blk4,
        output wire  [31: 0]      img1_blk5,
        output wire  [31: 0]      img1_blk6,
        output wire  [31: 0]      img1_blk7,
        output wire  [31: 0]      img1_blk8,
        output wire  [31: 0]      img1_blk9,
        output wire  [31: 0]      img1_blk10,
        output wire  [31: 0]      img1_blk11,
        output wire  [31: 0]      img1_blk12,
        output wire  [31: 0]      img1_blk13,
        output wire  [31: 0]      img1_blk14,
        output wire  [31: 0]      img1_blk15,
        output wire  [31: 0]      img1_blk16,
        output wire  [31: 0]      img1_blk17,
        output wire  [31: 0]      img1_blk18,
        output wire  [31: 0]      img1_blk19,
        output wire  [31: 0]      img1_blk20,
        output wire  [31: 0]      img1_blk21,
        output wire  [31: 0]      img1_blk22,
        output wire  [31: 0]      img1_blk23,
        output wire  [31: 0]      img1_blk24,
        output wire  [31: 0]      img1_blk25,
        output wire  [31: 0]      img1_blk26,
        output wire  [31: 0]      img1_blk27,
        output wire  [31: 0]      img1_blk28,
        output wire  [31: 0]      img1_blk29,
        output wire  [31: 0]      img1_blk30,
        output wire  [31: 0]      img1_blk31,
        output wire  [31: 0]      img1_blk32,
        output wire  [31: 0]      img1_blk33,
        output wire  [31: 0]      img1_blk34,
        output wire  [31: 0]      img1_blk35,
        output wire  [31: 0]      img1_blk36,
        output wire  [31: 0]      img1_blk37,
        output wire  [31: 0]      img1_blk38,
        output wire  [31: 0]      img1_blk39,
        output wire  [31: 0]      img1_blk40,
        output wire  [31: 0]      img1_blk41,
        output wire  [31: 0]      img1_blk42,
        output wire  [31: 0]      img1_blk43,
        output wire  [31: 0]      img1_blk44,
        output wire  [31: 0]      img1_blk45,
        output wire  [31: 0]      img1_blk46,
        output wire  [31: 0]      img1_blk47,
        output wire  [31: 0]      img1_blk48,
        output wire  [31: 0]      img1_blk49,
        output wire  [31: 0]      img1_blk50,
        output wire  [31: 0]      img1_blk51,
        output wire  [31: 0]      img1_blk52,
        output wire  [31: 0]      img1_blk53,
        output wire  [31: 0]      img1_blk54,
        output wire  [31: 0]      img1_blk55,
        output wire  [31: 0]      img1_blk56,
        output wire  [31: 0]      img1_blk57,
        output wire  [31: 0]      img1_blk58,
        output wire  [31: 0]      img1_blk59,
        output wire  [31: 0]      img1_blk60,
        output wire  [31: 0]      img1_blk61,
        output wire  [31: 0]      img1_blk62,
        output wire  [31: 0]      img1_blk63,
        output wire  [31: 0]      img1_blk64,
        output wire  [31: 0]      img1_blk65,
        output wire  [31: 0]      img1_blk66,
        output wire  [31: 0]      img1_blk67,
        output wire  [31: 0]      img1_blk68,
        output wire  [31: 0]      img1_blk69,
        output wire  [31: 0]      img1_blk70,
        output wire  [31: 0]      img1_blk71,
        output wire  [31: 0]      img1_blk72,
        output wire  [31: 0]      img1_blk73,
        output wire  [31: 0]      img1_blk74,
        output wire  [31: 0]      img1_blk75,
        output wire  [31: 0]      img1_blk76,
        output wire  [31: 0]      img1_blk77,
        output wire  [31: 0]      img1_blk78,
        output wire  [31: 0]      img1_blk79,
        output wire  [31: 0]      img1_blk80,
        output wire  [31: 0]      img1_blk81,
        output wire  [31: 0]      img1_blk82,
        output wire  [31: 0]      img1_blk83,
        output wire  [31: 0]      img1_blk84,
        output wire  [31: 0]      img1_blk85,
        output wire  [31: 0]      img1_blk86,
        output wire  [31: 0]      img1_blk87,
        output wire  [31: 0]      img1_blk88,
        output wire  [31: 0]      img1_blk89,
        output wire  [31: 0]      img1_blk90,
        output wire  [31: 0]      img1_blk91,
        output wire  [31: 0]      img1_blk92,
        output wire  [31: 0]      img1_blk93,
        output wire  [31: 0]      img1_blk94,
        output wire  [31: 0]      img1_blk95,
        output wire  [31: 0]      img1_blk96,
        output wire  [31: 0]      img1_blk97,
        output wire  [31: 0]      img1_blk98,
        output wire  [31: 0]      img1_blk99,
        output wire  [31: 0]      img1_blk100,
        output wire  [31: 0]      img1_blk101,
        output wire  [31: 0]      img1_blk102,
        output wire  [31: 0]      img1_blk103,
        output wire  [31: 0]      img1_blk104,
        output wire  [31: 0]      img1_blk105,
        output wire  [31: 0]      img1_blk106,
        output wire  [31: 0]      img1_blk107,
        output wire  [31: 0]      img1_blk108,
        output wire  [31: 0]      img1_blk109,
        output wire  [31: 0]      img1_blk110,
        output wire  [31: 0]      img1_blk111,
        output wire  [31: 0]      img1_blk112,
        output wire  [31: 0]      img1_blk113,
        output wire  [31: 0]      img1_blk114,
        output wire  [31: 0]      img1_blk115,
        output wire  [31: 0]      img1_blk116,
        output wire  [31: 0]      img1_blk117,
        output wire  [31: 0]      img1_blk118,
        output wire  [31: 0]      img1_blk119,
        output wire  [31: 0]      img1_blk120,
        output wire  [31: 0]      img1_blk121,
        output wire  [31: 0]      img1_blk122,
        output wire  [31: 0]      img1_blk123,
        output wire  [31: 0]      img1_blk124,
        output wire  [31: 0]      img1_blk125,
        output wire  [31: 0]      img1_blk126,
        output wire  [31: 0]      img1_blk127,
        output wire  [31: 0]      img1_blk128,
        output wire  [31: 0]      img1_blk129,
        output wire  [31: 0]      img1_blk130,
        output wire  [31: 0]      img1_blk131,
        output wire  [31: 0]      img1_blk132,
        output wire  [31: 0]      img1_blk133,
        output wire  [31: 0]      img1_blk134,
        output wire  [31: 0]      img1_blk135,
        output wire  [31: 0]      img1_blk136,
        output wire  [31: 0]      img1_blk137,
        output wire  [31: 0]      img1_blk138,
        output wire  [31: 0]      img1_blk139,
        output wire  [31: 0]      img1_blk140,
        output wire  [31: 0]      img1_blk141,
        output wire  [31: 0]      img1_blk142,
        output wire  [31: 0]      img1_blk143,
        output wire  [31: 0]      img1_blk144,
        output wire  [31: 0]      img1_blk145,
        output wire  [31: 0]      img1_blk146,
        output wire  [31: 0]      img1_blk147,
        output wire  [31: 0]      img1_blk148,
        output wire  [31: 0]      img1_blk149,
        output wire  [31: 0]      img1_blk150,
        output wire  [31: 0]      img1_blk151,
        output wire  [31: 0]      img1_blk152,
        output wire  [31: 0]      img1_blk153,
        output wire  [31: 0]      img1_blk154,
        output wire  [31: 0]      img1_blk155,
        output wire  [31: 0]      img1_blk156,
        output wire  [31: 0]      img1_blk157,
        output wire  [31: 0]      img1_blk158,
        output wire  [31: 0]      img1_blk159,
        output wire  [31: 0]      img1_blk160,
        output wire  [31: 0]      img1_blk161,
        output wire  [31: 0]      img1_blk162,
        output wire  [31: 0]      img1_blk163,
        output wire  [31: 0]      img1_blk164,
        output wire  [31: 0]      img1_blk165,
        output wire  [31: 0]      img1_blk166,
        output wire  [31: 0]      img1_blk167,
        output wire  [31: 0]      img1_blk168,
        output wire  [31: 0]      img1_blk169,
        output wire  [31: 0]      img1_blk170,
        output wire  [31: 0]      img1_blk171,
        output wire  [31: 0]      img1_blk172,
        output wire  [31: 0]      img1_blk173,
        output wire  [31: 0]      img1_blk174,
        output wire  [31: 0]      img1_blk175,
        output wire  [31: 0]      img1_blk176,
        output wire  [31: 0]      img1_blk177,
        output wire  [31: 0]      img1_blk178,
        output wire  [31: 0]      img1_blk179,
        output wire  [31: 0]      img1_blk180,
        output wire  [31: 0]      img1_blk181,
        output wire  [31: 0]      img1_blk182,
        output wire  [31: 0]      img1_blk183,
        output wire  [31: 0]      img1_blk184,
        output wire  [31: 0]      img1_blk185,
        output wire  [31: 0]      img1_blk186,
        output wire  [31: 0]      img1_blk187,
        output wire  [31: 0]      img1_blk188,
        output wire  [31: 0]      img1_blk189,
        output wire  [31: 0]      img1_blk190,
        output wire  [31: 0]      img1_blk191,
        output wire  [31: 0]      img1_blk192,
        output wire  [31: 0]      img1_blk193,
        output wire  [31: 0]      img1_blk194,
        output wire  [31: 0]      img1_blk195,

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXI
		input wire  s00_axi_aclk,
		input wire  s00_axi_aresetn,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
		input wire [2 : 0] s00_axi_awprot,
		input wire  s00_axi_awvalid,
		output wire  s00_axi_awready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
		input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input wire  s00_axi_wvalid,
		output wire  s00_axi_wready,
		output wire [1 : 0] s00_axi_bresp,
		output wire  s00_axi_bvalid,
		input wire  s00_axi_bready,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
		input wire [2 : 0] s00_axi_arprot,
		input wire  s00_axi_arvalid,
		output wire  s00_axi_arready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
		output wire [1 : 0] s00_axi_rresp,
		output wire  s00_axi_rvalid,
		input wire  s00_axi_rready
	);
// Instantiation of Axi Bus Interface S00_AXI
	axi_slave_v1_0_S00_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) axi_slave_v1_0_S00_AXI_inst (
	    .fpga_img_id(fpga_img_id),
	    .epoch(epoch),
	    .num_correct_train(num_correct_train),
	    .num_correct_test(num_correct_test),
	    .idle_cycles(idle_cycles),
	    .active_cycles(active_cycles),
	    .status_block(status_block),
	    
	    .start(start),
	    .n_epochs(n_epochs),
	    .lrate_shifts(lrate_shifts),
	    .training_mode(training_mode),
	    .img_set_size(img_set_size),
	    .img1_id(img1_id),
	    .img1_label(img1_label),
	    .img1_blk0(img1_blk0),
	    .img1_blk1(img1_blk1),
	    .img1_blk2(img1_blk2),
	    .img1_blk3(img1_blk3),
	    .img1_blk4(img1_blk4),
	    .img1_blk5(img1_blk5),
	    .img1_blk6(img1_blk6),
	    .img1_blk7(img1_blk7),
	    .img1_blk8(img1_blk8),
	    .img1_blk9(img1_blk9),
	    .img1_blk10(img1_blk10),
	    .img1_blk11(img1_blk11),
	    .img1_blk12(img1_blk12),
	    .img1_blk13(img1_blk13),
	    .img1_blk14(img1_blk14),
	    .img1_blk15(img1_blk15),
	    .img1_blk16(img1_blk16),
	    .img1_blk17(img1_blk17),
	    .img1_blk18(img1_blk18),
	    .img1_blk19(img1_blk19),
	    .img1_blk20(img1_blk20),
	    .img1_blk21(img1_blk21),
	    .img1_blk22(img1_blk22),
	    .img1_blk23(img1_blk23),
	    .img1_blk24(img1_blk24),
	    .img1_blk25(img1_blk25),
	    .img1_blk26(img1_blk26),
	    .img1_blk27(img1_blk27),
	    .img1_blk28(img1_blk28),
	    .img1_blk29(img1_blk29),
	    .img1_blk30(img1_blk30),
	    .img1_blk31(img1_blk31),
	    .img1_blk32(img1_blk32),
	    .img1_blk33(img1_blk33),
	    .img1_blk34(img1_blk34),
	    .img1_blk35(img1_blk35),
	    .img1_blk36(img1_blk36),
	    .img1_blk37(img1_blk37),
	    .img1_blk38(img1_blk38),
	    .img1_blk39(img1_blk39),
	    .img1_blk40(img1_blk40),
	    .img1_blk41(img1_blk41),
	    .img1_blk42(img1_blk42),
	    .img1_blk43(img1_blk43),
	    .img1_blk44(img1_blk44),
	    .img1_blk45(img1_blk45),
	    .img1_blk46(img1_blk46),
	    .img1_blk47(img1_blk47),
	    .img1_blk48(img1_blk48),
	    .img1_blk49(img1_blk49),
	    .img1_blk50(img1_blk50),
	    .img1_blk51(img1_blk51),
	    .img1_blk52(img1_blk52),
	    .img1_blk53(img1_blk53),
	    .img1_blk54(img1_blk54),
	    .img1_blk55(img1_blk55),
	    .img1_blk56(img1_blk56),
	    .img1_blk57(img1_blk57),
	    .img1_blk58(img1_blk58),
	    .img1_blk59(img1_blk59),
	    .img1_blk60(img1_blk60),
	    .img1_blk61(img1_blk61),
	    .img1_blk62(img1_blk62),
	    .img1_blk63(img1_blk63),
	    .img1_blk64(img1_blk64),
	    .img1_blk65(img1_blk65),
	    .img1_blk66(img1_blk66),
	    .img1_blk67(img1_blk67),
	    .img1_blk68(img1_blk68),
	    .img1_blk69(img1_blk69),
	    .img1_blk70(img1_blk70),
	    .img1_blk71(img1_blk71),
	    .img1_blk72(img1_blk72),
	    .img1_blk73(img1_blk73),
	    .img1_blk74(img1_blk74),
	    .img1_blk75(img1_blk75),
	    .img1_blk76(img1_blk76),
	    .img1_blk77(img1_blk77),
	    .img1_blk78(img1_blk78),
	    .img1_blk79(img1_blk79),
	    .img1_blk80(img1_blk80),
	    .img1_blk81(img1_blk81),
	    .img1_blk82(img1_blk82),
	    .img1_blk83(img1_blk83),
	    .img1_blk84(img1_blk84),
	    .img1_blk85(img1_blk85),
	    .img1_blk86(img1_blk86),
	    .img1_blk87(img1_blk87),
	    .img1_blk88(img1_blk88),
	    .img1_blk89(img1_blk89),
	    .img1_blk90(img1_blk90),
	    .img1_blk91(img1_blk91),
	    .img1_blk92(img1_blk92),
	    .img1_blk93(img1_blk93),
	    .img1_blk94(img1_blk94),
	    .img1_blk95(img1_blk95),
	    .img1_blk96(img1_blk96),
	    .img1_blk97(img1_blk97),
	    .img1_blk98(img1_blk98),
	    .img1_blk99(img1_blk99),
	    .img1_blk100(img1_blk100),
	    .img1_blk101(img1_blk101),
	    .img1_blk102(img1_blk102),
	    .img1_blk103(img1_blk103),
	    .img1_blk104(img1_blk104),
	    .img1_blk105(img1_blk105),
	    .img1_blk106(img1_blk106),
	    .img1_blk107(img1_blk107),
	    .img1_blk108(img1_blk108),
	    .img1_blk109(img1_blk109),
	    .img1_blk110(img1_blk110),
	    .img1_blk111(img1_blk111),
	    .img1_blk112(img1_blk112),
	    .img1_blk113(img1_blk113),
	    .img1_blk114(img1_blk114),
	    .img1_blk115(img1_blk115),
	    .img1_blk116(img1_blk116),
	    .img1_blk117(img1_blk117),
	    .img1_blk118(img1_blk118),
	    .img1_blk119(img1_blk119),
	    .img1_blk120(img1_blk120),
	    .img1_blk121(img1_blk121),
	    .img1_blk122(img1_blk122),
	    .img1_blk123(img1_blk123),
	    .img1_blk124(img1_blk124),
	    .img1_blk125(img1_blk125),
	    .img1_blk126(img1_blk126),
	    .img1_blk127(img1_blk127),
	    .img1_blk128(img1_blk128),
	    .img1_blk129(img1_blk129),
	    .img1_blk130(img1_blk130),
	    .img1_blk131(img1_blk131),
	    .img1_blk132(img1_blk132),
	    .img1_blk133(img1_blk133),
	    .img1_blk134(img1_blk134),
	    .img1_blk135(img1_blk135),
	    .img1_blk136(img1_blk136),
	    .img1_blk137(img1_blk137),
	    .img1_blk138(img1_blk138),
	    .img1_blk139(img1_blk139),
	    .img1_blk140(img1_blk140),
	    .img1_blk141(img1_blk141),
	    .img1_blk142(img1_blk142),
	    .img1_blk143(img1_blk143),
	    .img1_blk144(img1_blk144),
	    .img1_blk145(img1_blk145),
	    .img1_blk146(img1_blk146),
	    .img1_blk147(img1_blk147),
	    .img1_blk148(img1_blk148),
	    .img1_blk149(img1_blk149),
	    .img1_blk150(img1_blk150),
	    .img1_blk151(img1_blk151),
	    .img1_blk152(img1_blk152),
	    .img1_blk153(img1_blk153),
	    .img1_blk154(img1_blk154),
	    .img1_blk155(img1_blk155),
	    .img1_blk156(img1_blk156),
	    .img1_blk157(img1_blk157),
	    .img1_blk158(img1_blk158),
	    .img1_blk159(img1_blk159),
	    .img1_blk160(img1_blk160),
	    .img1_blk161(img1_blk161),
	    .img1_blk162(img1_blk162),
	    .img1_blk163(img1_blk163),
	    .img1_blk164(img1_blk164),
	    .img1_blk165(img1_blk165),
	    .img1_blk166(img1_blk166),
	    .img1_blk167(img1_blk167),
	    .img1_blk168(img1_blk168),
	    .img1_blk169(img1_blk169),
	    .img1_blk170(img1_blk170),
	    .img1_blk171(img1_blk171),
	    .img1_blk172(img1_blk172),
	    .img1_blk173(img1_blk173),
	    .img1_blk174(img1_blk174),
	    .img1_blk175(img1_blk175),
	    .img1_blk176(img1_blk176),
	    .img1_blk177(img1_blk177),
	    .img1_blk178(img1_blk178),
	    .img1_blk179(img1_blk179),
	    .img1_blk180(img1_blk180),
	    .img1_blk181(img1_blk181),
	    .img1_blk182(img1_blk182),
	    .img1_blk183(img1_blk183),
	    .img1_blk184(img1_blk184),
	    .img1_blk185(img1_blk185),
	    .img1_blk186(img1_blk186),
	    .img1_blk187(img1_blk187),
	    .img1_blk188(img1_blk188),
	    .img1_blk189(img1_blk189),
	    .img1_blk190(img1_blk190),
	    .img1_blk191(img1_blk191),
	    .img1_blk192(img1_blk192),
	    .img1_blk193(img1_blk193),
	    .img1_blk194(img1_blk194),
	    .img1_blk195(img1_blk195),
	    .out0(out0),
	    .out1(out1),
	    .out2(out2),
	    .out3(out3),
	    .out4(out4),


		.S_AXI_ACLK(s00_axi_aclk),
		.S_AXI_ARESETN(s00_axi_aresetn),
		.S_AXI_AWADDR(s00_axi_awaddr),
		.S_AXI_AWPROT(s00_axi_awprot),
		.S_AXI_AWVALID(s00_axi_awvalid),
		.S_AXI_AWREADY(s00_axi_awready),
		.S_AXI_WDATA(s00_axi_wdata),
		.S_AXI_WSTRB(s00_axi_wstrb),
		.S_AXI_WVALID(s00_axi_wvalid),
		.S_AXI_WREADY(s00_axi_wready),
		.S_AXI_BRESP(s00_axi_bresp),
		.S_AXI_BVALID(s00_axi_bvalid),
		.S_AXI_BREADY(s00_axi_bready),
		.S_AXI_ARADDR(s00_axi_araddr),
		.S_AXI_ARPROT(s00_axi_arprot),
		.S_AXI_ARVALID(s00_axi_arvalid),
		.S_AXI_ARREADY(s00_axi_arready),
		.S_AXI_RDATA(s00_axi_rdata),
		.S_AXI_RRESP(s00_axi_rresp),
		.S_AXI_RVALID(s00_axi_rvalid),
		.S_AXI_RREADY(s00_axi_rready)
	);

	// Add user logic here

	// User logic ends

	endmodule
