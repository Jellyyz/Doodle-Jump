

module doodlejump(

      ///////// Clocks /////////
      input     MAX10_CLK1_50, 

      ///////// KEY /////////
      input    [ 1: 0]   KEY,

      ///////// SW /////////
      input    [ 9: 0]   SW,

      ///////// LEDR /////////
      output   [ 9: 0]   LEDR,

      ///////// HEX /////////
      output   [ 7: 0]   HEX0,
      output   [ 7: 0]   HEX1,
      output   [ 7: 0]   HEX2,
      output   [ 7: 0]   HEX3,
      output   [ 7: 0]   HEX4,
      output   [ 7: 0]   HEX5,

      ///////// SDRAM /////////
      output             DRAM_CLK,
      output             DRAM_CKE,
      output   [12: 0]   DRAM_ADDR,
      output   [ 1: 0]   DRAM_BA,
      inout    [15: 0]   DRAM_DQ,
      output             DRAM_LDQM,
      output             DRAM_UDQM,
      output             DRAM_CS_N,
      output             DRAM_WE_N,
      output             DRAM_CAS_N,
      output             DRAM_RAS_N,

      ///////// VGA /////////
      output             VGA_HS,
      output             VGA_VS,
      output   [ 3: 0]   VGA_R,
      output   [ 3: 0]   VGA_G,
      output   [ 3: 0]   VGA_B,


      ///////// ARDUINO /////////
      inout    [15: 0]   ARDUINO_IO,
      inout              ARDUINO_RESET_N 

);




logic Reset_h, vssig, blank, sync, VGA_Clk;


