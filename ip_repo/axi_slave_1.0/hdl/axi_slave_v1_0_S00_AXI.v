
`timescale 1 ns / 1 ps

	module axi_slave_v1_0_S00_AXI #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line

		// Width of S_AXI data bus
		parameter integer C_S_AXI_DATA_WIDTH	= 32,
		// Width of S_AXI address bus
		parameter integer C_S_AXI_ADDR_WIDTH	= 14
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
        
        output reg                start,
        output reg  [9: 0]        n_epochs,        
        output reg  [4: 0]        lrate_shifts,
        output reg                training_mode,
        output reg  [16: 0]       img_set_size,
        output reg  [16: 0]       img1_id,
        output reg  [9: 0]        img1_label,
        output reg  [31: 0]       img1_blk0,
        output reg  [31: 0]       img1_blk1,
        output reg  [31: 0]       img1_blk2,
        output reg  [31: 0]       img1_blk3,
        output reg  [31: 0]       img1_blk4,
        output reg  [31: 0]       img1_blk5,
        output reg  [31: 0]       img1_blk6,
        output reg  [31: 0]       img1_blk7,
        output reg  [31: 0]       img1_blk8,
        output reg  [31: 0]       img1_blk9,
        output reg  [31: 0]       img1_blk10,
        output reg  [31: 0]       img1_blk11,
        output reg  [31: 0]       img1_blk12,
        output reg  [31: 0]       img1_blk13,
        output reg  [31: 0]       img1_blk14,
        output reg  [31: 0]       img1_blk15,
        output reg  [31: 0]       img1_blk16,
        output reg  [31: 0]       img1_blk17,
        output reg  [31: 0]       img1_blk18,
        output reg  [31: 0]       img1_blk19,
        output reg  [31: 0]       img1_blk20,
        output reg  [31: 0]       img1_blk21,
        output reg  [31: 0]       img1_blk22,
        output reg  [31: 0]       img1_blk23,
        output reg  [31: 0]       img1_blk24,
        output reg  [31: 0]       img1_blk25,
        output reg  [31: 0]       img1_blk26,
        output reg  [31: 0]       img1_blk27,
        output reg  [31: 0]       img1_blk28,
        output reg  [31: 0]       img1_blk29,
        output reg  [31: 0]       img1_blk30,
        output reg  [31: 0]       img1_blk31,
        output reg  [31: 0]       img1_blk32,
        output reg  [31: 0]       img1_blk33,
        output reg  [31: 0]       img1_blk34,
        output reg  [31: 0]       img1_blk35,
        output reg  [31: 0]       img1_blk36,
        output reg  [31: 0]       img1_blk37,
        output reg  [31: 0]       img1_blk38,
        output reg  [31: 0]       img1_blk39,
        output reg  [31: 0]       img1_blk40,
        output reg  [31: 0]       img1_blk41,
        output reg  [31: 0]       img1_blk42,
        output reg  [31: 0]       img1_blk43,
        output reg  [31: 0]       img1_blk44,
        output reg  [31: 0]       img1_blk45,
        output reg  [31: 0]       img1_blk46,
        output reg  [31: 0]       img1_blk47,
        output reg  [31: 0]       img1_blk48,
        output reg  [31: 0]       img1_blk49,
        output reg  [31: 0]       img1_blk50,
        output reg  [31: 0]       img1_blk51,
        output reg  [31: 0]       img1_blk52,
        output reg  [31: 0]       img1_blk53,
        output reg  [31: 0]       img1_blk54,
        output reg  [31: 0]       img1_blk55,
        output reg  [31: 0]       img1_blk56,
        output reg  [31: 0]       img1_blk57,
        output reg  [31: 0]       img1_blk58,
        output reg  [31: 0]       img1_blk59,
        output reg  [31: 0]       img1_blk60,
        output reg  [31: 0]       img1_blk61,
        output reg  [31: 0]       img1_blk62,
        output reg  [31: 0]       img1_blk63,
        output reg  [31: 0]       img1_blk64,
        output reg  [31: 0]       img1_blk65,
        output reg  [31: 0]       img1_blk66,
        output reg  [31: 0]       img1_blk67,
        output reg  [31: 0]       img1_blk68,
        output reg  [31: 0]       img1_blk69,
        output reg  [31: 0]       img1_blk70,
        output reg  [31: 0]       img1_blk71,
        output reg  [31: 0]       img1_blk72,
        output reg  [31: 0]       img1_blk73,
        output reg  [31: 0]       img1_blk74,
        output reg  [31: 0]       img1_blk75,
        output reg  [31: 0]       img1_blk76,
        output reg  [31: 0]       img1_blk77,
        output reg  [31: 0]       img1_blk78,
        output reg  [31: 0]       img1_blk79,
        output reg  [31: 0]       img1_blk80,
        output reg  [31: 0]       img1_blk81,
        output reg  [31: 0]       img1_blk82,
        output reg  [31: 0]       img1_blk83,
        output reg  [31: 0]       img1_blk84,
        output reg  [31: 0]       img1_blk85,
        output reg  [31: 0]       img1_blk86,
        output reg  [31: 0]       img1_blk87,
        output reg  [31: 0]       img1_blk88,
        output reg  [31: 0]       img1_blk89,
        output reg  [31: 0]       img1_blk90,
        output reg  [31: 0]       img1_blk91,
        output reg  [31: 0]       img1_blk92,
        output reg  [31: 0]       img1_blk93,
        output reg  [31: 0]       img1_blk94,
        output reg  [31: 0]       img1_blk95,
        output reg  [31: 0]       img1_blk96,
        output reg  [31: 0]       img1_blk97,
        output reg  [31: 0]       img1_blk98,
        output reg  [31: 0]       img1_blk99,
        output reg  [31: 0]       img1_blk100,
        output reg  [31: 0]       img1_blk101,
        output reg  [31: 0]       img1_blk102,
        output reg  [31: 0]       img1_blk103,
        output reg  [31: 0]       img1_blk104,
        output reg  [31: 0]       img1_blk105,
        output reg  [31: 0]       img1_blk106,
        output reg  [31: 0]       img1_blk107,
        output reg  [31: 0]       img1_blk108,
        output reg  [31: 0]       img1_blk109,
        output reg  [31: 0]       img1_blk110,
        output reg  [31: 0]       img1_blk111,
        output reg  [31: 0]       img1_blk112,
        output reg  [31: 0]       img1_blk113,
        output reg  [31: 0]       img1_blk114,
        output reg  [31: 0]       img1_blk115,
        output reg  [31: 0]       img1_blk116,
        output reg  [31: 0]       img1_blk117,
        output reg  [31: 0]       img1_blk118,
        output reg  [31: 0]       img1_blk119,
        output reg  [31: 0]       img1_blk120,
        output reg  [31: 0]       img1_blk121,
        output reg  [31: 0]       img1_blk122,
        output reg  [31: 0]       img1_blk123,
        output reg  [31: 0]       img1_blk124,
        output reg  [31: 0]       img1_blk125,
        output reg  [31: 0]       img1_blk126,
        output reg  [31: 0]       img1_blk127,
        output reg  [31: 0]       img1_blk128,
        output reg  [31: 0]       img1_blk129,
        output reg  [31: 0]       img1_blk130,
        output reg  [31: 0]       img1_blk131,
        output reg  [31: 0]       img1_blk132,
        output reg  [31: 0]       img1_blk133,
        output reg  [31: 0]       img1_blk134,
        output reg  [31: 0]       img1_blk135,
        output reg  [31: 0]       img1_blk136,
        output reg  [31: 0]       img1_blk137,
        output reg  [31: 0]       img1_blk138,
        output reg  [31: 0]       img1_blk139,
        output reg  [31: 0]       img1_blk140,
        output reg  [31: 0]       img1_blk141,
        output reg  [31: 0]       img1_blk142,
        output reg  [31: 0]       img1_blk143,
        output reg  [31: 0]       img1_blk144,
        output reg  [31: 0]       img1_blk145,
        output reg  [31: 0]       img1_blk146,
        output reg  [31: 0]       img1_blk147,
        output reg  [31: 0]       img1_blk148,
        output reg  [31: 0]       img1_blk149,
        output reg  [31: 0]       img1_blk150,
        output reg  [31: 0]       img1_blk151,
        output reg  [31: 0]       img1_blk152,
        output reg  [31: 0]       img1_blk153,
        output reg  [31: 0]       img1_blk154,
        output reg  [31: 0]       img1_blk155,
        output reg  [31: 0]       img1_blk156,
        output reg  [31: 0]       img1_blk157,
        output reg  [31: 0]       img1_blk158,
        output reg  [31: 0]       img1_blk159,
        output reg  [31: 0]       img1_blk160,
        output reg  [31: 0]       img1_blk161,
        output reg  [31: 0]       img1_blk162,
        output reg  [31: 0]       img1_blk163,
        output reg  [31: 0]       img1_blk164,
        output reg  [31: 0]       img1_blk165,
        output reg  [31: 0]       img1_blk166,
        output reg  [31: 0]       img1_blk167,
        output reg  [31: 0]       img1_blk168,
        output reg  [31: 0]       img1_blk169,
        output reg  [31: 0]       img1_blk170,
        output reg  [31: 0]       img1_blk171,
        output reg  [31: 0]       img1_blk172,
        output reg  [31: 0]       img1_blk173,
        output reg  [31: 0]       img1_blk174,
        output reg  [31: 0]       img1_blk175,
        output reg  [31: 0]       img1_blk176,
        output reg  [31: 0]       img1_blk177,
        output reg  [31: 0]       img1_blk178,
        output reg  [31: 0]       img1_blk179,
        output reg  [31: 0]       img1_blk180,
        output reg  [31: 0]       img1_blk181,
        output reg  [31: 0]       img1_blk182,
        output reg  [31: 0]       img1_blk183,
        output reg  [31: 0]       img1_blk184,
        output reg  [31: 0]       img1_blk185,
        output reg  [31: 0]       img1_blk186,
        output reg  [31: 0]       img1_blk187,
        output reg  [31: 0]       img1_blk188,
        output reg  [31: 0]       img1_blk189,
        output reg  [31: 0]       img1_blk190,
        output reg  [31: 0]       img1_blk191,
        output reg  [31: 0]       img1_blk192,
        output reg  [31: 0]       img1_blk193,
        output reg  [31: 0]       img1_blk194,
        output reg  [31: 0]       img1_blk195,

		// User ports ends
		// Do not modify the ports beyond this line

		// Global Clock Signal
		input wire  S_AXI_ACLK,
		// Global Reset Signal. This Signal is Active LOW
		input wire  S_AXI_ARESETN,
		// Write address (issued by master, acceped by Slave)
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR,
		// Write channel Protection type. This signal indicates the
    		// privilege and security level of the transaction, and whether
    		// the transaction is a data access or an instruction access.
		input wire [2 : 0] S_AXI_AWPROT,
		// Write address valid. This signal indicates that the master signaling
    		// valid write address and control information.
		input wire  S_AXI_AWVALID,
		// Write address ready. This signal indicates that the slave is ready
    		// to accept an address and associated control signals.
		output wire  S_AXI_AWREADY,
		// Write data (issued by master, acceped by Slave) 
		input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA,
		// Write strobes. This signal indicates which byte lanes hold
    		// valid data. There is one write strobe bit for each eight
    		// bits of the write data bus.    
		input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
		// Write valid. This signal indicates that valid write
    		// data and strobes are available.
		input wire  S_AXI_WVALID,
		// Write ready. This signal indicates that the slave
    		// can accept the write data.
		output wire  S_AXI_WREADY,
		// Write response. This signal indicates the status
    		// of the write transaction.
		output wire [1 : 0] S_AXI_BRESP,
		// Write response valid. This signal indicates that the channel
    		// is signaling a valid write response.
		output wire  S_AXI_BVALID,
		// Response ready. This signal indicates that the master
    		// can accept a write response.
		input wire  S_AXI_BREADY,
		// Read address (issued by master, acceped by Slave)
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR,
		// Protection type. This signal indicates the privilege
    		// and security level of the transaction, and whether the
    		// transaction is a data access or an instruction access.
		input wire [2 : 0] S_AXI_ARPROT,
		// Read address valid. This signal indicates that the channel
    		// is signaling valid read address and control information.
		input wire  S_AXI_ARVALID,
		// Read address ready. This signal indicates that the slave is
    		// ready to accept an address and associated control signals.
		output wire  S_AXI_ARREADY,
		// Read data (issued by slave)
		output wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA,
		// Read response. This signal indicates the status of the
    		// read transfer.
		output wire [1 : 0] S_AXI_RRESP,
		// Read valid. This signal indicates that the channel is
    		// signaling the required read data.
		output wire  S_AXI_RVALID,
		// Read ready. This signal indicates that the master can
    		// accept the read data and response information.
		input wire  S_AXI_RREADY
	);

	// AXI4LITE signals
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_awaddr;
	reg  	axi_awready;
	reg  	axi_wready;
	reg [1 : 0] 	axi_bresp;
	reg  	axi_bvalid;
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_araddr;
	reg  	axi_arready;
	reg [C_S_AXI_DATA_WIDTH-1 : 0] 	axi_rdata;
	reg [1 : 0] 	axi_rresp;
	reg  	axi_rvalid;

	// Example-specific design signals
	// local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
	// ADDR_LSB is used for addressing 32/64 bit registers/memories
	// ADDR_LSB = 2 for 32 bits (n downto 2)
	// ADDR_LSB = 3 for 64 bits (n downto 3)
	localparam integer ADDR_LSB = (C_S_AXI_DATA_WIDTH/32) + 1;
	localparam integer ADDR_MSB = 13;

	
	
	wire	 slv_reg_rden;
	wire	 slv_reg_wren;
	reg [C_S_AXI_DATA_WIDTH-1:0]	 reg_data_out;
	integer	 byte_index;
	reg	 aw_en;

	// I/O Connections assignments

	assign S_AXI_AWREADY	= axi_awready;
	assign S_AXI_WREADY	= axi_wready;
	assign S_AXI_BRESP	= axi_bresp;
	assign S_AXI_BVALID	= axi_bvalid;
	assign S_AXI_ARREADY	= axi_arready;
	assign S_AXI_RDATA	= axi_rdata;
	assign S_AXI_RRESP	= axi_rresp;
	assign S_AXI_RVALID	= axi_rvalid;
	// Implement axi_awready generation
	// axi_awready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_awready is
	// de-asserted when reset is low.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awready <= 1'b0;
	      aw_en <= 1'b1;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && aw_en)
	        begin
	          // slave is ready to accept write address when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
	          axi_awready <= 1'b1;
	          aw_en <= 1'b0;
	        end
	        else if (S_AXI_BREADY && axi_bvalid)
	            begin
	              aw_en <= 1'b1;
	              axi_awready <= 1'b0;
	            end
	      else           
	        begin
	          axi_awready <= 1'b0;
	        end
	    end 
	end       

	// Implement axi_awaddr latching
	// This process is used to latch the address when both 
	// S_AXI_AWVALID and S_AXI_WVALID are valid. 

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awaddr <= 0;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && aw_en)
	        begin
	          // Write Address latching 
	          axi_awaddr <= S_AXI_AWADDR;
	        end
	    end 
	end       

	// Implement axi_wready generation
	// axi_wready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is 
	// de-asserted when reset is low. 

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_wready <= 1'b0;
	    end 
	  else
	    begin    
	      if (~axi_wready && S_AXI_WVALID && S_AXI_AWVALID && aw_en )
	        begin
	          // slave is ready to accept write data when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
	          axi_wready <= 1'b1;
	        end
	      else
	        begin
	          axi_wready <= 1'b0;
	        end
	    end 
	end       

	// Implement memory mapped register select and write logic generation
	// The write data is accepted and written to memory mapped registers when
	// axi_awready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted. Write strobes are used to
	// select byte enables of slave registers while writing.
	// These registers are cleared when reset (active low) is applied.
	// Slave register write enable is asserted when valid address and data are available
	// and the slave is ready to accept the write address and write data.
	assign slv_reg_wren = axi_wready && S_AXI_WVALID && axi_awready && S_AXI_AWVALID;
	
	

	
	always @( posedge S_AXI_ACLK )
	begin 
	if ( S_AXI_ARESETN == 1'b0 )
      begin
          start        <= 0;
          n_epochs     <= 0;
          lrate_shifts <= 5'h6;
          training_mode <= 1'b0;
          img_set_size <= 17'd59999;
          img1_id      <= 0;
          img1_label   <= 0;
	      img1_blk0    <= 0;
	      img1_blk1    <= 0;
	      img1_blk2    <= 0;
	      img1_blk3    <= 0;
	      img1_blk4    <= 0;
	      img1_blk5    <= 0;
	      img1_blk6    <= 0;
	      img1_blk7    <= 0;
	      img1_blk8    <= 0;
	      img1_blk9    <= 0;
	      img1_blk10    <= 0;
	      img1_blk11    <= 0;
	      img1_blk12    <= 0;
	      img1_blk13    <= 0;
	      img1_blk14    <= 0;
	      img1_blk15    <= 0;
	      img1_blk16    <= 0;
	      img1_blk17    <= 0;
	      img1_blk18    <= 0;
	      img1_blk19    <= 0;
	      img1_blk20    <= 0;
	      img1_blk21    <= 0;
	      img1_blk22    <= 0;
	      img1_blk23    <= 0;
	      img1_blk24    <= 0;
	      img1_blk25    <= 0;
	      img1_blk26    <= 0;
	      img1_blk27    <= 0;
	      img1_blk28    <= 0;
	      img1_blk29    <= 0;
	      img1_blk30    <= 0;
	      img1_blk31    <= 0;
	      img1_blk32    <= 0;
	      img1_blk33    <= 0;
	      img1_blk34    <= 0;
	      img1_blk35    <= 0;
	      img1_blk36    <= 0;
	      img1_blk37    <= 0;
	      img1_blk38    <= 0;
	      img1_blk39    <= 0;
	      img1_blk40    <= 0;
	      img1_blk41    <= 0;
	      img1_blk42    <= 0;
	      img1_blk43    <= 0;
	      img1_blk44    <= 0;
	      img1_blk45    <= 0;
	      img1_blk46    <= 0;
	      img1_blk47    <= 0;
	      img1_blk48    <= 0;
	      img1_blk49    <= 0;
	      img1_blk50    <= 0;
	      img1_blk51    <= 0;
	      img1_blk52    <= 0;
	      img1_blk53    <= 0;
	      img1_blk54    <= 0;
	      img1_blk55    <= 0;
	      img1_blk56    <= 0;
	      img1_blk57    <= 0;
	      img1_blk58    <= 0;
	      img1_blk59    <= 0;
	      img1_blk60    <= 0;
	      img1_blk61    <= 0;
	      img1_blk62    <= 0;
	      img1_blk63    <= 0;
	      img1_blk64    <= 0;
	      img1_blk65    <= 0;
	      img1_blk66    <= 0;
	      img1_blk67    <= 0;
	      img1_blk68    <= 0;
	      img1_blk69    <= 0;
	      img1_blk70    <= 0;
	      img1_blk71    <= 0;
	      img1_blk72    <= 0;
	      img1_blk73    <= 0;
	      img1_blk74    <= 0;
	      img1_blk75    <= 0;
	      img1_blk76    <= 0;
	      img1_blk77    <= 0;
	      img1_blk78    <= 0;
	      img1_blk79    <= 0;
	      img1_blk80    <= 0;
	      img1_blk81    <= 0;
	      img1_blk82    <= 0;
	      img1_blk83    <= 0;
	      img1_blk84    <= 0;
	      img1_blk85    <= 0;
	      img1_blk86    <= 0;
	      img1_blk87    <= 0;
	      img1_blk88    <= 0;
	      img1_blk89    <= 0;
	      img1_blk90    <= 0;
	      img1_blk91    <= 0;
	      img1_blk92    <= 0;
	      img1_blk93    <= 0;
	      img1_blk94    <= 0;
	      img1_blk95    <= 0;
	      img1_blk96    <= 0;
	      img1_blk97    <= 0;
	      img1_blk98    <= 0;
	      img1_blk99    <= 0;
	      img1_blk100    <= 0;
	      img1_blk101    <= 0;
	      img1_blk102    <= 0;
	      img1_blk103    <= 0;
	      img1_blk104    <= 0;
	      img1_blk105    <= 0;
	      img1_blk106    <= 0;
	      img1_blk107    <= 0;
	      img1_blk108    <= 0;
	      img1_blk109    <= 0;
	      img1_blk110    <= 0;
	      img1_blk111    <= 0;
	      img1_blk112    <= 0;
	      img1_blk113    <= 0;
	      img1_blk114    <= 0;
	      img1_blk115    <= 0;
	      img1_blk116    <= 0;
	      img1_blk117    <= 0;
	      img1_blk118    <= 0;
	      img1_blk119    <= 0;
	      img1_blk120    <= 0;
	      img1_blk121    <= 0;
	      img1_blk122    <= 0;
	      img1_blk123    <= 0;
	      img1_blk124    <= 0;
	      img1_blk125    <= 0;
	      img1_blk126    <= 0;
	      img1_blk127    <= 0;
	      img1_blk128    <= 0;
	      img1_blk129    <= 0;
	      img1_blk130    <= 0;
	      img1_blk131    <= 0;
	      img1_blk132    <= 0;
	      img1_blk133    <= 0;
	      img1_blk134    <= 0;
	      img1_blk135    <= 0;
	      img1_blk136    <= 0;
	      img1_blk137    <= 0;
	      img1_blk138    <= 0;
	      img1_blk139    <= 0;
	      img1_blk140    <= 0;
	      img1_blk141    <= 0;
	      img1_blk142    <= 0;
	      img1_blk143    <= 0;
	      img1_blk144    <= 0;
	      img1_blk145    <= 0;
	      img1_blk146    <= 0;
	      img1_blk147    <= 0;
	      img1_blk148    <= 0;
	      img1_blk149    <= 0;
	      img1_blk150    <= 0;
	      img1_blk151    <= 0;
	      img1_blk152    <= 0;
	      img1_blk153    <= 0;
	      img1_blk154    <= 0;
	      img1_blk155    <= 0;
	      img1_blk156    <= 0;
	      img1_blk157    <= 0;
	      img1_blk158    <= 0;
	      img1_blk159    <= 0;
	      img1_blk160    <= 0;
	      img1_blk161    <= 0;
	      img1_blk162    <= 0;
	      img1_blk163    <= 0;
	      img1_blk164    <= 0;
	      img1_blk165    <= 0;
	      img1_blk166    <= 0;
	      img1_blk167    <= 0;
	      img1_blk168    <= 0;
	      img1_blk169    <= 0;
	      img1_blk170    <= 0;
	      img1_blk171    <= 0;
	      img1_blk172    <= 0;
	      img1_blk173    <= 0;
	      img1_blk174    <= 0;
	      img1_blk175    <= 0;
	      img1_blk176    <= 0;
	      img1_blk177    <= 0;
	      img1_blk178    <= 0;
	      img1_blk179    <= 0;
	      img1_blk180    <= 0;
	      img1_blk181    <= 0;
	      img1_blk182    <= 0;
	      img1_blk183    <= 0;
	      img1_blk184    <= 0;
	      img1_blk185    <= 0;
	      img1_blk186    <= 0;
	      img1_blk187    <= 0;
	      img1_blk188    <= 0;
	      img1_blk189    <= 0;
	      img1_blk190    <= 0;
	      img1_blk191    <= 0;
	      img1_blk192    <= 0;
	      img1_blk193    <= 0;
	      img1_blk194    <= 0;
	      img1_blk195    <= 0;
         
      end
    else
      if (slv_reg_wren)
      begin
        case ( axi_awaddr[ADDR_MSB:ADDR_LSB] )
          12'd7:
            start               <= S_AXI_WDATA[0];
          12'd8:
            n_epochs            <= S_AXI_WDATA[9: 0];
          12'd9:
            lrate_shifts        <= S_AXI_WDATA[4: 0];
          12'd10:
            training_mode       <= S_AXI_WDATA;
          12'd11: 
            img_set_size	    <= S_AXI_WDATA[16: 0];
          12'd12:
            img1_id             <= S_AXI_WDATA[16: 0];
          12'd13:
            img1_label          <= S_AXI_WDATA[9: 0];
          12'd14: 
            img1_blk0[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd15: 
            img1_blk1[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd16: 
            img1_blk2[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd17: 
            img1_blk3[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd18: 
            img1_blk4[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd19: 
            img1_blk5[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd20: 
            img1_blk6[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd21: 
            img1_blk7[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd22: 
            img1_blk8[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd23: 
            img1_blk9[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd24: 
            img1_blk10[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd25: 
            img1_blk11[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd26: 
            img1_blk12[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd27: 
            img1_blk13[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd28: 
            img1_blk14[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd29: 
            img1_blk15[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd30: 
            img1_blk16[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd31: 
            img1_blk17[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd32: 
            img1_blk18[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd33: 
            img1_blk19[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd34: 
            img1_blk20[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd35: 
            img1_blk21[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd36: 
            img1_blk22[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd37: 
            img1_blk23[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd38: 
            img1_blk24[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd39: 
            img1_blk25[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd40: 
            img1_blk26[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd41: 
            img1_blk27[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd42: 
            img1_blk28[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd43: 
            img1_blk29[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd44: 
            img1_blk30[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd45: 
            img1_blk31[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd46: 
            img1_blk32[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd47: 
            img1_blk33[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd48: 
            img1_blk34[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd49: 
            img1_blk35[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd50: 
            img1_blk36[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd51: 
            img1_blk37[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd52: 
            img1_blk38[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd53: 
            img1_blk39[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd54: 
            img1_blk40[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd55: 
            img1_blk41[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd56: 
            img1_blk42[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd57: 
            img1_blk43[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd58: 
            img1_blk44[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd59: 
            img1_blk45[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd60: 
            img1_blk46[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd61: 
            img1_blk47[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd62: 
            img1_blk48[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd63: 
            img1_blk49[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd64: 
            img1_blk50[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd65: 
            img1_blk51[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd66: 
            img1_blk52[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd67: 
            img1_blk53[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd68: 
            img1_blk54[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd69: 
            img1_blk55[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd70: 
            img1_blk56[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd71: 
            img1_blk57[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd72: 
            img1_blk58[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd73: 
            img1_blk59[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd74: 
            img1_blk60[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd75: 
            img1_blk61[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd76: 
            img1_blk62[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd77: 
            img1_blk63[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd78: 
            img1_blk64[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd79: 
            img1_blk65[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd80: 
            img1_blk66[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd81: 
            img1_blk67[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd82: 
            img1_blk68[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd83: 
            img1_blk69[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd84: 
            img1_blk70[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd85: 
            img1_blk71[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd86: 
            img1_blk72[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd87: 
            img1_blk73[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd88: 
            img1_blk74[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd89: 
            img1_blk75[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd90: 
            img1_blk76[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd91: 
            img1_blk77[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd92: 
            img1_blk78[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd93: 
            img1_blk79[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd94: 
            img1_blk80[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd95: 
            img1_blk81[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd96: 
            img1_blk82[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd97: 
            img1_blk83[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd98: 
            img1_blk84[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd99: 
            img1_blk85[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd100: 
            img1_blk86[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd101: 
            img1_blk87[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd102: 
            img1_blk88[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd103: 
            img1_blk89[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd104: 
            img1_blk90[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd105: 
            img1_blk91[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd106: 
            img1_blk92[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd107: 
            img1_blk93[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd108: 
            img1_blk94[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd109: 
            img1_blk95[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd110: 
            img1_blk96[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd111: 
            img1_blk97[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd112: 
            img1_blk98[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd113: 
            img1_blk99[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd114: 
            img1_blk100[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd115: 
            img1_blk101[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd116: 
            img1_blk102[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd117: 
            img1_blk103[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd118: 
            img1_blk104[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd119: 
            img1_blk105[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd120: 
            img1_blk106[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd121: 
            img1_blk107[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd122: 
            img1_blk108[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd123: 
            img1_blk109[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd124: 
            img1_blk110[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd125: 
            img1_blk111[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd126: 
            img1_blk112[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd127: 
            img1_blk113[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd128: 
            img1_blk114[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd129: 
            img1_blk115[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd130: 
            img1_blk116[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd131: 
            img1_blk117[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd132: 
            img1_blk118[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd133: 
            img1_blk119[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd134: 
            img1_blk120[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd135: 
            img1_blk121[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd136: 
            img1_blk122[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd137: 
            img1_blk123[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd138: 
            img1_blk124[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd139: 
            img1_blk125[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd140: 
            img1_blk126[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd141: 
            img1_blk127[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd142: 
            img1_blk128[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd143: 
            img1_blk129[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd144: 
            img1_blk130[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd145: 
            img1_blk131[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd146: 
            img1_blk132[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd147: 
            img1_blk133[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd148: 
            img1_blk134[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd149: 
            img1_blk135[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd150: 
            img1_blk136[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd151: 
            img1_blk137[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd152: 
            img1_blk138[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd153: 
            img1_blk139[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd154: 
            img1_blk140[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd155: 
            img1_blk141[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd156: 
            img1_blk142[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd157: 
            img1_blk143[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd158: 
            img1_blk144[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd159: 
            img1_blk145[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd160: 
            img1_blk146[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd161: 
            img1_blk147[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd162: 
            img1_blk148[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd163: 
            img1_blk149[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd164: 
            img1_blk150[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd165: 
            img1_blk151[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd166: 
            img1_blk152[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd167: 
            img1_blk153[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd168: 
            img1_blk154[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd169: 
            img1_blk155[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd170: 
            img1_blk156[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd171: 
            img1_blk157[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd172: 
            img1_blk158[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd173: 
            img1_blk159[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd174: 
            img1_blk160[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd175: 
            img1_blk161[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd176: 
            img1_blk162[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd177: 
            img1_blk163[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd178: 
            img1_blk164[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd179: 
            img1_blk165[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd180: 
            img1_blk166[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd181: 
            img1_blk167[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd182: 
            img1_blk168[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd183: 
            img1_blk169[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd184: 
            img1_blk170[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd185: 
            img1_blk171[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd186: 
            img1_blk172[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd187: 
            img1_blk173[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd188: 
            img1_blk174[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd189: 
            img1_blk175[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd190: 
            img1_blk176[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd191: 
            img1_blk177[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd192: 
            img1_blk178[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd193: 
            img1_blk179[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd194: 
            img1_blk180[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd195: 
            img1_blk181[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd196: 
            img1_blk182[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd197: 
            img1_blk183[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd198: 
            img1_blk184[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd199: 
            img1_blk185[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd200: 
            img1_blk186[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd201: 
            img1_blk187[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd202: 
            img1_blk188[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd203: 
            img1_blk189[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd204: 
            img1_blk190[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd205: 
            img1_blk191[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd206: 
            img1_blk192[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd207: 
            img1_blk193[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd208: 
            img1_blk194[31: 0] 	<= S_AXI_WDATA[31: 0];
          12'd209: 
            img1_blk195[31: 0] 	<= S_AXI_WDATA[31: 0];

          default : begin

                    end
        endcase
      end
	end    

	// Implement write response logic generation
	// The write response and response valid signals are asserted by the slave 
	// when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.  
	// This marks the acceptance of address and indicates the status of 
	// write transaction.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_bvalid  <= 0;
	      axi_bresp   <= 2'b0;
	    end 
	  else
	    begin    
	      if (axi_awready && S_AXI_AWVALID && ~axi_bvalid && axi_wready && S_AXI_WVALID)
	        begin
	          // indicates a valid write response is available
	          axi_bvalid <= 1'b1;
	          axi_bresp  <= 2'b0; // 'OKAY' response 
	        end                   // work error responses in future
	      else
	        begin
	          if (S_AXI_BREADY && axi_bvalid) 
	            //check if bready is asserted while bvalid is high) 
	            //(there is a possibility that bready is always asserted high)   
	            begin
	              axi_bvalid <= 1'b0; 
	            end  
	        end
	    end
	end   

	// Implement axi_arready generation
	// axi_arready is asserted for one S_AXI_ACLK clock cycle when
	// S_AXI_ARVALID is asserted. axi_awready is 
	// de-asserted when reset (active low) is asserted. 
	// The read address is also latched when S_AXI_ARVALID is 
	// asserted. axi_araddr is reset to zero on reset assertion.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_arready <= 1'b0;
	      axi_araddr  <= 32'b0;
	    end 
	  else
	    begin    
	      if (~axi_arready && S_AXI_ARVALID)
	        begin
	          // indicates that the slave has acceped the valid read address
	          axi_arready <= 1'b1;
	          // Read address latching
	          axi_araddr  <= S_AXI_ARADDR;
	        end
	      else
	        begin
	          axi_arready <= 1'b0;
	        end
	    end 
	end       

	// Implement axi_arvalid generation
	// axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both 
	// S_AXI_ARVALID and axi_arready are asserted. The slave registers 
	// data are available on the axi_rdata bus at this instance. The 
	// assertion of axi_rvalid marks the validity of read data on the 
	// bus and axi_rresp indicates the status of read transaction.axi_rvalid 
	// is deasserted on reset (active low). axi_rresp and axi_rdata are 
	// cleared to zero on reset (active low).  
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_rvalid <= 0;
	      axi_rresp  <= 0;
	    end 
	  else
	    begin    
	      if (axi_arready && S_AXI_ARVALID && ~axi_rvalid)
	        begin
	          // Valid read data is available at the read data bus
	          axi_rvalid <= 1'b1;
	          axi_rresp  <= 2'b0; // 'OKAY' response
	        end   
	      else if (axi_rvalid && S_AXI_RREADY)
	        begin
	          // Read data is accepted by the master
	          axi_rvalid <= 1'b0;
	        end                
	    end
	end    


	// Implement memory mapped register select and read logic generation
	// Slave register read enable is asserted when valid address is available
	// and the slave is ready to accept the read address.
	assign slv_reg_rden = axi_arready & S_AXI_ARVALID & ~axi_rvalid;
	always @(*)
	begin
	      // Address decoding for reading registers
	      case ( axi_araddr[ADDR_MSB:ADDR_LSB] )
	        12'd0   : reg_data_out <= {15'b0, fpga_img_id};
	        12'd1   : reg_data_out <= {22'b0, epoch};
	        12'd2   : reg_data_out <= {15'b0, num_correct_train};
	        12'd3   : reg_data_out <= {15'b0, num_correct_test};
	        12'd4   : reg_data_out <= idle_cycles;
	        12'd5   : reg_data_out <= active_cycles;
	        12'd6   : reg_data_out <= status_block;
	        12'd7   : reg_data_out <= start;
	        12'd8   : reg_data_out <= n_epochs;
	        12'd9   : reg_data_out <= lrate_shifts;
	        12'd10  : reg_data_out <= training_mode;
	        12'd11  : reg_data_out <= img_set_size;
	        12'd12  : reg_data_out <= img1_id;
	        12'd13  : reg_data_out <= img1_label;
	        12'd210 : reg_data_out <= out0;
	        12'd211 : reg_data_out <= out1;
	        12'd212 : reg_data_out <= out2;
	        12'd213 : reg_data_out <= out3;
	        12'd214 : reg_data_out <= out4;
	        12'd400 : reg_data_out <= 32'hFADED_BEE;
	        default : reg_data_out <= 0;
	      endcase
	end

	// Output register or memory read data
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_rdata  <= 0;
	    end 
	  else
	    begin    
	      // When there is a valid read address (S_AXI_ARVALID) with 
	      // acceptance of read address by the slave (axi_arready), 
	      // output the read dada 
	      if (slv_reg_rden)
	        begin
	          axi_rdata <= reg_data_out;     // register read data
	        end   
	    end
	end    


	// Add user logic here


	// User logic ends

	endmodule