//=======================================================
//  REG/WIRE declarations
//=======================================================
	logic SPI0_CS_N, SPI0_SCLK, SPI0_MISO, SPI0_MOSI, USB_GPX, USB_IRQ, USB_RST;
	logic [3:0] hex_num_4, hex_num_3, hex_num_1, hex_num_0; //4 bit input hex digits
	logic [1:0] signs;
	logic [1:0] hundreds;
	logic [9:0] drawxsig, drawysig, Doodlexsig, Doodleysig, Doodlesizesig;
	logic [9:0] cannonxsig, cannonysig, cannonsizesig; 
	logic [9:0] cannonxsig1, cannonysig1; 
	logic [9:0] cannonxsig2, cannonysig2; 
	logic [7:0] Red, Blue, Green;
	logic [7:0] keycode;
	logic [8:0] platX, platY, plat_sizeX, plat_sizeY;
	logic [8:0] platX1, platY1;
	logic [8:0] platX2, platY2;
	logic [8:0] platX3, platY3;
	logic [8:0] platX4, platY4;
	logic [8:0] platX5, platY5;
	logic [8:0] platX6, platY6;
	logic [8:0] platX7, platY7;
	logic [8:0] platX8, platY8;
	logic [8:0] platX9, platY9;
	logic [8:0] platX10, platY10;
	logic [8:0] platX11, platY11;
	logic [8:0] platX12, platY12;
	logic [8:0] platX13, platY13;
	logic [8:0] platX14, platY14;
	logic [8:0] platX15, platY15;
	logic [8:0] springX, springY;
	logic [8:0] springX1, springY1;
	logic [8:0] springX2, springY2;
	logic [8:0] springX3, springY3;
	logic [3:0] springsizeX, springsizeY;
	logic [8:0] rocketX, rocketY;
	logic [3:0] rocketsizeX, rocketsizeY; 
	logic [8:0] plat_size_easy_X, plat_size_medium_X, plat_size_hard_X;
	logic [8:0] plat_size_easy_Y, plat_size_medium_Y, plat_size_hard_Y;
	logic [9:0] Doodle_Y_Motion;
	logic [9:0] Doodle_X_Pos, plat_temp_Y, Doodle_Y_Pos;
	logic refresh_en, trigger;
	logic [7:0] displacement, airtime;
	logic [15:0] countingss;
	logic [31:0] countingplat;
	logic test;
	logic [8:0] readyX, testX;
	logic [7:0] temp; 
	logic [19:0]Score;
	logic [1:0] difficulty; 
	logic [23:0] underwater_BKG_out;
	logic [23:0] soccer_BKG_out;
	logic [23:0] doodle_right_BKG_out;
	logic [23:0] space_BKG_out;
	logic [23:0] doodle_left_BKG_out;

	logic [23:0] zero_BKG_out;
	logic [23:0] one_BKG_out;
	logic [23:0] two_BKG_out;
	logic [23:0] three_BKG_out;
	logic [23:0] four_BKG_out;
	logic [23:0] five_BKG_out;
	logic [23:0] six_BKG_out;
	logic [23:0] seven_BKG_out;
	logic [23:0] eight_BKG_out;
	logic [23:0] nine_BKG_out;
	


	logic Platform_collision;
    logic Platform_collision0;
    logic Platform_collision1;
    logic Platform_collision2;
    logic Platform_collision3;
    logic Platform_collision4;
    logic Platform_collision5;
    logic Platform_collision6;
    logic Platform_collision7;
    logic Platform_collision8;
    logic Platform_collision9;
    logic Platform_collision10;
    logic Platform_collision11;
    logic Platform_collision12;
    logic Platform_collision13;
    logic Platform_collision14;
    logic Platform_collision15;
	logic doodle_down_check;
    logic [2:0] plat0_color;
    logic [2:0] plat1_color;
    logic [2:0] plat2_color;
    logic [2:0] plat3_color;
    logic [2:0] plat4_color;
    logic [2:0] plat5_color;
    logic [2:0] plat6_color;
    logic [2:0] plat7_color;
    logic [2:0] plat8_color;
    logic [2:0] plat9_color;
    logic [2:0] plat10_color;
    logic [2:0] plat11_color;
    logic [2:0] plat12_color;
    logic [2:0] plat13_color;
    logic [2:0] plat14_color;
    logic [2:0] plat15_color;
    logic [9:0] platX_Motion;  
	logic 		doodle_right_BKG_on;
	logic 		doodle_right_BKG_on3_bkg;
	logic 		doodle_left_BKG_on;
	logic 		doodle_left_BKG_on5_bkg;
    reg [8:0] monsterX, monsterY;
    reg monster_trigger;
	reg Rocket_collision; 
//=======================================================
//  Structural coding
//=======================================================

	assign ARDUINO_IO[10] = SPI0_CS_N;
	assign ARDUINO_IO[13] = SPI0_SCLK;
	assign ARDUINO_IO[11] = SPI0_MOSI;
	assign ARDUINO_IO[12] = 1'bZ;
	assign SPI0_MISO = ARDUINO_IO[12];
	
	assign ARDUINO_IO[9] = 1'bZ; 
	assign USB_IRQ = ARDUINO_IO[9];
		
	//Assignments specific to Circuits At Home UHS_20
	assign ARDUINO_RESET_N = USB_RST;
	assign ARDUINO_IO[7] = USB_RST;//USB reset 
	assign ARDUINO_IO[8] = 1'bZ; //this is GPX (set to input)
	assign USB_GPX = 1'b0;//GPX is not needed for standard USB host - set to 0 to prevent interrupt
	
	//Assign uSD CS to '1' to prevent uSD card from interfering with USB Host (if uSD card is plugged in)
	assign ARDUINO_IO[6] = 1'b1;
	
	//Assign LED for debug
	assign LEDR[9] = plat_enable; 
	assign LEDR[8] = plat_reset;

	assign LEDR[1] = refresh_en; 
	assign LEDR[0] = trigger; 
	
	//HEX drivers to convert numbers to HEX output
	HexDriver hex_driver5 (Rocket_collision, HEX5[6:0]);
	assign HEX5[7] = 1'b1;
	
	HexDriver hex_driver4 (Score[19:16], HEX4[6:0]);
	assign HEX4[7] = 1'b1;
		
	HexDriver hex_driver3 (Score[15:12], HEX3[6:0]); 
	assign HEX3[7] = 1'b1;

	HexDriver hex_driver2 (Score[11:8], HEX2[6:0]); 
	assign HEX2[7] = 1'b1;

	// HexDriver hex_driver3 (Doodle_Y_Motion[7:4], HEX3[6:0]); 
	// assign HEX3[7] = 1'b1;

	// HexDriver hex_driver2 (Doodle_Y_Motion[3:0], HEX2[6:0]); 
	// assign HEX2[7] = 1'b1;


	HexDriver hex_driver1 (Score[7:4], HEX1[6:0]);
	assign HEX1[7] = 1'b1;
	
	HexDriver hex_driver0 (Score[3:0], HEX0[6:0]);
	assign HEX0[7] = 1'b1;
	
logic [8:0] blue_temp_platX; 
	//Assign one button to reset
	assign {Reset_h}=~ (KEY[0]);

	// output to the screen 
	always_ff @ (posedge MAX10_CLK1_50)
	begin 
		if(!blank)
			begin 
				VGA_R = 4'h0; 
				VGA_B = 4'h0; 
				VGA_G = 4'h0; 

			end 
		else 
			begin 
				VGA_R = Red[7:4];
				VGA_B = Blue[7:4];
				VGA_G = Green[7:4];
			end

	end 
	
	
	doodlejump_soc u0 (
		.clk_clk                           (MAX10_CLK1_50),  //clk.clk
		.reset_reset_n                     (1'b1),           //reset.reset_n
		.altpll_0_locked_conduit_export    (),               //altpll_0_locked_conduit.export
		.altpll_0_phasedone_conduit_export (),               //altpll_0_phasedone_conduit.export
		.altpll_0_areset_conduit_export    (),               //altpll_0_areset_conduit.export
		.key_external_connection_export    (KEY),            //key_external_connection.export

		//SDRAM
		.sdram_clk_clk(DRAM_CLK),                            //clk_sdram.clk
		.sdram_wire_addr(DRAM_ADDR),                         //sdram_wire.addr
		.sdram_wire_ba(DRAM_BA),                             //.ba
		.sdram_wire_cas_n(DRAM_CAS_N),                       //.cas_n
		.sdram_wire_cke(DRAM_CKE),                           //.cke
		.sdram_wire_cs_n(DRAM_CS_N),                         //.cs_n
		.sdram_wire_dq(DRAM_DQ),                             //.dq
		.sdram_wire_dqm({DRAM_UDQM,DRAM_LDQM}),              //.dqm
		.sdram_wire_ras_n(DRAM_RAS_N),                       //.ras_n
		.sdram_wire_we_n(DRAM_WE_N),                         //.we_n

		//USB SPI	
		.spi0_SS_n(SPI0_CS_N),
		.spi0_MOSI(SPI0_MOSI),
		.spi0_MISO(SPI0_MISO),
		.spi0_SCLK(SPI0_SCLK),
		
		//USB GPIO
		.usb_rst_export(USB_RST),
		.usb_irq_export(USB_IRQ),
		.usb_gpx_export(USB_GPX),
		
		//LEDs and HEX
		.hex_digits_export({hex_num_4, hex_num_3, hex_num_1, hex_num_0}),
		.leds_export({hundreds, signs, trash}),
		.keycode_export(keycode)
		
	 );

logic [9:0] trash; 
//instantiate a vga_controller, Doodle, and color_mapper here with the ports.
logic pxl_clk;
logic [5:0] outstate;

vga_controller vga(
	.Clk(MAX10_CLK1_50),
	.Reset(Reset),
	
	.hs(VGA_HS), 
	.vs(VGA_VS), 
	.pixel_clk(pxl_clk), 
	.blank(blank), 
	.sync(sync), 
	.DrawX(drawxsig[9:0]), .DrawY(drawysig[9:0])    // 10 bits 
); 

jumplogic jumplogic(
	.Clk(MAX10_CLK1_50),
	.Reset(Reset_h),
	.frame_clk(VGA_VS), 
	.keycode(keycode),    // 8 bits 
	.trigger(trigger),
	.platX(platX[8:0]), .platY(platY[8:0]), .plat_sizeX(plat_sizeX[8:0]), .plat_sizeY(plat_sizeY[8:0]),	//9 btis

	.Doodle_Y_Motion(Doodle_Y_Motion[9:0]),


	.Platform_collision(Platform_collision),
	.plat_temp_Y(plat_temp_Y[9:0]),
	.DoodleX(Doodlexsig[9:0]), .DoodleY(Doodleysig[9:0]), .DoodleS(Doodlesizesig[9:0]),  // 10 bits
	.CannonX(cannonxsig[9:0]), .CannonY(cannonysig[9:0]), .CannonS(cannonsizesig[9:0]), 
	.CannonX1(cannonxsig1[9:0]), .CannonY1(cannonysig1[9:0]),
	.CannonX2(cannonxsig2[9:0]), .CannonY2(cannonysig2[9:0]),
	.outstate(outstate[5:0]),
	.platX1(platX1[8:0]), .platX2(platX2[8:0]), .platX3(platX3[8:0]), .platX4(platX4[8:0]), .platX5(platX5[8:0]), .platX6(platX6[8:0]), .platX7(platX7[8:0]), .platX8(platX8[8:0]),
	.platX9(platX9[8:0]), .platX10(platX10[8:0]), .platX11(platX11[8:0]), .platX12(platX12[8:0]), .platX13(platX13[8:0]), .platX14(platX14[8:0]), .platX15(platX15[8:0]),
	.platY1(platY1[8:0]), .platY2(platY2[8:0]), .platY3(platY3[8:0]), .platY4(platY4[8:0]), .platY5(platY5[8:0]), .platY6(platY6[8:0]), .platY7(platY7[8:0]), .platY8(platY8[8:0]),
	.platY9(platY9[8:0]), .platY10(platY10[8:0]), .platY11(platY11[8:0]), .platY12(platY12[8:0]), .platY13(platY13[8:0]), .platY14(platY14[8:0]), .platY15(platY15[8:0]),
	.plat_size_easy_X(plat_size_easy_X[8:0]), .plat_size_medium_X(plat_size_medium_X[8:0]), .plat_size_hard_X(plat_size_hard_X[8:0]), 
	.plat_size_easy_Y(plat_size_easy_Y[8:0]), .plat_size_medium_Y(plat_size_medium_Y[8:0]), .plat_size_hard_Y(plat_size_hard_Y[8:0]),
	.springX(springX), .springY(springY),
	.springX1(springX1), .springY1(springY1), 
	.springX2(springX2), .springY2(springY2), 
	.springX3(springX3), .springY3(springY3),
	.springsizeX(springsizeX), .springsizeY(springsizeY),
	.rocketX(rocketX), .rocketY(rocketY),
	.rocketsizeX(rocketsizeX), .rocketsizeY(rocketsizeY),
	.countingss(countingss[15:0]),
	.refresh_en(refresh_en),
	.displacement(displacement[7:0]), .airtime(airtime[7:0]),
	.loadplat(loadplat),
	.Score(Score[19:0]),
	.difficulty(difficulty[1:0]),
	.Platform_collision0(Platform_collision0),
	.Platform_collision1(Platform_collision1),
	.Platform_collision2(Platform_collision2),
	.Platform_collision3(Platform_collision3),
	.Platform_collision4(Platform_collision4),
	.Platform_collision5(Platform_collision5),
	.Platform_collision6(Platform_collision6),
	.Platform_collision7(Platform_collision7),
	.Platform_collision8(Platform_collision8),
	.Platform_collision9(Platform_collision9),
	.Platform_collision10(Platform_collision10),
	.Platform_collision11(Platform_collision11),
	.Platform_collision12(Platform_collision12),
	.Platform_collision13(Platform_collision13),
	.Platform_collision14(Platform_collision14),
	.Platform_collision15(Platform_collision15),
	.doodle_down_check(doodle_down_check),
 	.plat0_color(plat0_color),
	.plat1_color(plat1_color),
	.plat2_color(plat2_color),
	.plat3_color(plat3_color),
	.plat4_color(plat4_color),
	.plat5_color(plat5_color),
	.plat6_color(plat6_color),
	.plat7_color(plat7_color),
	.plat8_color(plat8_color),
	.plat9_color(plat9_color),
	.plat10_color(plat10_color),
	.plat11_color(plat11_color),
	.plat12_color(plat12_color),
	.plat13_color(plat13_color),
	.plat14_color(plat14_color),
	.plat15_color(plat15_color),
	.Rocket_collision(Rocket_collision)
); 

color_mapper color(
	// ten bits 
	.Clk(MAX10_CLK1_50),
	.frame_clk(VGA_VS),
	.Reset(Reset_h), 
	.DoodleX(Doodlexsig[9:0]), 
	.DoodleY(Doodleysig[9:0]), 
	.DrawX(drawxsig[9:0]), .DrawY(drawysig[9:0]), 
	.Doodle_size(Doodlesizesig[9:0]),
	.outstate(outstate[5:0]),
	.platX1(platX1[8:0]), .platX2(platX2[8:0]), .platX3(platX3[8:0]), .platX4(platX4[8:0]), .platX5(platX5[8:0]), .platX6(platX6[8:0]), .platX7(platX7[8:0]), .platX8(platX8[8:0]),
	.platX9(platX9[8:0]), .platX10(platX10[8:0]), .platX11(platX11[8:0]), .platX12(platX12[8:0]), .platX13(platX13[8:0]), .platX14(platX14[8:0]), .platX15(platX15[8:0]),
	.platY1(platY1[8:0]), .platY2(platY2[8:0]), .platY3(platY3[8:0]), .platY4(platY4[8:0]), .platY5(platY5[8:0]), .platY6(platY6[8:0]), .platY7(platY7[8:0]), .platY8(platY8[8:0]),
	.platY9(platY9[8:0]), .platY10(platY10[8:0]), .platY11(platY11[8:0]), .platY12(platY12[8:0]), .platY13(platY13[8:0]), .platY14(platY14[8:0]), .platY15(platY15[8:0]),
	.plat_size_easy_X(plat_size_easy_X[8:0]), .plat_size_medium_X(plat_size_medium_X[8:0]), .plat_size_hard_X(plat_size_hard_X[8:0]), 
	.plat_size_easy_Y(plat_size_easy_Y[8:0]), .plat_size_medium_Y(plat_size_medium_Y[8:0]), .plat_size_hard_Y(plat_size_hard_Y[8:0]), 
	.plat_temp_Y(plat_temp_Y[8:0]),
	.loadplat(loadplat),
	.airtime(airtime[7:0]),
	.underwater_BKG_out(underwater_BKG_out[23:0]),
	.soccer_BKG_out(soccer_BKG_out[23:0]),
	.doodle_right_BKG_out(doodle_right_BKG_out[23:0]),
	.space_BKG_out(space_BKG_out[23:0]),
	.doodle_left_BKG_out(doodle_left_BKG_out[23:0]),
	.zero_BKG_out(zero_BKG_out[23:0]),
	.one_BKG_out(one_BKG_out[23:0]),
	.two_BKG_out(two_BKG_out[23:0]),
	.three_BKG_out(three_BKG_out[23:0]),
	.four_BKG_out(four_BKG_out[23:0]),
	.five_BKG_out(five_BKG_out[23:0]),
	.six_BKG_out(six_BKG_out[23:0]),
	.seven_BKG_out(seven_BKG_out[23:0]),
	.eight_BKG_out(eight_BKG_out[23:0]),
	.nine_BKG_out(nine_BKG_out[23:0]),



	.Score(Score[19:0]),
	.Doodle_Y_Motion(Doodle_Y_Motion),
	.Platform_collision(Platform_collision),
	.platX_Motion(platX_Motion),
	.rocketX(rocketX), .rocketY(rocketY),
	.rocketsizeX(rocketsizeX), .rocketsizeY(rocketsizeY),
	.springX(springX), .springY(springY),
	.springX1(springX1), .springY1(springY1), 
	.springX2(springX2), .springY2(springY2), 
	.springX3(springX3), .springY3(springY3),
	.springsizeX(springsizeX), .springsizeY(springsizeY),
	.readyX(readyX),
	.testX(testX),
	.keycode(keycode), 
	.CannonX(cannonxsig[9:0]), .CannonX1(cannonxsig1[9:0]), .CannonX2(cannonxsig2[9:0]), 
	.CannonY(cannonysig[9:0]), .CannonY1(cannonysig1[9:0]), .CannonY2(cannonysig2[9:0]), 
	.CannonS(cannonsizesig[9:0]), 
	.trigger(trigger), 
	.platX(platX[8:0]), .platY(platY[8:0]), .plat_sizeX(plat_sizeX[8:0]), .plat_sizeY(plat_sizeY[8:0]),	//9 btis
	.plat_enable(plat_enable), .plat_reset(plat_reset), 
	// 8 bits 
	.Red(Red[7:0]), 
	.Green(Green[7:0]), 
	.Blue(Blue[7:0]),
	.countingplat(countingplat[31:0]),
	.test(test),
	.temp(temp),
	.difficulty(difficulty[1:0]),
	.blue_temp_platX(blue_temp_platX),
	.Platform_collision0(Platform_collision0),
	.Platform_collision1(Platform_collision1),
	.Platform_collision2(Platform_collision2),
	.Platform_collision3(Platform_collision3),
	.Platform_collision4(Platform_collision4),
	.Platform_collision5(Platform_collision5),
	.Platform_collision6(Platform_collision6),
	.Platform_collision7(Platform_collision7),
	.Platform_collision8(Platform_collision8),
	.Platform_collision9(Platform_collision9),
	.Platform_collision10(Platform_collision10),
	.Platform_collision11(Platform_collision11),
	.Platform_collision12(Platform_collision12),
	.Platform_collision13(Platform_collision13),
	.Platform_collision14(Platform_collision14),
	.Platform_collision15(Platform_collision15),
	.doodle_down_check(doodle_down_check),
	.plat0_color(plat0_color),
	.plat1_color(plat1_color),
	.plat2_color(plat2_color),
	.plat3_color(plat3_color),
	.plat4_color(plat4_color),
	.plat5_color(plat5_color),
	.plat6_color(plat6_color),
	.plat7_color(plat7_color),
	.plat8_color(plat8_color),
	.plat9_color(plat9_color),
	.plat10_color(plat10_color),
	.plat11_color(plat11_color),
	.plat12_color(plat12_color),
	.plat13_color(plat13_color),
	.plat14_color(plat14_color),
	.plat15_color(plat15_color),

	//1 bit
	.doodle_right_BKG_on(doodle_right_BKG_on),
	.doodle_right_BKG_on3_bkg(doodle_right_BKG_on3_bkg),
	.doodle_left_BKG_on(doodle_left_BKG_on),
	.doodle_left_BKG_on5_bkg(doodle_left_BKG_on5_bkg),
	.monster_trigger(monster_trigger),
	.monsterX(monsterX), .monsterY(monsterY)
);


endmodule
