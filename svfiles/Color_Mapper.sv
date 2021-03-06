//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//                                                                       --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    University of Illinois ECE Department                              --
//    Modifed by Gally && Feng Zhao April/May 2022                       --
//    Everything for terrain is generated here                           --
//    University of Illinois ECE Department                                               --
//    For use with ECE 385 Lab 7                        --
//-------------------------------------------------------------------------


module  color_mapper ( 
                    input logic Clk, Reset, frame_clk,
					input logic [9:0] DoodleX, DoodleY, DrawX, DrawY, Doodle_size,
                    input logic [5:0] outstate,
					input logic [9:0]  CannonX, CannonY, CannonS, 
					input logic [9:0]  CannonX1, CannonY1, 
					input logic [9:0]  CannonX2, CannonY2, 
                    input logic [8:0]  plat_temp_Y,
					input logic loadplat, 
                    input logic [7:0] airtime,
                    input logic [1:0] difficulty, 
                    input logic [9:0] Doodle_Y_Motion, 
                    input logic [7:0] keycode,
    
						  
                    input logic [19:0] Score, 
                    input logic Platform_collision, 
					input logic Platform_collision0,
					input logic Platform_collision1,
					input logic Platform_collision2,
					input logic Platform_collision3,
					input logic Platform_collision4,
					input logic Platform_collision5,
					input logic Platform_collision6,
					input logic Platform_collision7,
					input logic Platform_collision8,
					input logic Platform_collision9,
					input logic Platform_collision10,
					input logic Platform_collision11,
					input logic Platform_collision12,
					input logic Platform_collision13,
					input logic Platform_collision14,
					input logic Platform_collision15,
                    input logic doodle_down_check, 

                    output logic [2:0] plat0_color,
                    output logic [2:0] plat1_color,
                    output logic [2:0] plat2_color,
                    output logic [2:0] plat3_color,
                    output logic [2:0] plat4_color,
                    output logic [2:0] plat5_color,
                    output logic [2:0] plat6_color,
                    output logic [2:0] plat7_color,
                    output logic [2:0] plat8_color,
                    output logic [2:0] plat9_color,
                    output logic [2:0] plat10_color,
                    output logic [2:0] plat11_color,
                    output logic [2:0] plat12_color,
                    output logic [2:0] plat13_color,
                    output logic [2:0] plat14_color,
                    output logic [2:0] plat15_color,
                    output logic [9:0] platX_Motion, 
                    output logic [8:0] springX, springY, 
                    output logic [8:0] springX1, springY1, 
                    output logic [8:0] springX2, springY2, 
                    output logic [8:0] springX3, springY3, 
                    output reg [8:0] springsizeX, springsizeY,
                    output logic [8:0] rocketX, rocketY, 
                    output reg [8:0] rocketsizeX, rocketsizeY, 
                    output logic [7:0] temp, 
                    output logic [31:0] countingplat,
                    output logic trigger, 
                    output logic [7:0]  Red, Green, Blue,
                    output logic [8:0] platX, platY, plat_sizeX, plat_sizeY,
                    output logic [8:0] platX1, platY1, platX2, platY2, platX3, platY3, platX4, platY4, 
                    output logic [8:0] platX5, platY5, platX6, platY6, platX7, platY7, platX8, platY8, 
                    output logic [8:0] platX9, platY9, platX10, platY10, platX11, platY11, platX12, platY12, 
                    output logic [8:0] platX13, platY13, platX14, platY14, platX15, platY15,
                    output logic [8:0] plat_size_easy_X, plat_size_medium_X, plat_size_hard_X,                    
                    output logic [8:0] plat_size_easy_Y, plat_size_medium_Y, plat_size_hard_Y,
                    output logic plat_enable, plat_reset, test, 
                    output logic [8:0] readyX, testX,
                    output logic [23:0] underwater_BKG_out,
                    output logic [23:0] soccer_BKG_out,
                    output logic [23:0] doodle_right_BKG_out,
                    output logic [23:0] space_BKG_out,
                    output logic [23:0] doodle_left_BKG_out,
                    output logic [23:0] zero_BKG_out,
                    output logic [23:0] one_BKG_out,
                    output logic [23:0] two_BKG_out,
                    output logic [23:0] three_BKG_out,
                    output logic [23:0] four_BKG_out,
                    output logic [23:0] five_BKG_out,
                    output logic [23:0] six_BKG_out,
                    output logic [23:0] seven_BKG_out,
                    output logic [23:0] eight_BKG_out,
                    output logic [23:0] nine_BKG_out,
                    output logic [23:0] A_BKG_out,
                    output logic [23:0] B_BKG_out,
                    output logic [23:0] C_BKG_out,
                    output logic [23:0] D_BKG_out,
                    output logic [23:0] E_BKG_out,
                    output logic [23:0] F_BKG_out,
                    output logic [23:0] G_BKG_out,
                    output logic [23:0] H_BKG_out,
                    output logic [23:0] I_BKG_out,
                    output logic [23:0] J_BKG_out,
                    output logic [23:0] K_BKG_out,
                    output logic [23:0] L_BKG_out,
                    output logic [23:0] M_BKG_out,
                    output logic [23:0] N_BKG_out,
                    output logic [23:0] O_BKG_out,
                    output logic [23:0] P_BKG_out,
                    output logic [23:0] Q_BKG_out,
                    output logic [23:0] R_BKG_out,
                    output logic [23:0] S_BKG_out,
                    output logic [23:0] T_BKG_out,
                    output logic [23:0] U_BKG_out,
                    output logic [23:0] V_BKG_out,
                    output logic [23:0] W_BKG_out,
                    output logic [23:0] X_BKG_out,
                    output logic [23:0] Y_BKG_out,
                    output logic [23:0] Z_BKG_out,


                    output logic [8:0] blue_temp_platX,
                    output logic 		doodle_right_BKG_on,
	                output logic 		doodle_right_BKG_on3_bkg,
	                output logic 		doodle_left_BKG_on,
	                output logic 		doodle_left_BKG_on5_bkg,
                    output reg [8:0] monsterX, monsterY,
                    output reg [4:0] monstersizeX, monstersizeY, 
                    output reg monster_trigger 
);  
    parameter [9:0] Screen_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Screen_Y_Max=479;     // Bottommost point on the Y axis
    logic Doodle_on;
    
// ??????????????????????????????????????????????????????????????????????????? Monster logic ???????????????????????????????????????????????????????????????????????????

assign monstersizeX = 8; 
assign monstersizeY = 8; 
assign monsterspeed = 2; 
                // calculate when the monster should spawn in 
reg [2:0] monsterspeed; 
reg [8:0] monsterX_Motion, monsterY_Motion; 
reg [8:0] monster_tempX; 
reg [8:0] monster_readyX;
reg monster_dead; 
reg monster_dead2;
always_ff @(posedge frame_clk)
    begin 
        unique case(outstate)
        3'b000, 3'b001, 3'b101, 3'b110:
        begin 
            monster_tempX <= 250;  
            monsterY <= 0; 
            monster_dead <= 0;
            monster_dead2 <= 0;
        end 
        default:
        begin 

        if(CannonX - CannonS <= monsterX + monstersizeX && CannonX + CannonS >= monsterX - monstersizeX  && CannonY - CannonS <= monsterY + monstersizeY && CannonY + CannonS >= monsterY - monstersizeY ||
           CannonX1 - CannonS <= monsterX + monstersizeX && CannonX1 + CannonS >= monsterX - monstersizeX  && CannonY1 - CannonS <= monsterY + monstersizeY && CannonY1 + CannonS >= monsterY - monstersizeY ||
           CannonX2 - CannonS <= monsterX + monstersizeX && CannonX2 + CannonS >= monsterX - monstersizeX  && CannonY2 - CannonS <= monsterY + monstersizeY && CannonY2 + CannonS >= monsterY - monstersizeY)
            begin 
            monsterY <= 0; 
            monster_dead <= 1;
            if(monster_dead) 
                monster_dead2 <= 1; 
            end 
        else if(Score[11] && !monster_dead)
            begin 
            monsterY <= 60;
            monster_dead <= 0; 
            end 
        else if(Score[13] && !monster_dead2)
            begin 
            monsterY <= 60;
            monster_dead2 <= 0; 
            end
        end 
		  endcase
        if(outstate == 3'b011)
            begin 
                monsterX_Motion <= 0; 
            end  
        else if(monsterX_Motion == 10'h0)
            begin 
                if(monsterX < 100 + monsterspeed)
                    monsterX_Motion <= monsterspeed; 
                else
                    monsterX_Motion <= (1'b1 + ~monsterspeed);
            end 
        else 
            begin 
                if(monsterX > 100 + monster_tempX && monsterX_Motion == monsterspeed)
                    monsterX_Motion <= (1'b1 + ~monsterspeed); 
                else if (monsterX < monster_tempX - 100 && monsterX_Motion == (1'b1 + ~monsterspeed))
                    monsterX_Motion <= monsterspeed; 
            end 


		
        monsterX <= monsterX + monsterX_Motion; 
    end 

//???????????????????????????????????????????????????????????????????????????  power up logic ??????????????????????????????????????????????????????????????????????????? 
assign springsizeX = plat_sizeX >> 1;
assign springsizeY = 3;
assign rocketsizeX = plat_sizeX >> 1; 
assign rocketsizeY = 3; 

always_ff @(posedge frame_clk) 
    begin 
        springY <= platY - plat_sizeY - springsizeY; 
        springX <= platX; 
        
        springY1 <= platY3 - plat_sizeY - springsizeY; 
        springX1 <= platX3; 

        springY2 <= platY5 - plat_sizeY - springsizeY; 
        springX2 <= platX5; 
        
        springY3 <= platY7 - plat_sizeY - springsizeY; 
        springX3 <= platX7; 

        rocketY <= platY15 - plat_sizeY - rocketsizeY;
        rocketX <= platX15;
        
    end  
logic [8:0] seedgen;   
logic [8:0] plat_ready_trigger; 
counter seedgenx(
	.Reset(0), 
	.enable(1), 
    .Clk(Clk), 

    .out(seedgen[8:0])
);
counter platrdy(
	.Reset(0), 
	.enable(1), 
    .Clk(frame_clk), 

    .out(plat_ready_trigger[8:0])
);

always_comb 
    begin 
        if(Reset)
            res_LFSR = Reset; 
        else 
            res_LFSR = 0; 
    end
// ??????????????????????????????????????????????????????????????????????????? these LFSR generate 16 strings of 9 bit random numbers for platX ???????????????????????????????????????????????????????????????????????????
logic seed_en, seed_en1, seed_en2, seed_en3, seed_en4, seed_en5, seed_en6, seed_en7, seed_en8, seed_en9, seed_en10, seed_en11, seed_en12, seed_en13, seed_en14, seed_en15;
LFSR LFSR(
    .Clk(Clk), .Reset(res_LFSR), .outp(testX[8:0]), .seed(seedgen[8:0]), .seed_in(seed_en15), .seed_out(seed_en)
);
LFSR LFSR1(
    .Clk(Clk), .Reset(res_LFSR), .outp(testX1[8:0]), .seed(testX[8:0]), .seed_in(seed_en), .seed_out(seed_en1)
);
LFSR LFSR2(
    .Clk(Clk), .Reset(res_LFSR), .outp(testX2[8:0]), .seed(testX1[8:0]), .seed_in(seed_en1), .seed_out(seed_en2)
);
LFSR LFSR3(
    .Clk(Clk), .Reset(res_LFSR), .outp(testX3[8:0]), .seed(testX2[8:0]), .seed_in(seed_en2), .seed_out(seed_en3)
);
LFSR LFSR4(
    .Clk(Clk), .Reset(res_LFSR), .outp(testX4[8:0]), .seed(testX3[8:0]), .seed_in(seed_en3), .seed_out(seed_en4)
);
LFSR LFSR5(
    .Clk(Clk), .Reset(res_LFSR), .outp(testX5[8:0]), .seed(testX4[8:0]), .seed_in(seed_en4), .seed_out(seed_en5)
);
LFSR LFSR6(
    .Clk(Clk), .Reset(res_LFSR), .outp(testX6[8:0]), .seed(testX5[8:0]), .seed_in(seed_en5), .seed_out(seed_en6)
);
LFSR LFSR7(
    .Clk(Clk), .Reset(res_LFSR), .outp(testX7[8:0]), .seed(testX6[8:0]), .seed_in(seed_en6), .seed_out(seed_en7)
);
LFSR LFSR8(
    .Clk(Clk), .Reset(res_LFSR), .outp(testX8[8:0]), .seed(testX7[8:0]), .seed_in(seed_en7), .seed_out(seed_en8)
);
LFSR LFSR9(
    .Clk(Clk), .Reset(res_LFSR), .outp(testX9[8:0]), .seed(testX8[8:0]), .seed_in(seed_en8), .seed_out(seed_en9)
);
LFSR LFSR10(
    .Clk(Clk), .Reset(res_LFSR), .outp(testX10[8:0]), .seed(testX9[8:0]), .seed_in(seed_en9), .seed_out(seed_en10)
);
LFSR LFSR11(
    .Clk(Clk), .Reset(res_LFSR), .outp(testX11[8:0]), .seed(testX10[8:0]), .seed_in(seed_en10), .seed_out(seed_en11)
);
LFSR LFSR12(
    .Clk(Clk), .Reset(res_LFSR), .outp(testX12[8:0]), .seed(testX11[8:0]), .seed_in(seed_en11), .seed_out(seed_en12)
);
LFSR LFSR13(
    .Clk(Clk), .Reset(res_LFSR), .outp(testX13[8:0]), .seed(testX12[8:0]), .seed_in(seed_en12), .seed_out(seed_en13)
);
LFSR LFSR14(
    .Clk(Clk), .Reset(res_LFSR), .outp(testX14[8:0]), .seed(testX13[8:0]), .seed_in(seed_en13), .seed_out(seed_en14)
);
LFSR LFSR15(
    .Clk(Clk), .Reset(res_LFSR), .outp(testX15[8:0]), .seed(testX14[8:0]), .seed_in(seed_en14), .seed_out(seed_en15)
);
LFSR LFSR_monster0(
    .Clk(Clk), .Reset(res_LFSR), .outp(monstertestX[8:0]), .seed(monsterseed[8:0]), .seed_in(seed_en14)
);
logic [8:0] monsterseed; 
logic [8:0] monstertestX; 
assign monster_seed = {testX15[7:4], testX1[3:0]};

logic [8:0] testX1, testX2, testX3, testX4, testX5, testX6, testX7,  testX8, testX9, testX10, testX11, testX12, testX13, testX14, testX15;
logic [8:0] readyX1, readyX2, readyX3, readyX4, readyX5, readyX6, readyX7,  readyX8, readyX9, readyX10, readyX11, readyX12, readyX13, readyX14, readyX15;
//???????????????????????????????????????????????????????????????????????????  state machines for platform color ??????????????????????????????????????????????????????????????????????????? 
logic [2:0] plat0_trigger, plat1_trigger, plat2_trigger, plat3_trigger, plat4_trigger, plat5_trigger, plat6_trigger, plat7_trigger, plat8_trigger, plat9_trigger, plat10_trigger, plat11_trigger,  plat12_trigger, plat13_trigger, plat14_trigger, plat15_trigger; 
plat_type plat0(
    .Clk(Clk),
    .Reset(Reset), 
    .type_trigger(plat0_trigger),
    .plat_color(plat0_color[2:0])
); 
plat_type plat1(
    .Clk(Clk),
    .Reset(Reset), 
    .type_trigger(plat1_trigger),
    .plat_color(plat1_color[2:0])
); 
plat_type plat2(
    .Clk(Clk),
    .Reset(Reset), 
    .type_trigger(plat2_trigger),
    .plat_color(plat2_color[2:0])
); 
plat_type plat3(
    .Clk(Clk),
    .Reset(Reset),
    .type_trigger(plat3_trigger), 
    .plat_color(plat3_color[2:0])
); 
plat_type plat4(
    .Clk(Clk),
    .Reset(Reset), 
    .type_trigger(plat4_trigger),
    .plat_color(plat4_color[2:0])
); 
plat_type plat5(
    .Clk(Clk),
    .Reset(Reset), 
    .type_trigger(plat5_trigger),
    .plat_color(plat5_color[2:0])
); 
plat_type plat6(
    .Clk(Clk),
    .Reset(Reset), 
    .type_trigger(plat6_trigger),
    .plat_color(plat6_color[2:0])
); 
plat_type plat7(
    .Clk(Clk),
    .Reset(Reset), 
    .type_trigger(plat7_trigger),
    .plat_color(plat7_color[2:0])
); 
plat_type plat8(
    .Clk(Clk),
    .Reset(Reset), 
    .type_trigger(plat8_trigger),
    .plat_color(plat8_color[2:0])
); 
plat_type plat9(
    .Clk(Clk),
    .Reset(Reset), 
    .type_trigger(plat9_trigger),
    .plat_color(plat9_color[2:0])
); 
plat_type plat10(
    .Clk(Clk),
    .Reset(Reset), 
    .type_trigger(plat10_trigger),
    .plat_color(plat10_color[2:0])
); 
plat_type plat11(
    .Clk(Clk),
    .Reset(Reset), 
    .type_trigger(plat11_trigger),
    .plat_color(plat11_color[2:0])
); 
plat_type plat12(
    .Clk(Clk),
    .Reset(Reset), 
    .type_trigger(plat12_trigger),
    .plat_color(plat12_color[2:0])
); 
plat_type plat13(
    .Clk(Clk),
    .Reset(Reset), 
    .type_trigger(plat13_trigger),
    .plat_color(plat13_color[2:0])
); 
plat_type plat14(
    .Clk(Clk),
    .Reset(Reset), 
    .type_trigger(plat14_trigger),
    .plat_color(plat14_color[2:0])
); 
plat_type plat15(
    .Clk(Clk),
    .Reset(Reset), 
    .type_trigger(plat15_trigger),
    .plat_color(plat15_color[2:0])
); 

//??????????????????????????????????????????????????????????????????????????? checking if the platforms are close enough to each other  ??????????????????????????????????????????????????? 
// this is for changing the difficulty
always_comb
    begin 
        unique case(difficulty)
        2'b00:
            begin 
                plat_sizeX = 9'd32;
                plat_sizeY = 9'd4;
            end 
        2'b01:
            begin 
                plat_sizeX = 9'd16;
                plat_sizeY = 9'd4;
            end 
        2'b10:
            begin 
                plat_sizeX = 9'd8;
                plat_sizeY = 9'd4;
            end 
		endcase 
    end 
logic plat_ready; 
parameter [2:0] bluespeed = 2; 
//??????????????????????????????????????????????????????????????????????????? this is for calculation of platX ???????????????????????????????????????????????????????????????????????????
//logic [8:0] blue_temp_platX; 
logic [8:0] blue_temp_platX1; 
logic [8:0] blue_temp_platX2; 
logic [8:0] blue_temp_platX3; 
logic [8:0] blue_temp_platX4; 
logic [8:0] blue_temp_platX5; 
logic [8:0] blue_temp_platX6; 
logic [8:0] blue_temp_platX7; 
logic [8:0] blue_temp_platX8; 
logic [8:0] blue_temp_platX9; 
logic [8:0] blue_temp_platX10; 
logic [8:0] blue_temp_platX11; 
logic [8:0] blue_temp_platX12; 
logic [8:0] blue_temp_platX13; 
logic [8:0] blue_temp_platX14; 
logic [8:0] blue_temp_platX15;
logic [9:0]  platX1_Motion, platX2_Motion, platX3_Motion, platX4_Motion, platX5_Motion, platX6_Motion, platX7_Motion, platX8_Motion, platX9_Motion, platX10_Motion, platX11_Motion, platX12_Motion, platX13_Motion, platX14_Motion, platX15_Motion; 
// ~~~~~~~~~~~~~~~~~~~~~ allow for blue motion of platforms ~~~~~~~~~~~~~~~~~~~~
// veyr resource heavy !!!!!!!!!!!!!!!!!!!!!!!! 
always_ff @(posedge frame_clk)
    begin   
        if(plat0_color == 3'b010 && outstate != 3'b011) 
            begin 
                if(platX_Motion == 10'h0)
                    begin 
                        if(platX < 100 + blue_temp_platX)
                            platX_Motion <= bluespeed; 
                        else
                            platX_Motion <= (1'b1 + ~bluespeed);
                    end 
                else 
                    begin 
                        if(platX > 100 + blue_temp_platX && platX_Motion == bluespeed)
                            platX_Motion <= (1'b1 + ~bluespeed); 
                        else if (platX < blue_temp_platX - 100 && platX_Motion == (1'b1 + ~bluespeed))
                            platX_Motion <= bluespeed; 
                    end 
            end 
        else 
            begin 
                platX_Motion <= 0; 
                        blue_temp_platX <= platX;  
            end 

        if(plat1_color == 3'b010 && outstate != 3'b011) 
            begin 
                if(platX1_Motion == 10'h0)
                    begin 
                        if(platX1 < 100 + blue_temp_platX1)
                            platX1_Motion <= bluespeed; 
                        else
                            platX1_Motion <= (1'b1 + ~bluespeed);
                    end 
                else 
                    begin 
                        if(platX1 > 100 + blue_temp_platX1 && platX1_Motion == bluespeed)
                            platX1_Motion <= (1'b1 + ~bluespeed); 
                        else if (platX1 < blue_temp_platX1 - 100 && platX1_Motion == (1'b1 + ~bluespeed))
                            platX1_Motion <= bluespeed; 
                    end 
            end 
        else 
            begin 
                platX1_Motion <= 0; 
                        blue_temp_platX1 <= platX1;  
            end 

        if(plat2_color == 3'b010 && outstate != 3'b011) 
            begin 
                if(platX2_Motion == 10'h0)
                    begin 
                        if(platX2 < 100 + blue_temp_platX2)
                            platX2_Motion <= bluespeed; 
                        else
                            platX2_Motion <= (1'b1 + ~bluespeed);
                    end 
                else 
                    begin 
                        if(platX2 > 100 + blue_temp_platX2 && platX2_Motion == bluespeed)
                            platX2_Motion <= (1'b1 + ~bluespeed); 
                        else if (platX2 < blue_temp_platX2 - 100 && platX2_Motion == (1'b1 + ~bluespeed))
                            platX2_Motion <= bluespeed; 
                    end 
            end 
        else 
            begin 
                platX2_Motion <= 0; 
                        blue_temp_platX2 <= platX2;  
            end

        if(plat3_color == 3'b010 && outstate != 3'b011) 
            begin 
                if(platX3_Motion == 10'h0)
                    begin 
                        if(platX3 < 100 + blue_temp_platX3)
                            platX3_Motion <= bluespeed; 
                        else
                            platX3_Motion <= (1'b1 + ~bluespeed);
                    end 
                else 
                    begin 
                        if(platX3 > 100 + blue_temp_platX3 && platX3_Motion == bluespeed)
                            platX3_Motion <= (1'b1 + ~bluespeed); 
                        else if (platX3 < blue_temp_platX3 - 100 && platX3_Motion == (1'b1 + ~bluespeed))
                            platX3_Motion <= bluespeed; 
                    end 
            end 
        else 
            begin 
                platX3_Motion <= 0; 
                        blue_temp_platX3 <= platX3;  
            end 

        if(plat4_color == 3'b010 && outstate != 3'b011) 
            begin 
                if(platX4_Motion == 10'h0)
                    begin 
                        if(platX4 < 100 + blue_temp_platX4)
                            platX4_Motion <= bluespeed; 
                        else
                            platX4_Motion <= (1'b1 + ~bluespeed);
                    end 
                else 
                    begin 
                        if(platX4 > 100 + blue_temp_platX4 && platX4_Motion == bluespeed)
                            platX4_Motion <= (1'b1 + ~bluespeed); 
                        else if (platX4 < blue_temp_platX4 - 100 && platX4_Motion == (1'b1 + ~bluespeed))
                            platX4_Motion <= bluespeed; 
                    end 
            end 
        else 
            begin 
                platX4_Motion <= 0; 
                        blue_temp_platX4 <= platX4;  
            end 

        if(plat5_color == 3'b010 && outstate != 3'b011) 
            begin 
                if(platX5_Motion == 10'h0)
                    begin 
                        if(platX5 < 100 + blue_temp_platX5)
                            platX5_Motion <= bluespeed; 
                        else
                            platX5_Motion <= (1'b1 + ~bluespeed);
                    end 
                else 
                    begin 
                        if(platX5 > 100 + blue_temp_platX5 && platX5_Motion == bluespeed)
                            platX5_Motion <= (1'b1 + ~bluespeed); 
                        else if (platX5 < blue_temp_platX5 - 100 && platX5_Motion == (1'b1 + ~bluespeed))
                            platX5_Motion <= bluespeed; 
                    end 
            end 
        else 
            begin 
                platX5_Motion <= 0; 
                        blue_temp_platX5 <= platX5;  
            end

        if(plat6_color == 3'b010 && outstate != 3'b011) 
            begin 
                if(platX6_Motion == 10'h0)
                    begin 
                        if(platX6 < 100 + blue_temp_platX6)
                            platX6_Motion <= bluespeed; 
                        else
                            platX6_Motion <= (1'b1 + ~bluespeed);
                    end 
                else 
                    begin 
                        if(platX6 > 100 + blue_temp_platX6 && platX6_Motion == bluespeed)
                            platX6_Motion <= (1'b1 + ~bluespeed); 
                        else if (platX6 < blue_temp_platX6 - 100 && platX6_Motion == (1'b1 + ~bluespeed))
                            platX6_Motion <= bluespeed; 
                    end 
            end 
        else 
            begin 
                platX6_Motion <= 0; 
                        blue_temp_platX6 <= platX6;  
            end 

        if(plat7_color == 3'b010 && outstate != 3'b011) 
            begin 
                if(platX7_Motion == 10'h0)
                    begin 
                        if(platX7 < 100 + blue_temp_platX7)
                            platX7_Motion <= bluespeed; 
                        else
                            platX7_Motion <= (1'b1 + ~bluespeed);
                    end 
                else 
                    begin 
                        if(platX7 > 100 + blue_temp_platX7 && platX7_Motion == bluespeed)
                            platX7_Motion <= (1'b1 + ~bluespeed); 
                        else if (platX7 < blue_temp_platX7 - 100 && platX7_Motion == (1'b1 + ~bluespeed))
                            platX7_Motion <= bluespeed; 
                    end 
            end 
        else 
            begin 
                platX7_Motion <= 0; 
                        blue_temp_platX7 <= platX7;  
            end 

        if(plat8_color == 3'b010 && outstate != 3'b011) 
            begin 
                if(platX8_Motion == 10'h0)
                    begin 
                        if(platX8 < 100 + blue_temp_platX8)
                            platX8_Motion <= bluespeed; 
                        else
                            platX8_Motion <= (1'b1 + ~bluespeed);
                    end 
                else 
                    begin 
                        if(platX8 > 100 + blue_temp_platX8 && platX8_Motion == bluespeed)
                            platX8_Motion <= (1'b1 + ~bluespeed); 
                        else if (platX8 < blue_temp_platX8 - 100 && platX8_Motion == (1'b1 + ~bluespeed))
                            platX8_Motion <= bluespeed; 
                    end 
            end 
        else 
            begin 
                platX8_Motion <= 0; 
                        blue_temp_platX8 <= platX8;  
            end
    
        if(plat9_color == 3'b010 && outstate != 3'b011) 
            begin 
                if(platX9_Motion == 10'h0)
                    begin 
                        if(platX9 < 100 + blue_temp_platX9)
                            platX9_Motion <= bluespeed; 
                        else
                            platX9_Motion <= (1'b1 + ~bluespeed);
                    end 
                else 
                    begin 
                        if(platX9 > 100 + blue_temp_platX9 && platX9_Motion == bluespeed)
                            platX9_Motion <= (1'b1 + ~bluespeed); 
                        else if (platX9 < blue_temp_platX9 - 100 && platX9_Motion == (1'b1 + ~bluespeed))
                            platX9_Motion <= bluespeed; 
                    end 
            end 
        else 
            begin 
                platX9_Motion <= 0; 
                        blue_temp_platX9 <= platX9;  
            end 

        if(plat10_color == 3'b010 && outstate != 3'b011) 
            begin 
                if(platX10_Motion == 10'h0)
                    begin 
                        if(platX10 < 100 + blue_temp_platX10)
                            platX10_Motion <= bluespeed; 
                        else
                            platX10_Motion <= (1'b1 + ~bluespeed);
                    end 
                else 
                    begin 
                        if(platX10 > 100 + blue_temp_platX10 && platX10_Motion == bluespeed)
                            platX10_Motion <= (1'b1 + ~bluespeed); 
                        else if (platX10 < blue_temp_platX10 - 100 && platX10_Motion == (1'b1 + ~bluespeed))
                            platX10_Motion <= bluespeed; 
                    end 
            end 
        else 
            begin 
                platX10_Motion <= 0; 
                        blue_temp_platX10 <= platX10;  
            end 

        if(plat11_color == 3'b010 && outstate != 3'b011) 
            begin 
                if(platX11_Motion == 10'h0)
                    begin 
                        if(platX11 < 100 + blue_temp_platX11)
                            platX11_Motion <= bluespeed; 
                        else
                            platX11_Motion <= (1'b1 + ~bluespeed);
                    end 
                else 
                    begin 
                        if(platX11 > 100 + blue_temp_platX11 && platX11_Motion == bluespeed)
                            platX11_Motion <= (1'b1 + ~bluespeed); 
                        else if (platX11 < blue_temp_platX11 - 100 && platX11_Motion == (1'b1 + ~bluespeed))
                            platX11_Motion <= bluespeed; 
                    end 
            end 
        else 
            begin 
                platX11_Motion <= 0; 
                        blue_temp_platX11 <= platX11;  
            end

        if(plat12_color == 3'b010 && outstate != 3'b011) 
            begin 
                if(platX12_Motion == 10'h0)
                    begin 
                        if(platX12 < 100 + blue_temp_platX12)
                            platX12_Motion <= bluespeed; 
                        else
                            platX12_Motion <= (1'b1 + ~bluespeed);
                    end 
                else 
                    begin 
                        if(platX12 > 100 + blue_temp_platX12 && platX12_Motion == bluespeed)
                            platX12_Motion <= (1'b1 + ~bluespeed); 
                        else if (platX12 < blue_temp_platX12 - 100 && platX12_Motion == (1'b1 + ~bluespeed))
                            platX12_Motion <= bluespeed; 
                    end 
            end 
        else 
            begin 
                platX12_Motion <= 0; 
                        blue_temp_platX12 <= platX12;  
            end

        if(plat13_color == 3'b010 && outstate != 3'b011) 
            begin 
                if(platX13_Motion == 10'h0)
                    begin 
                        if(platX13 < 100 + blue_temp_platX13)
                            platX13_Motion <= bluespeed; 
                        else
                            platX13_Motion <= (1'b1 + ~bluespeed);
                    end 
                else 
                    begin 
                        if(platX13 > 100 + blue_temp_platX13 && platX13_Motion == bluespeed)
                            platX13_Motion <= (1'b1 + ~bluespeed); 
                        else if (platX13 < blue_temp_platX13 - 100 && platX13_Motion == (1'b1 + ~bluespeed))
                            platX13_Motion <= bluespeed; 
                    end 
            end 
        else 
            begin 
                platX13_Motion <= 0; 
                        blue_temp_platX13 <= platX13;  
            end 

        if(plat14_color == 3'b010 && outstate != 3'b011) 
            begin 
                if(platX14_Motion == 10'h0)
                    begin 
                        if(platX14 < 100 + blue_temp_platX14)
                            platX14_Motion <= bluespeed; 
                        else
                            platX14_Motion <= (1'b1 + ~bluespeed);
                    end 
                else 
                    begin 
                        if(platX14 > 100 + blue_temp_platX14 && platX14_Motion == bluespeed)
                            platX14_Motion <= (1'b1 + ~bluespeed); 
                        else if (platX14 < blue_temp_platX14 - 100 && platX14_Motion == (1'b1 + ~bluespeed))
                            platX14_Motion <= bluespeed; 
                    end 
            end 
        else 
            begin 
                platX14_Motion <= 0; 
                        blue_temp_platX14 <= platX14;  
            end 

        if(plat15_color == 3'b010 && outstate != 3'b011) 
            begin 
                if(platX15_Motion == 10'h0)
                    begin 
                        if(platX15 < 100 + blue_temp_platX15)
                            platX15_Motion <= bluespeed; 
                        else
                            platX15_Motion <= (1'b1 + ~bluespeed);
                    end 
                else 
                    begin 
                        if(platX15 > 100 + blue_temp_platX15 && platX15_Motion == bluespeed)
                            platX15_Motion <= (1'b1 + ~bluespeed); 
                        else if (platX15 < blue_temp_platX15 - 100 && platX15_Motion == (1'b1 + ~bluespeed))
                            platX15_Motion <= bluespeed; 
                    end 
            end 
        else 
            begin 
                platX15_Motion <= 0; 
                        blue_temp_platX15 <= platX15;  
            end    
    end 
always_ff@(posedge frame_clk)
    begin 
        if(testX > 9'h0 && testX <= 9'd100)
            readyX <= testX + 9'd100;
        else 
            readyX <= testX;
        if(testX1 > 9'h0 && testX1 <= 9'd100)
            readyX1 <= testX1 + 9'd100;
        else 
            readyX1 <= testX1;        
        if(testX2 > 9'h0 && testX2 <= 9'd100)
            readyX2 <= testX2 + 9'd100;
        else 
            readyX2 <= testX2;  
        if(testX3 > 9'h0 && testX3 <= 9'd100)
            readyX3 <= testX3 + 9'd100;
        else 
            readyX3 <= testX3;
        if(testX4 > 9'h0 && testX4 <= 9'd100)
            readyX4 <= testX4 + 9'd100;
        else 
            readyX4 <= testX4;
        if(testX5 > 9'h0 && testX5 <= 9'd100)
            readyX5 <= testX5 + 9'd100;
        else 
            readyX5 <= testX5;
        if(testX6 > 9'h0 && testX6 <= 9'd100)
            readyX6 <= testX6 + 9'd100;
        else 
            readyX6 <= testX6;
        if(testX7 > 9'h0 && testX7 <= 9'd100)
            readyX7 <= testX7 + 9'd100;
        else 
            readyX7 <= testX7;
        if(testX8 > 9'h0 && testX8 <= 9'd100)
            readyX8 <= testX8 + 9'd100;  
        else 
            readyX8 <= testX8;
        if(testX9 > 9'h0 && testX9 <= 9'd100)
            readyX9 <= testX9 + 9'd100;
        else 
            readyX9 <= testX9;
        if(testX10 > 9'h0 && testX10 <= 9'd100)
            readyX10 <= testX10 + 9'd100;
        else 
            readyX10 <= testX10;
        if(testX11 > 9'h0 && testX11 <= 9'd100)
            readyX11 <= testX11 + 9'd100;
        else 
            readyX11 <= testX11;
        if(testX12 > 9'h0 && testX12 <= 9'd100)
            readyX12 <= testX12 + 9'd100;
        else 
            readyX12 <= testX12;
        if(testX13 > 9'h0 && testX13 <= 9'd100)
            readyX13 <= testX13 + 9'd100;
        else 
            readyX13 <= testX13;
        if(testX14 > 9'h0 && testX14 <= 9'd100)
            readyX14 <= testX14 + 9'd100;  
        else 
            readyX14 <= testX14;
        if(testX15 > 9'h0 && testX15 <= 9'd100)
            readyX15 <= testX15 + 9'd100;
        else 
            readyX15 <= testX15;
    end
always_ff@(posedge frame_clk or posedge loadplat)
    begin 
        if(loadplat)
            begin 
                platX <= readyX; 
                platX1 <= readyX1; 
                platX2 <= readyX2; 
                platX3 <= readyX3; 
                platX4 <= readyX4; 
                platX5 <= readyX5; 
                platX6 <= readyX6; 
                platX7 <= readyX7; 
                platX8 <= readyX8; 
                platX9 <= readyX9;
                platX10 <= readyX10; 
                platX11 <= readyX11; 
                platX12 <= readyX12;
                platX13 <= readyX13; 
                platX14 <= readyX14; 
                platX15 <= readyX15;
            end
        else 
            begin  
                if(plat_offscreen[0])
                    platX <= readyX; 
                else if(plat0_color == 3'b011 && Platform_collision0 && platX < 250 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX <= platX + (platX >> 1); 
                else if(plat0_color == 3'b011 && Platform_collision0 && platX > 250 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX <= platX - (platX >> 1);
                else if (plat0_color == 3'b100 && PlatformBrown_collision0 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX <= 0;  
                else if (plat0_color == 3'b001 && Platform_collision0 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX <= 0;  
                else
                    platX <= platX + platX_Motion;

                if(plat_offscreen[1])
                    platX1 <= readyX; 
                else if(plat1_color == 3'b011 && Platform_collision1 && platX1 < 250 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX1 <= platX1 + (platX >> 1); 
                else if(plat1_color == 3'b011 && Platform_collision1 && platX1 > 250 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX1 <= platX1 - (platX >> 1);
                else if (plat1_color == 3'b100 && PlatformBrown_collision1 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX1 <= 0;  
                else if (plat1_color == 3'b001 && Platform_collision1 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX1 <= 0;  
                else
                    platX1 <= platX1 + platX1_Motion;

                if(plat_offscreen[2])
                    platX2 <= readyX; 
                else if(plat2_color == 3'b011 && Platform_collision2 && platX2 < 250 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX2 <= platX2 + (platX >> 1); 
                else if(plat2_color == 3'b011 && Platform_collision2 && platX2 > 250 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX2 <= platX2 - (platX >> 1);
                else if (plat2_color == 3'b100 && PlatformBrown_collision2 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX2 <= 0;  
                else if (plat2_color == 3'b001 && Platform_collision2 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX2 <= 0;  
                else
                    platX2 <= platX2 + platX2_Motion;        

                if(plat_offscreen[3])
                    platX3 <= readyX; 
                else if(plat3_color == 3'b011 && Platform_collision3 && platX3 < 250 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX3 <= platX3 + (platX >> 1); 
                else if(plat3_color == 3'b011 && Platform_collision3 && platX3 > 250 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX3 <= platX3 - (platX >> 1);
                else if (plat3_color == 3'b100 && PlatformBrown_collision3 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX3 <= 0;  
                else if (plat3_color == 3'b001 && Platform_collision3 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX3 <= 0;   
                else
                    platX3 <= platX3 + platX3_Motion;

                if(plat_offscreen[4])
                    platX4 <= readyX; 
                else if(plat4_color == 3'b011 && Platform_collision4 && platX4 < 250 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX4 <= platX4 + (platX >> 1); 
                else if(plat4_color == 3'b011 && Platform_collision4 && platX4 > 250 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX4 <= platX4 - (platX >> 1);
                else if (plat4_color == 3'b100 && PlatformBrown_collision4 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX4 <= 0;  
                else if (plat4_color == 3'b001 && Platform_collision4 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX4 <= 0;  
                else
                    platX4 <= platX4 + platX4_Motion;

                if(plat_offscreen[5])
                    platX5 <= readyX; 
                else if(plat5_color == 3'b011 && Platform_collision5 && platX5 < 250 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX5 <= platX5 + (platX >> 1); 
                else if(plat5_color == 3'b011 && Platform_collision5 && platX5 > 250 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX5 <= platX5 - (platX >> 1);
                else if (plat5_color == 3'b100 && PlatformBrown_collision5 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX5 <= 0;  
                else if (plat5_color == 3'b001 && Platform_collision5 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX5 <= 0;  
                else
                    platX5 <= platX5 + platX5_Motion;
                if(plat_offscreen[6])
                    platX6 <= readyX; 
                else if(plat6_color == 3'b011 && Platform_collision6 && platX6 < 250 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX6 <= platX6 + (platX >> 1); 
                else if(plat6_color == 3'b011 && Platform_collision6 && platX6 > 250 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX6 <= platX6 - (platX >> 1);
                else if (plat6_color == 3'b100 && PlatformBrown_collision6 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX6 <= 0;  
                else if (plat6_color == 3'b001 && Platform_collision6 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX6 <= 0; 
                else
                    platX6 <= platX6 + platX6_Motion;

                if(plat_offscreen[7])
                    platX7 <= readyX; 
                else if(plat7_color == 3'b011 && Platform_collision7 && platX7 < 250 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX7 <= platX7 + (platX >> 1); 
                else if(plat7_color == 3'b011 && Platform_collision7 && platX7 > 250 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX7 <= platX7 - (platX >> 1);
                else if (plat7_color == 3'b100 && PlatformBrown_collision7 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX7 <= 0;  
                else if (plat7_color == 3'b001 && Platform_collision7 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX7 <= 0;  
                else
                    platX7 <= platX7 + platX7_Motion;

                if(plat_offscreen[8])
                    platX8 <= readyX; 
                else if(plat8_color == 3'b011 && Platform_collision8 && platX8 < 250 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX8 <= platX8 + (platX >> 1); 
                else if(plat8_color == 3'b011 && Platform_collision8 && platX8 > 250 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX8 <= platX8 - (platX >> 1);
                else if (plat8_color == 3'b100 && PlatformBrown_collision8 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX8 <= 0;  
                else if (plat8_color == 3'b001 && Platform_collision8 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX8 <= 0;  
                else
                    platX8 <= platX8 + platX8_Motion;    

                if(plat_offscreen[9])
                    platX9 <= readyX; 
                else if(plat9_color == 3'b011 && Platform_collision9 && platX9 < 250 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX9 <= platX9 + (platX >> 1); 
                else if(plat9_color == 3'b011 && Platform_collision9 && platX9 > 250 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX9 <= platX9 - (platX >> 1);
                else if (plat9_color == 3'b100 && PlatformBrown_collision9 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX9 <= 0;  
                else if (plat9_color == 3'b001 && Platform_collision9 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX9 <= 0;  
                else
                    platX9 <= platX9 + platX9_Motion;

                if(plat_offscreen[10])
                    platX10 <= readyX; 
                else if(plat10_color == 3'b011 && Platform_collision10 && platX10 < 250 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX10 <= platX10 + (platX >> 1); 
                else if(plat10_color == 3'b011 && Platform_collision10 && platX10 > 250 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX10 <= platX10 - (platX >> 1);
                else if (plat10_color == 3'b100 && PlatformBrown_collision10 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX10 <= 0;  
                else if (plat10_color == 3'b001 && Platform_collision10 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX10 <= 0;  
                else
                    platX10 <= platX10 + platX10_Motion;

                if(plat_offscreen[11])
                    platX11 <= readyX; 
                else if(plat11_color == 3'b011 && Platform_collision11 && platX11 < 250 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX11 <= platX11 + (platX >> 1); 
                else if(plat11_color == 3'b011 && Platform_collision11 && platX11 > 250 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX11 <= platX11 - (platX >> 1);
                else if (plat11_color == 3'b100 && PlatformBrown_collision11 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX11 <= 0;  
                else if (plat11_color == 3'b001 && Platform_collision11 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX11 <= 0;  
                else
                    platX11 <= platX11 + platX11_Motion;        

                if(plat_offscreen[12])
                    platX12 <= readyX; 
                else if(plat12_color == 3'b011 && Platform_collision12 && platX12 < 250 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX12 <= platX12 + (platX >> 1); 
                else if(plat12_color == 3'b011 && Platform_collision12 && platX12 > 250 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX12 <= platX12 - (platX >> 1);
                else if (plat12_color == 3'b100 && PlatformBrown_collision11 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX12 <= 0;  
                else if (plat12_color == 3'b001 && Platform_collision11 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX12 <= 0;  
                else
                    platX12 <= platX12 + platX12_Motion;

                if(plat_offscreen[13])
                    platX13 <= readyX; 
                else if(plat13_color == 3'b011 && Platform_collision13 && platX13 < 250 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX13 <= platX13 + (platX >> 1); 
                else if(plat13_color == 3'b011 && Platform_collision13 && platX13 > 250 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX13 <= platX13 - (platX >> 1);
                else if (plat13_color == 3'b100 && PlatformBrown_collision13 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX13 <= 0;  
                else if (plat13_color == 3'b001 && Platform_collision13 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX13 <= 0;  
                else
                    platX13 <= platX13 + platX13_Motion;

                if(plat_offscreen[14])
                    platX14 <= readyX; 
                else if(plat14_color == 3'b011 && Platform_collision14 && platX14 < 250 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX14 <= platX14 + (platX >> 1); 
                else if(plat14_color == 3'b011 && Platform_collision14 && platX14 > 250 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX14 <= platX14 - (platX >> 1);
                else if (plat14_color == 3'b100 && PlatformBrown_collision13 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX14 <= 0;  
                else if (plat14_color == 3'b001 && Platform_collision13 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX14 <= 0;  
                else
                    platX14 <= platX14 + platX14_Motion;
                if(plat_offscreen[15])
                    platX15 <= readyX; 
                else if(plat15_color == 3'b011 && Platform_collision15 && platX15 < 250 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX15 <= platX15 + (platX >> 1); 
                else if(plat15_color == 3'b011 && Platform_collision15 && platX15 > 250 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX15 <= platX15 - (platX >> 1);
                else if (plat15_color == 3'b100 && Platform_collision15 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX15 <= 0;  
                else if (plat15_color == 3'b001 && PlatformBrown_collision15 && Doodle_Y_Motion >= 10'd3 && Doodle_Y_Motion <= 10'd7)
                    platX15 <= 0;  
                else
                    platX15 <= platX15 + platX_Motion;
            end 
    end 
counter counterplat(
	.Reset(plat_reset), 
	.enable(plat_enable), 
    .Clk(Clk), 

    .out(countingplat[31:0])
);
countdown countdown(
    .Reset(plat_reset),
    .enable(plat_enable),
    .Clk(frame_clk), 
    .seed((6'h25 - airtime[5:0])), 
    
    .temp(temp),
    .done(stop_refresh_flag)
);

logic [15:0] plat_offscreen; 
//~~~~~~~~~~~~~~~ tracks if a platforms has exited the bottom of the screen, loads in different color plats~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
always_ff @ (posedge Clk)
    begin 
        unique case(outstate)
        3'b000, 3'b001:
            begin
                plat0_trigger <= 3'b000;
                plat1_trigger <= 3'b001;
                plat2_trigger <= 3'b010;
                plat3_trigger <= 3'b000;
                plat4_trigger <= 3'b010;
                plat5_trigger <= 3'b010;
                plat6_trigger <= 3'b000;
                plat7_trigger <= 3'b000;
                plat8_trigger <= 3'b100;
                plat9_trigger <= 3'b000;
                plat10_trigger <= 3'b000;
                plat11_trigger <= 3'b000;
                plat12_trigger <= 3'b010;
                plat13_trigger <= 3'b100;
                plat14_trigger <= 3'b000;
                plat15_trigger <= 3'b000;
            end
        default:
        begin 
            if(platY - plat_sizeY >= 9'd480)
                begin
                    plat_offscreen[0] = 1;
                    if(!Score[0])
                        plat0_trigger <= 3'b000; // green 
                    else if (Score[1])
                        plat0_trigger <= 3'b010; // blue 
                    else if(plat15_color == 3'b000 || plat15_color == 3'b010 && plat1_color == 3'b000 || plat1_color == 3'b010)
                        plat0_trigger <= 3'b100; // brown 
                    else if (Score[2])
                        plat0_trigger <= 3'b011; // yellow
                    else if (!Score[2])
                        plat0_trigger <= 3'b001; // white 
                end
            else   
                plat_offscreen[0] = 0;  
            if(platY1 - plat_sizeY >= 9'd480)
                begin
                    plat_offscreen[1] = 1;
                    if(!Score[0])
                        plat1_trigger <= 3'b000;
                    else if (Score[1])
                        plat1_trigger <= 3'b010;
                    else if (Score[2])
                        plat2_trigger <= 3'b011;
                    else if (!Score[2])
                        plat1_trigger <= 3'b001;
                    else if(plat0_color == 3'b000 || plat0_color == 3'b010 && plat2_color == 3'b000 || plat2_color == 3'b010)
                        plat1_trigger <= 3'b100;
                end
            else   
                plat_offscreen[1] = 0;  
            if(platY2 - plat_sizeY >= 9'd480)
                begin
                plat_offscreen[2] = 1;
                    if(!Score[0])
                        plat2_trigger <= 3'b000;
                    else if (Score[1])
                        plat2_trigger <= 3'b010;
                    else if (Score[2])
                        plat2_trigger <= 3'b011;
                    else if (!Score[2])
                        plat2_trigger <= 3'b001;
                    else if(plat1_color == 3'b000 || plat1_color == 3'b010 && plat3_color == 3'b000 || plat3_color == 3'b010)
                        plat2_trigger <= 3'b100;
                end 
            else   
                plat_offscreen[2] = 0;  
            if(platY3 - plat_sizeY >= 9'd480)
                begin
                plat_offscreen[3] = 1;
                    if(!Score[0])
                        plat3_trigger <= 3'b000;
                    else if (Score[1])
                        plat3_trigger <= 3'b010;
                    else if (Score[2])
                        plat3_trigger <= 3'b011;
                    else if (!Score[2])
                        plat3_trigger <= 3'b001;
                    else if(plat2_color == 3'b000 || plat2_color == 3'b010 && plat4_color == 3'b000 || plat4_color == 3'b010)
                        plat3_trigger <= 3'b100;
                end 
            else   
                plat_offscreen[3] = 0;  
            if(platY4 - plat_sizeY >= 9'd480)
                begin
                plat_offscreen[4] = 1;
                    if(!Score[0])
                        plat4_trigger <= 3'b000;
                    else if (Score[1])
                        plat4_trigger <= 3'b010;
                    else if (Score[2])
                        plat4_trigger <= 3'b011;
                    else if (!Score[2])
                        plat4_trigger <= 3'b001;
                    else if(plat3_color == 3'b000 || plat3_color == 3'b010 && plat5_color == 3'b000 || plat5_color == 3'b010)
                        plat4_trigger <= 3'b100;
                end 
            else   
                plat_offscreen[4] = 0;  
            if(platY5 - plat_sizeY >= 9'd480)
                begin
                plat_offscreen[5] = 1;
                    if(!Score[0])
                        plat5_trigger <= 3'b000;
                    else if (Score[1])
                        plat5_trigger <= 3'b010;
                    else if (Score[2])
                        plat5_trigger <= 3'b011;
                    else if (!Score[2])
                        plat5_trigger <= 3'b001;
                    else if(plat4_color == 3'b000 || plat4_color == 3'b010 && plat6_color == 3'b000 || plat6_color == 3'b010)
                        plat5_trigger <= 3'b100;
                end 
            else   
                plat_offscreen[5] = 0;  
            if(platY6 - plat_sizeY >= 9'd480)
                begin
                plat_offscreen[6] = 1;
                    if(!Score[0])
                        plat6_trigger <= 3'b000;
                    else if (Score[1])
                        plat6_trigger <= 3'b010;
                    else if (Score[2])
                        plat6_trigger <= 3'b011;
                    else if (!Score[2])
                        plat6_trigger <= 3'b001;
                    else if(plat5_color == 3'b000 || plat5_color == 3'b010 && plat7_color == 3'b000 || plat7_color == 3'b010)
                        plat6_trigger <= 3'b100;
                end 
            else   
                plat_offscreen[6] = 0;  
            if(platY7 - plat_sizeY >= 9'd480)
                begin
                plat_offscreen[7] = 1;
                    if(!Score[0])
                        plat7_trigger <= 3'b000;
                    else if (Score[1])
                        plat7_trigger <= 3'b010;
                    else if(plat6_color == 3'b000 || plat6_color == 3'b010 && plat8_color == 3'b000 || plat8_color == 3'b010)
                        plat7_trigger <= 3'b100; 
                    else if (Score[2])
                        plat7_trigger <= 3'b011;
                    else if (!Score[2])
                        plat7_trigger <= 3'b001;
                end 
            else   
                plat_offscreen[7] = 0;  
            if(platY8 - plat_sizeY >= 9'd480)
                begin
                plat_offscreen[8] = 1;
                    if(!Score[0])
                        plat8_trigger <= 3'b000;
                    else if (Score[1])
                        plat8_trigger <= 3'b010;
                    else if (Score[2])
                        plat8_trigger <= 3'b011;
                    else if (!Score[2])
                        plat8_trigger <= 3'b001;
                    else if(plat7_color == 3'b000 || plat7_color == 3'b010 && plat9_color == 3'b000 || plat9_color == 3'b010)
                        plat8_trigger <= 3'b100;
                end 
            else   
                plat_offscreen[8] = 0;  
            if(platY9 - plat_sizeY >= 9'd480)
                begin
                plat_offscreen[9] = 1;
                    if(!Score[0])
                        plat9_trigger <= 3'b000;
                    else if (Score[1])
                        plat9_trigger <= 3'b010;
                    else if (Score[12])
                        plat9_trigger <= 3'b011;
                    else if (!Score[2])
                        plat9_trigger <= 3'b001;
                    else if(plat8_color == 3'b000 || plat8_color == 3'b010 && plat10_color == 3'b000 || plat10_color == 3'b010)
                        plat9_trigger <= 3'b100;
                end 
            else   
                plat_offscreen[9] = 0;  
            if(platY10 - plat_sizeY >= 9'd480)
                begin
                plat_offscreen[10] = 1;
                    if(!Score[0])
                        plat10_trigger <= 3'b000;
                    else if (Score[1])
                        plat10_trigger <= 3'b010;
                    else if (Score[2])
                        plat10_trigger <= 3'b011;
                    else if (!Score[2])
                        plat10_trigger <= 3'b001;
                    else if(plat9_color == 3'b000 || plat9_color == 3'b010 && plat11_color == 3'b000 || plat11_color == 3'b010)
                        plat10_trigger <= 3'b100;
                end 
            else   
                plat_offscreen[10] = 0;  
            if(platY11 - plat_sizeY >= 9'd480)
                begin
                plat_offscreen[11] = 1;
                    if(!Score[0])
                        plat11_trigger <= 3'b000;
                    else if (Score[1])
                        plat11_trigger <= 3'b010;
                    else if (Score[2])
                        plat11_trigger <= 3'b011;
                    else if (!Score[2])
                        plat11_trigger <= 3'b001;
                    else if(plat10_color == 3'b000 || plat10_color == 3'b010 && plat12_color == 3'b000 || plat12_color == 3'b010)
                        plat11_trigger <= 3'b100;
                end 
            else   
                plat_offscreen[11] = 0;  
            if(platY12 - plat_sizeY >= 9'd480)
                begin
                plat_offscreen[12] = 1;
                    if(!Score[0])
                        plat12_trigger <= 3'b000;
                    else if (Score[1])
                        plat12_trigger <= 3'b010;
                    else if (Score[2])
                        plat12_trigger <= 3'b011;
                    else if (!Score[2])
                        plat12_trigger <= 3'b001;
                    else if(plat11_color == 3'b000 || plat11_color == 3'b010 && plat13_color == 3'b000 || plat13_color == 3'b010)
                        plat12_trigger <= 3'b100;
                end 
            else   
                plat_offscreen[12] = 0;  
            if(platY13 - plat_sizeY >= 9'd480)
                begin
                plat_offscreen[13] = 1;
                    if(!Score[0])
                        plat13_trigger <= 3'b000;
                    else if (Score[1])
                        plat13_trigger <= 3'b010;
                    else if (Score[2])
                        plat13_trigger <= 3'b011;
                    else if (!Score[2])
                        plat13_trigger <= 3'b001;
                    else if(plat12_color == 3'b000 || plat12_color == 3'b010 && plat14_color == 3'b000 || plat14_color == 3'b010)
                        plat13_trigger <= 3'b100;
                end 
            else   
                plat_offscreen[13] = 0;  
            if(platY14 - plat_sizeY >= 9'd480)
                begin
                plat_offscreen[14] = 1;
                    if(!Score[0])
                        plat14_trigger <= 3'b000;
                    else if (Score[1])
                        plat14_trigger <= 3'b010;
                    else if (Score[2])
                        plat14_trigger <= 3'b011;
                    else if (!Score[2])
                        plat14_trigger <= 3'b001;
                    else if(plat13_color == 3'b000 || plat13_color == 3'b010 && plat15_color == 3'b000 || plat15_color == 3'b010)
                        plat14_trigger <= 3'b100;
                end 
            else   
                plat_offscreen[14] = 0;  
            if(platY15 - plat_sizeY >= 9'd480)
                begin
                plat_offscreen[15] = 1;
                    if(!Score[0])
                        plat15_trigger <= 3'b000;
                    else if (Score[1])
                        plat15_trigger <= 3'b010;
                    else if (Score[2])
                        plat15_trigger <= 3'b011;
                    else if (!Score[2])
                        plat15_trigger <= 3'b001;
                    else if(plat14_color == 3'b000 || plat14_color == 3'b010 && plat0_color == 3'b000 || plat0_color == 3'b010)
                        plat15_trigger <= 3'b100;
                end 
            else   
                plat_offscreen[15] = 0;  
        end
        endcase 
    end 
//~~~~~~~~~~~~~~~~~~~~~~~performs correct displacement of platforms that should allow scrolling
always_ff @ (posedge frame_clk or posedge loadplat)
    begin 
        // initial Y values of the platforms before anything
		    
        unique case(outstate)
        //init 
        3'b101:
            begin 
                plat_reset <= 1;  
                plat_enable <= 1; 
                trigger <= 0; 
            end              
        //main menu 
        3'b000: 
            begin 
                plat_reset <= 1;  
                plat_enable <= 1; 
                trigger <= 0; 
            end 
        // loading 
        3'b001:
            begin 
                plat_reset <= 1;  
                plat_enable <= 1; 
                trigger <= 0; 
            end         
        // game 
        3'b010: 
            begin 
                plat_reset <= 1;  
                plat_enable <= 1; 
                trigger <= 0; 
            end 
        // pause 
        3'b011:
            begin   
                trigger <= 0; 
            end 
        // refreshing 
        3'b100: 
            begin 
                plat_reset <= 0; 
                plat_enable <= 0; 
                if(stop_refresh_flag)
                    begin 
                        trigger <= 1; 
                    end 
                else 
                    trigger <= 0; 
            end
        // game over
        3'b110: 
            begin 
                plat_reset <= 1;  
                plat_enable <= 1; 
                trigger <= 0; 
            end  
        endcase 
        // if we have the need to refresh the platforms 
        if(loadplat)
            begin 
                platY   <= 9'd30;
                platY1  <= 9'd60;
                platY2 <= 9'd90;
                platY3 <= 9'd120;
                platY4 <= 9'd150;
                platY5 <= 9'd180;
                platY6 <= 9'd210;
                platY7 <= 9'd240;
                platY8 <= 9'd270;
                platY9 <= 8'd300;
                platY10 <= 9'd330;
                platY11 <= 9'd360;
                platY12 <= 9'd390;
                platY13 <= 9'd420;
                platY14 <= 9'd450;
                platY15 <= 9'd475;
            end 
        else if (outstate == 3'b000)
            begin 
                platY  <= 0; 
                platY1 <= 0; 
                platY2 <= 0; 
                platY3 <= 0; 
                platY4 <= 0; 
                platY5 <= 0; 
                platY6 <= 0; 
                platY7 <= 0; 
                platY8 <= 0; 
                platY9 <= 0; 
                platY10 <= 0; 
                platY11 <= 0; 
                platY12 <= 0; 
                platY13 <= 0; 
                platY14 <= 0; 
                platY15 <= 0; 
            end 
        else if(outstate == 3'b110)
            begin 
                if(platY <= 25)
                    platY <= 0;
                else 
                    platY  <= platY + plat_temp_Y;
                if(platY1 <= 25)
                    platY1 <= 0; 
                else 
                    platY1 <= platY1 + plat_temp_Y;
                if(platY2 <= 25)
                    platY2 <= 0;
                else 
                    platY2 <= platY2 + plat_temp_Y; 
                if(platY3 <= 25)
                    platY3 <= 0;
                else 
                    platY3 <= platY3 + plat_temp_Y;
                if(platY4 <= 25)
                    platY4 <= 0;
                else 
                    platY4 <= platY4 + plat_temp_Y;
                if(platY5 <= 25)
                    platY5 <= 0;
                else 
                    platY5 <= platY5 + plat_temp_Y;
                if(platY6 <= 25)
                    platY6 <= 0;
                else 
                    platY6 <= platY6 + plat_temp_Y;
                if(platY7 <= 25)
                    platY7 <= 0;
                else 
                    platY7 <= platY7 + plat_temp_Y;
                if(platY8 <= 25)
                    platY8 <= 0;
                else
                    platY8 <= platY8 + plat_temp_Y;
                if(platY9 <= 25)
                    platY9 <= 0;
                else 
                    platY9 <= platY9 + plat_temp_Y;
                if(platY10 <= 25)
                    platY10 <= 0;
                else 
                    platY10 <= platY10 + plat_temp_Y;
                if(platY11 <= 25)
                    platY11 <= 0;
                else 
                    platY11 <= platY11 + plat_temp_Y;
                if(platY12 <= 25)
                    platY12 <= 0;
                else 
                    platY12 <= platY12 + plat_temp_Y;
                if(platY13 <= 25)
                    platY13 <= 0;
                else 
                    platY13 <= platY13 + plat_temp_Y;
                if(platY14 <= 25)
                    platY14 <= 0;
                else 
                    platY14 <= platY14 + plat_temp_Y;
                if(platY15 <= 25)
                    platY15 <= 0;
                else 
                    platY15 <= platY15 + plat_temp_Y;

            end  
        else 
            begin 
                platY  <= platY - plat_temp_Y;
                platY1 <= platY1 - plat_temp_Y;
                platY2 <= platY2 - plat_temp_Y;
                platY3 <= platY3 - plat_temp_Y;
                platY4 <= platY4 - plat_temp_Y;
                platY5 <= platY5 - plat_temp_Y;
                platY6 <= platY6 - plat_temp_Y;
                platY7 <= platY7 - plat_temp_Y;
                platY8 <= platY8 - plat_temp_Y;
                platY9 <= platY9 - plat_temp_Y;
                platY10 <= platY10 - plat_temp_Y;
                platY11 <= platY11 - plat_temp_Y;
                platY12 <= platY12 - plat_temp_Y;
                platY13 <= platY13 - plat_temp_Y;
                platY14 <= platY14 - plat_temp_Y;
                platY15 <= platY15 - plat_temp_Y;
            end   
    end
// ?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
// ?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
// ?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
// ??????????????????????????????????????????BEGIN COLOR MAPPER     ??????????????????????????????????????????
// ?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
// ?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
// ?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????


    logic monster_on; 
    always_comb 
    begin:Monster_on_proc 
         if ((DrawX >= monsterX - monstersizeX) &&
            (DrawX <= monsterX + monstersizeX) &&
            (DrawY >= monsterY - monstersizeY) &&
            (DrawY <= monsterY + monstersizeY))
        begin 
			  if (monster_BKG_out != 24'hfe43e3)
					monster_on = 1'b1;
			  else 
					monster_on = 1'b0;
        end 
        else 
            monster_on = 1'b0; 
    end 
    logic cannon_on; 
    always_comb
    begin:Cannon_on_proc
         if ((DrawX >= CannonX - CannonS) &&
            (DrawX <= CannonX + CannonS) &&
            (DrawY >= CannonY - CannonS) &&
            (DrawY <= CannonY + CannonS)) 
        begin 
            if(cannon_BKG_out != 24'hfe43e3)
                cannon_on = 1'b1;
            else 
                cannon_on = 1'b0;
        end 
        else 
            cannon_on = 1'b0; 
    end 

    logic cannon_on1; 
    always_comb
    begin:Cannon_on_proc1
         if ((DrawX >= CannonX1 - CannonS) &&
            (DrawX <= CannonX1 + CannonS) &&
            (DrawY >= CannonY1 - CannonS) &&
            (DrawY <= CannonY1 + CannonS)) 
        begin 
            if(cannon1_BKG_out != 24'hfe43e3)
                cannon_on1 = 1'b1;
            else 
                cannon_on1 = 1'b0;
        end 
        else 
            cannon_on1 = 1'b0; 
    end 

    logic cannon_on2; 
    always_comb
    begin:Cannon_on_proc2
         if ((DrawX >= CannonX2 - CannonS) &&
            (DrawX <= CannonX2 + CannonS) &&
            (DrawY >= CannonY2 - CannonS) &&
            (DrawY <= CannonY2 + CannonS)) 
        begin 
            if(cannon2_BKG_out != 24'hfe43e3)
                cannon_on2 = 1'b1;
            else 
                cannon_on2 = 1'b0;
        end 
        else 
            cannon_on2 = 1'b0; 
    end 
       
// ~~~~~~~~~ POWERUP ~~~~~~~~~~~~~~~~~~~~~~~~~ this should cause for the platforms to be drawn on the screen 
logic spring_on; 
    always_comb 
    begin: spring_on_proc 
            if ((DrawX >= springX - springsizeX) &&
                (DrawX <= springX + springsizeX) &&
                (DrawY >= springY - springsizeY) &&
                (DrawY <= springY + springsizeY) && (outstate != 3'b101 || outstate != 3'b000)) 
                spring_on = 1'b1; 
            else 
                spring_on = 1'b0;     
        end 
    logic spring1_on; 
    always_comb 
    begin: spring1_on_proc 
            if ((DrawX >= springX1 - springsizeX) &&
                (DrawX <= springX1 + springsizeX) &&
                (DrawY >= springY1 - springsizeY) &&
                (DrawY <= springY1 + springsizeY) && (outstate != 3'b101 || outstate != 3'b000)) 
                spring1_on = 1'b1; 
            else 
                spring1_on = 1'b0;     
        end 
    logic spring2_on; 
    always_comb 
    begin: spring2_on_proc 
            if ((DrawX >= springX2 - springsizeX) &&
                (DrawX <= springX2 + springsizeX) &&
                (DrawY >= springY2 - springsizeY) &&
                (DrawY <= springY2 + springsizeY) && (outstate != 3'b101 || outstate != 3'b000)) 
                spring2_on = 1'b1; 
            else 
                spring2_on = 1'b0;     
        end 
    logic spring3_on; 
    always_comb 
    begin: spring3_on_proc 
            if ((DrawX >= springX3 - springsizeX) &&
                (DrawX <= springX3 + springsizeX) &&
                (DrawY >= springY3 - springsizeY) &&
                (DrawY <= springY3 + springsizeY) && (outstate != 3'b101 || outstate != 3'b000)) 
                spring3_on = 1'b1; 
            else 
                spring3_on = 1'b0;     
        end 
    logic rocket_on; 
    always_comb
    begin: rocket_on_proc 
            if ((DrawX >= rocketX - rocketsizeX) &&
                (DrawX <= rocketX + rocketsizeX) &&
                (DrawY >= rocketY - rocketsizeY) &&
                (DrawY <= rocketY + rocketsizeY) && (outstate != 3'b101 || outstate != 3'b000)) 
                rocket_on = 1'b1; 
            else 
                rocket_on = 1'b0; 
				end
//~~~~~~~~~~PLATFORMS~~~~~~~~~~~~~~~~~~~~~~~ this should cause for the platforms to be drawn on the screen 
// main menu platforms
    logic platform_easy_on; 
    assign plat_size_easy_X = 9'd230;
    assign plat_size_easy_Y = 8'd200;
    always_comb
    begin:Platform_easy_on_proc
            if ((DrawX >= plat_size_easy_X - plat_sizeX) &&
                (DrawX <= plat_size_easy_X + plat_sizeX) &&
                (DrawY >= plat_size_easy_Y - plat_sizeY) &&
                (DrawY <= plat_size_easy_Y + plat_sizeY) && (outstate == (6'd0))) 
                platform_easy_on = 1'b1; 
            else 
                platform_easy_on = 1'b0;
        end 
    
    logic platform_medium_on; 
    assign plat_size_medium_X = 9'd330;
    assign plat_size_medium_Y = 8'd200;
    always_comb
    begin:Platform_medium_on_proc
            if ((DrawX >= plat_size_medium_X - plat_sizeX) &&
                (DrawX <= plat_size_medium_X + plat_sizeX) &&
                (DrawY >= plat_size_medium_Y - plat_sizeY) &&
                (DrawY <= plat_size_medium_Y + plat_sizeY) && (outstate == (6'd0))) 
                platform_medium_on = 1'b1; 
            else 
                platform_medium_on = 1'b0;
        end

    logic platform_hard_on; 
    assign plat_size_hard_X = 9'd430;
    assign plat_size_hard_Y = 8'd200;
    always_comb
    begin:Platform_hard_on_proc
            if ((DrawX >= plat_size_hard_X - plat_sizeX) &&
                (DrawX <= plat_size_hard_X + plat_sizeX) &&
                (DrawY >= plat_size_hard_Y - plat_sizeY) &&
                (DrawY <= plat_size_hard_Y + plat_sizeY) && (outstate == (6'd0))) 
                platform_hard_on = 1'b1; 
            else 
                platform_hard_on = 1'b0;
        end
   
// writing to the screen
cannon_ram cannon_ram(
    .read_address(cannon_ram_address[6:0]),
    .Clk(Clk), 

    .data_Out(cannon_BKG_out[23:0])
);
cannon_ram1 cannon_ram1(
    .read_address(cannon1_ram_address[6:0]),
    .Clk(Clk), 

    .data_Out(cannon1_BKG_out[23:0])
);  
cannon_ram2 cannon_ram2(
    .read_address(cannon2_ram_address[6:0]),
    .Clk(Clk), 

    .data_Out(cannon2_BKG_out[23:0])
); 

// ram for each of the backgrounds
BKG_ram BKG(
    .read_address(BKG_address[12:0]),
    .Clk(Clk), 

    .data_Out(underwater_BKG_out[23:0])
); 

BKG2_ram BKG2(
    .read_address(BKG_address2[12:0]),
    .Clk(Clk), 

    .data_Out2(soccer_BKG_out[23:0])
); 


BKG4_ram BKG4(
    .read_address(BKG_address4[15:0]),
    .Clk(Clk), 

    .data_Out4(space_BKG_out[23:0])
); 

// ram for doodle characters
Doodle_right_ram DRR(
    .read_address3(doodle_right_address[10:0]),
    .Clk(Clk), 

    .data_Out3(doodle_right_BKG_out[23:0])
); 
Doodle_left_ram DLR(
    .read_address5(doodle_left_address[10:0]),
    .Clk(Clk), 

    .data_Out5(doodle_left_BKG_out[23:0])
); 

Doodle_rightC_ram DRRC(
    .read_address3(doodle_right_address[10:0]),
    .Clk(Clk), 

    .data_Out3(doodle_rightC_BKG_out[23:0])
); 
Doodle_leftC_ram DLRC(
    .read_address5(doodle_left_address[10:0]),
    .Clk(Clk), 

    .data_Out5(doodle_leftC_BKG_out[23:0])
); 

// ram for the platforms
greenplat16 greenplat16(
    .read_address(greenplat16addr[7:0]),
    .Clk(Clk), 

    .data_Out(greenplat16_out[23:0])
); 

greenplat32 greenplat32_8(
    .read_address(greenplat32addr[8:0]),
    .Clk(Clk), 

    .data_Out(greenplat32_out[23:0])
); 

greenplat64 greenplat64_9(
    .read_address(greenplat64addr[9:0]),
    .Clk(Clk), 

    .data_Out(greenplat64_out[23:0])
); 

// ram for springs and rocket 
spring_ram spring_ram(
    .read_address(spring_addr[8:0]),
    .Clk(Clk), 

    .data_Out(spring_out[23:0])
); 
jetpack_ram jetpack_ram(
    .read_address(jetpack_addr[8:0]),
    .Clk(Clk), 

    .data_Out(jetpack_out[23:0])
); 

logic [8:0] spring_addr, jetpack_addr; 
logic [23:0] jetpack_out, spring_out; 

logic [7:0] greenplat16addr;
logic [8:0] greenplat32addr;
logic [9:0] greenplat64addr;
logic [23:0] greenplat16_out, greenplat32_out, greenplat64_out;

logic direction; 

doodle_direction doodle_direction(
    .Clock(Clk),
    .Reset(Reset),
    .frame_clk(frame_clk), 
    .Keycode(keycode), 

    .direction(direction)
    
);
monster_ram monster_ram(
    .read_address(monster_addr[8:0]),
    .Clk(Clk), 

    .data_Out(monster_BKG_out[23:0])

);
Zero zero(
    .read_address_zero(BKG_address_zero[10:0]),
    .Clk(Clk), 

    .data_Out_zero(zero_BKG_out[23:0])
); 

One one(
    .read_address_one(BKG_address_one[10:0]),
    .Clk(Clk), 

    .data_Out_one(one_BKG_out[23:0])
); 

Two two(
    .read_address_two(BKG_address_two[10:0]),
    .Clk(Clk), 

    .data_Out_two(two_BKG_out[23:0])
); 

Three three(
    .read_address_three(BKG_address_three[10:0]),
    .Clk(Clk), 

    .data_Out_three(three_BKG_out[23:0])
); 

Four four(
    .read_address_four(BKG_address_four[10:0]),
    .Clk(Clk), 

    .data_Out_four(four_BKG_out[23:0])
); 

Five five(
    .read_address_five(BKG_address_five[10:0]),
    .Clk(Clk), 

    .data_Out_five(five_BKG_out[23:0])
); 

Six six(
    .read_address_six(BKG_address_six[10:0]),
    .Clk(Clk), 

    .data_Out_six(six_BKG_out[23:0])
); 

Seven seven(
    .read_address_seven(BKG_address_seven[10:0]),
    .Clk(Clk), 

    .data_Out_seven(seven_BKG_out[23:0])
); 

Eight eight(
    .read_address_eight(BKG_address_eight[10:0]),
    .Clk(Clk), 

    .data_Out_eight(eight_BKG_out[23:0])
); 

Nine nine(
    .read_address_nine(BKG_address_nine[10:0]),
    .Clk(Clk), 

    .data_Out_nine(nine_BKG_out[23:0])
); 

// A a(
//     .read_address_A(BKG_address_A[10:0]),
//     .Clk(Clk), 

//     .data_Out_A(A_BKG_out[23:0])
// ); 

// B b(
//     .read_address_B(BKG_address_B[10:0]),
//     .Clk(Clk), 

//     .data_Out_B(B_BKG_out[23:0])
// ); 


C c(
    .read_address(BKG_address_C[10:0]),
    .Clk(Clk), 

    .data_Out(C_BKG_out[23:0])
); 

D d(
    .read_address(BKG_address_D[10:0]),
    .Clk(Clk), 

    .data_Out(D_BKG_out[23:0])
); 

E e(
    .read_address(BKG_address_E[10:0]),
    .Clk(Clk), 

    .data_Out(E_BKG_out[23:0])
); 

// F f(
//     .read_address(BKG_address_F[10:0]),
//     .Clk(Clk), 

//     .data_Out(F_BKG_out[23:0])
// ); 

G g(
    .read_address(BKG_address_G[10:0]),
    .Clk(Clk), 

    .data_Out(G_BKG_out[23:0])
); 

// H h(
//     .read_address(BKG_address_H[10:0]),
//     .Clk(Clk), 

//     .data_Out(H_BKG_out[23:0])
// ); 

// I i(
//     .read_address(BKG_address_I[10:0]),
//     .Clk(Clk), 

//     .data_Out(I_BKG_out[23:0])
// ); 

J j(
    .read_address(BKG_address_J[10:0]),
    .Clk(Clk), 

    .data_Out(J_BKG_out[23:0])
); 

// K k(
//     .read_address(BKG_address_K[10:0]),
//     .Clk(Clk), 

//     .data_Out(K_BKG_out[23:0])
// ); 

L l(
    .read_address(BKG_address_L[10:0]),
    .Clk(Clk), 

    .data_Out(L_BKG_out[23:0])
); 

M m(
    .read_address(BKG_address_M[10:0]),
    .Clk(Clk), 

    .data_Out(M_BKG_out[23:0])
); 

// N n(
//     .read_address(BKG_address_N[10:0]),
//     .Clk(Clk), 

//     .data_Out(N_BKG_out[23:0])
// ); 

O o(
    .read_address(BKG_address_O[10:0]),
    .Clk(Clk), 

    .data_Out(O_BKG_out[23:0])
); 

P p(
    .read_address(BKG_address_P[10:0]),
    .Clk(Clk), 

    .data_Out(P_BKG_out[23:0])
); 

// Q q(
//     .read_address(BKG_address_Q[10:0]),
//     .Clk(Clk), 

//     .data_Out(Q_BKG_out[23:0])
// ); 

R r(
    .read_address(BKG_address_R[10:0]),
    .Clk(Clk), 

    .data_Out(R_BKG_out[23:0])
); 

S s(
    .read_address(BKG_address_S[10:0]),
    .Clk(Clk), 

    .data_Out(S_BKG_out[23:0])
); 

// T t(
//     .read_address(BKG_address_T[10:0]),
//     .Clk(Clk), 

//     .data_Out(T_BKG_out[23:0])
// ); 

U u(
    .read_address(BKG_address_U[10:0]),
    .Clk(Clk), 

    .data_Out(U_BKG_out[23:0])
); 

// V v(
//     .read_address(BKG_address_V[10:0]),
//     .Clk(Clk), 

//     .data_Out(V_BKG_out[23:0])
// ); 

// W w(
//     .read_address(BKG_address_W[10:0]),
//     .Clk(Clk), 

//     .data_Out(W_BKG_out[23:0])
// ); 

// X x(
//     .read_address(BKG_address_X[10:0]),
//     .Clk(Clk), 

//     .data_Out(X_BKG_out[23:0])
// ); 

// Y y(
//     .read_address(BKG_address_Y[10:0]),
//     .Clk(Clk), 

//     .data_Out(Y_BKG_out[23:0])
// ); 

// Z z(
//     .read_address(BKG_address_Z[10:0]),
//     .Clk(Clk), 

//     .data_Out(Z_BKG_out[23:0])
// ); 




logic [6:0] cannon_ram_address,cannon1_ram_address, cannon2_ram_address;
logic [23:0] cannon_BKG_out, cannon1_BKG_out, cannon2_BKG_out; 

logic greenplat16_on; 
logic greenplat32_on;
logic greenplat64_on;
logic underwater_BKG_on;
logic soccer_BKG_on;
logic space_BKG_on;
logic zero_on;
logic one_on;
logic two_on;
logic three_on;
logic four_on;
logic five_on;
logic six_on;
logic seven_on;
logic eight_on;
logic nine_on;
logic A_on;
logic B_on;
logic C_on;
logic D_on;
logic E_on;
logic F_on;
logic G_on;
logic H_on;
logic I_on;
logic J_on;
logic K_on;
logic L_on;
logic M_on;
logic N_on;
logic O_on;
logic P_on;
logic Q_on;
logic R_on;
logic S_on;
logic T_on;
logic U_on;
logic V_on;
logic W_on;
logic X_on;
logic Y_on;
logic Z_on;


logic [12:0] BKG_address; 
logic [12:0] BKG_address2; 
logic [15:0] BKG_address4;
logic [7:0]  BKG_address5;
logic [10:0]  BKG_address_zero;
logic [10:0]  BKG_address_one;
logic [10:0]  BKG_address_two;
logic [10:0]  BKG_address_three;
logic [10:0]  BKG_address_four;
logic [10:0]  BKG_address_five;
logic [10:0]  BKG_address_six;
logic [10:0]  BKG_address_seven;
logic [10:0]  BKG_address_eight;
logic [10:0]  BKG_address_nine;
// logic [10:0]  BKG_address_A;
// logic [10:0]  BKG_address_B;
logic [10:0]  BKG_address_C;
logic [10:0]  BKG_address_D;
logic [10:0]  BKG_address_E;
// logic [10:0]  BKG_address_F;
logic [10:0]  BKG_address_G;
// logic [10:0]  BKG_address_H;
// logic [10:0]  BKG_address_I;
logic [10:0]  BKG_address_J;
// logic [10:0]  BKG_address_K;
logic [10:0]  BKG_address_L;
logic [10:0]  BKG_address_M;
// logic [10:0]  BKG_address_N;
logic [10:0]  BKG_address_O;
logic [10:0]  BKG_address_P;
// logic [10:0]  BKG_address_Q;
logic [10:0]  BKG_address_R;
logic [10:0]  BKG_address_S;
// logic [10:0]  BKG_address_T;
logic [10:0]  BKG_address_U;
// logic [10:0]  BKG_address_V;
// logic [10:0]  BKG_address_W;
// logic [10:0]  BKG_address_X;
// logic [10:0]  BKG_address_Y;
// logic [10:0]  BKG_address_Z;




logic [10:0] shape_size_x = 10'd640;
logic [10:0] shape_size_y = 10'd480;
logic [10:0] doodle_shape_size_x = 10'd32;
logic [10:0] doodle_shape_size_y = 10'd32;
logic [10:0] letter_size = 10'd32;

logic [10:0] doodle_left_address;
logic [10:0] doodle_right_address;

logic [10:0] doodle_leftC_address;
logic [10:0] doodle_rightC_address;
logic [23:0] doodle_leftC_BKG_out; 
logic [23:0] doodle_rightC_BKG_out; 

logic doodle_leftC_BKG_on;
logic doodle_rightC_BKG_on;
logic [3:0]first_digit;
logic [3:0]second_digit;
logic [3:0]third_digit;
logic [3:0]fourth_digit;
logic [3:0]fifth_digit;

reg right_temp; 
reg left_temp; 
logic [5:0] legsupr, legsupl; 
modifiedcounter platformlegsl(
	.Reset(Platform_collision && direction == 1'b0), 
    .Clk(frame_clk), 

    .outM(legsupl[4:0])
);
modifiedcounter platformlegsr(
	.Reset(Platform_collision && direction == 1'b1), 
    .Clk(frame_clk), 

    .outM(legsupr[4:0])
);
platcolor_on(
    .DrawX(DrawX), .DrawY(DrawY),
    .plat0_color(plat0_color), .plat1_color(plat1_color), .plat2_color(plat2_color), .plat3_color(plat3_color), .plat4_color(plat4_color), .plat5_color(plat5_color), .plat6_color(plat6_color), .plat7_color(plat7_color), .plat8_color(plat8_color), .plat9_color(plat9_color), .plat10_color(plat10_color), .plat11_color(plat11_color), .plat12_color(plat12_color), .plat13_color(plat13_color), .plat14_color(plat14_color), .plat15_color(plat15_color),
    .platX1(platX1[8:0]), .platX2(platX2[8:0]), .platX3(platX3[8:0]), .platX4(platX4[8:0]), .platX5(platX5[8:0]), .platX6(platX6[8:0]), .platX7(platX7[8:0]), .platX8(platX8[8:0]),
	.platX9(platX9[8:0]), .platX10(platX10[8:0]), .platX11(platX11[8:0]), .platX12(platX12[8:0]), .platX13(platX13[8:0]), .platX14(platX14[8:0]), .platX15(platX15[8:0]),
	.platY1(platY1[8:0]), .platY2(platY2[8:0]), .platY3(platY3[8:0]), .platY4(platY4[8:0]), .platY5(platY5[8:0]), .platY6(platY6[8:0]), .platY7(platY7[8:0]), .platY8(platY8[8:0]),
	.platY9(platY9[8:0]), .platY10(platY10[8:0]), .platY11(platY11[8:0]), .platY12(platY12[8:0]), .platY13(platY13[8:0]), .platY14(platY14[8:0]), .platY15(platY15[8:0]),
    .platX(platX[8:0]), .platY(platY[8:0]), .plat_sizeX(plat_sizeX[8:0]), .plat_sizeY(plat_sizeY[8:0]),	//9 btis
    .difficulty(difficulty),
    .greenplat16_on(greenplat16_on), 
    .greenplat32_on(greenplat32_on),
    .greenplat64_on(greenplat64_on),
    .blueplat16_on(blueplat16_on), 
    .blueplat32_on(blueplat32_on), 
    .blueplat64_on(blueplat64_on), 
    .yellowplat16_on(yellowplat16_on),
    .yellowplat32_on(yellowplat32_on),
    .yellowplat64_on(yellowplat64_on),
    .whiteplat16_on(whiteplat16_on), 
    .whiteplat32_on(whiteplat32_on), 
    .whiteplat64_on(whiteplat64_on), 
    .brownplat16_on(brownplat16_on),
    .brownplat32_on(brownplat32_on),
    .brownplat64_on(brownplat64_on),
    .greenplat16_out(greenplat16_out), .greenplat32_out(greenplat32_out), .greenplat64_out(greenplat64_out),
    .temp_platX(temp_platX), .temp_platY(temp_platY)
); 
reg [8:0] temp_platY; 
reg [8:0] temp_platX; 
logic [8:0] monster_addr;
logic [23:0] monster_BKG_out; 

reg [8:0] temp_D_X;
reg [8:0] temp_D_Y;
reg [8:0] temp_L_X;
reg [8:0] temp_L_Y;
reg [8:0] temp_J_X;
reg [8:0] temp_J_Y;
reg [8:0] temp_U_X;
reg [8:0] temp_U_Y;
reg [8:0] temp_M_X;
reg [8:0] temp_M_Y;
reg [8:0] temp_P_X;
reg [8:0] temp_P_Y;

reg [8:0] temp_letter_size;
// game platforms 
// ~~~~~~Platforms~~~~~~~~~~~~~    
always_comb
    begin

        monster_addr = (2 * monstersizeX * (DrawY - (monsterY - (monstersizeY))) + (DrawX - (monsterX - (monstersizeX))));
        greenplat16addr = (2 * plat_sizeX * (DrawY - (temp_platY - (plat_sizeY))) + (DrawX - (temp_platX - (plat_sizeX))));
        greenplat32addr = (2 * plat_sizeX * (DrawY - (temp_platY - (plat_sizeY))) + (DrawX - (temp_platX - (plat_sizeX))));
        greenplat64addr = (2 * plat_sizeX * (DrawY - (temp_platY - (plat_sizeY))) + (DrawX - (temp_platX - (plat_sizeX))));

    end 

always_comb 
    begin
        // BKG_address_E = (temp_letter_size * (DrawY - temp_E_Y) + (DrawX - temp_E_X));
        BKG_address_D = (temp_letter_size * (DrawY - temp_D_Y) + (DrawX - temp_D_X));
        BKG_address_L = (temp_letter_size * (DrawY - temp_L_Y) + (DrawX - temp_L_X));         
        BKG_address_J = (temp_letter_size * (DrawY - temp_J_Y ) + (DrawX - temp_J_X));
        BKG_address_U = (temp_letter_size * (DrawY - temp_U_Y) + (DrawX - temp_U_X));
        BKG_address_M = (temp_letter_size * (DrawY - temp_M_Y) + (DrawX - temp_M_X));
        BKG_address_P = (temp_letter_size * (DrawY - temp_P_Y) + (DrawX - temp_P_X));  

     // BKG_address_E = (letter_size * (DrawY - tempx) + (DrawX - tempy));
        // if(inside the e of the score region)
        //     temp x = letter size
        //     temp y = 4 letter size 
        //     e_on 
        // if(outstate == main menu )
        //     if(inside region )
        //         tempx = 300
        //         tempy = 300
        //         e_on
        if(outstate == 3'b000)
            begin
                    if(DrawX >= 180 && DrawX <= 212 && DrawY >= 350 && DrawY <= 382) 
                        begin
                        temp_D_X = 0;
                        temp_D_Y = 0;
                        temp_L_X = 0;
                        temp_L_Y = 0;
                        temp_J_X = 180;
                        temp_J_Y = 350;
                        temp_U_X = 0;
                        temp_U_Y = 0;
                        temp_M_X = 0;
                        temp_M_Y = 0;
                        temp_P_X = 0;
                        temp_P_Y = 0;
                        temp_letter_size = letter_size;
                            if(J_BKG_out != 24'h0)
                                begin
                                D_on = 0;
                                L_on = 0;
                                J_on = 1;
                                U_on = 0;
                                M_on = 0;
                                P_on = 0;
                                // O2_on = 0;
                                // E2_on = 0;
                                end
                            else
                                begin
                                D_on = 0;
                                L_on = 0;
                                J_on = 0;
                                U_on = 0;
                                M_on = 0;
                                P_on = 0;
                                // O2_on = 0;
                                // E2_on = 0;
                                end
                        end
                    
                    else if(DrawX >= 180 && DrawX <= 212 && DrawY >= 300 && DrawY <= 332) 
                        begin
                        temp_D_X = 180;
                        temp_D_Y = 300;
                        temp_L_X = 0;
                        temp_L_Y = 0;
                        temp_J_X = 0;
                        temp_J_Y = 0;
                        temp_U_X = 0;
                        temp_U_Y = 0;
                        temp_M_X = 0;
                        temp_M_Y = 0;
                        temp_P_X = 0;
                        temp_P_Y = 0;
                        temp_letter_size = letter_size;
                            if(D_BKG_out != 24'h0)
                                begin
                                D_on = 1;
                                L_on = 0;
                                J_on = 0;
                                U_on = 0;
                                M_on = 0;
                                P_on = 0;
                                // O2_on = 0;
                                // E2_on = 0;
                                end
                            else
                                begin
                                D_on = 0;
                                L_on = 0;
                                J_on = 0;
                                U_on = 0;
                                M_on = 0;
                                P_on = 0;
                                // O2_on = 0;
                                // E2_on = 0;
                                end
                        end

                    else if(DrawX >= 330 && DrawX <= 362 && DrawY >= 300 && DrawY <= 332) 
                        begin
                        temp_D_X = 330;
                        temp_D_Y = 300;
                        temp_L_X = 0;
                        temp_L_Y = 0;
                        temp_J_X = 0;
                        temp_J_Y = 0;
                        temp_U_X = 0;
                        temp_U_Y = 0;
                        temp_M_X = 0;
                        temp_M_Y = 0;
                        temp_P_X = 0;
                        temp_P_Y = 0;
                        temp_letter_size = letter_size;
                            if(D_BKG_out != 24'h0)
                                begin
                                D_on = 1;
                                L_on = 0;
                                J_on = 0;
                                U_on = 0;
                                M_on = 0;
                                P_on = 0;
                                // O2_on = 0;
                                // E2_on = 0;
                                end
                            else
                                begin
                                D_on = 0;
                                L_on = 0;
                                J_on = 0;
                                U_on = 0;
                                M_on = 0;
                                P_on = 0;
                                // O2_on = 0;
                                // E2_on = 0;
                                end
                        end

                    else if(DrawX >= 380 && DrawX <= 412 && DrawY >= 300 && DrawY <= 332) 
                        begin
                        temp_D_X = 0;
                        temp_D_Y = 0;
                        temp_L_X = 380;
                        temp_L_Y = 300;
                        temp_J_X = 0;
                        temp_J_Y = 0;
                        temp_U_X = 0;
                        temp_U_Y = 0;
                        temp_M_X = 0;
                        temp_M_Y = 0;
                        temp_P_X = 0;
                        temp_P_Y = 0;
                        temp_letter_size = letter_size;
                            if(L_BKG_out != 24'h0)
                                begin
                                D_on = 0;
                                L_on = 1;
                                J_on = 0;
                                U_on = 0;
                                M_on = 0;
                                P_on = 0;
                                end
                            else
                                begin
                                D_on = 0;
                                L_on = 0;
                                J_on = 0;
                                U_on = 0;
                                M_on = 0;
                                P_on = 0;
                                end
                        end

                    else if(DrawX >= 230 && DrawX <= 262 && DrawY >= 350 && DrawY <= 382) 
                        begin
                        temp_D_X = 0;
                        temp_D_Y = 0;
                        temp_L_X = 0;
                        temp_L_Y = 0;
                        temp_J_X = 0;
                        temp_J_Y = 0;
                        temp_U_X = 230;
                        temp_U_Y = 350;
                        temp_M_X = 0;
                        temp_M_Y = 0;
                        temp_P_X = 0;
                        temp_P_Y = 0;
                        temp_letter_size = letter_size;
                            if(U_BKG_out != 24'h0)
                                begin
                                D_on = 0;
                                L_on = 0;
                                J_on = 0;
                                U_on = 1;
                                M_on = 0;
                                P_on = 0;
                                end
                            else
                                begin
                                D_on = 0;
                                L_on = 0;
                                J_on = 0;
                                U_on = 0;
                                M_on = 0;
                                P_on = 0;
                                end
                        end

                    else if(DrawX >= 280 && DrawX <= 312 && DrawY >= 350 && DrawY <= 382) 
                        begin
                        temp_D_X = 0;
                        temp_D_Y = 0;
                        temp_L_X = 0;
                        temp_L_Y = 0;
                        temp_J_X = 0;
                        temp_J_Y = 0;
                        temp_U_X = 0;
                        temp_U_Y = 0;
                        temp_M_X = 280;
                        temp_M_Y = 350;
                        temp_P_X = 0;
                        temp_P_Y = 0;
                        temp_letter_size = letter_size;
                            if(M_BKG_out != 24'h0)
                                begin
                                D_on = 0;
                                L_on = 0;
                                J_on = 0;
                                U_on = 0;
                                M_on = 1;
                                P_on = 0;
                                end
                            else
                                begin
                                D_on = 0;
                                L_on = 0;
                                J_on = 0;
                                U_on = 0;
                                M_on = 0;
                                P_on = 0;
                                end
                        end

                    else if(DrawX >= 330 && DrawX <= 362 && DrawY >= 350 && DrawY <= 382) 
                        begin
                        temp_D_X = 0;
                        temp_D_Y = 0;
                        temp_L_X = 0;
                        temp_L_Y = 0;
                        temp_J_X = 0;
                        temp_J_Y = 0;
                        temp_U_X = 0;
                        temp_U_Y = 0;
                        temp_M_X = 0;
                        temp_M_Y = 0;
                        temp_P_X = 330;
                        temp_P_Y = 350;
                        temp_letter_size = letter_size;
                            if(P_BKG_out != 24'h0)
                                begin
                                D_on = 0;
                                L_on = 0;
                                J_on = 0;
                                U_on = 0;
                                M_on = 0;
                                P_on = 1;              
                                end
                            else
                                begin
                                D_on = 0;
                                L_on = 0;
                                J_on = 0;
                                U_on = 0;
                                M_on = 0;
                                P_on = 0;
                                end
                        end

                    else
                        begin
                        temp_D_X = 0;
                        temp_D_Y = 0;
                        temp_L_X = 0;
                        temp_L_Y = 0;
                        temp_J_X = 0;
                        temp_J_Y = 0;
                        temp_U_X = 0;
                        temp_U_Y = 0;
                        temp_M_X = 0;
                        temp_M_Y = 0;
                        temp_P_X = 0;
                        temp_P_Y = 0;
                        temp_letter_size = letter_size;
                        D_on = 0;
                        L_on = 0;
                        J_on = 0;
                        U_on = 0;
                        M_on = 0;
                        P_on = 0;
                        end
            end

        else
            begin
            temp_D_X = 0;
            temp_D_Y = 0;
            temp_L_X = 0;
            temp_L_Y = 0;
            temp_J_X = 0;
            temp_J_Y = 0;  
            temp_U_X = 0;
            temp_U_Y = 0;
            temp_M_X = 0; 
            temp_M_Y = 0;
            temp_P_X = 0;
            temp_P_Y = 0;
            temp_letter_size = letter_size;
            D_on = 0;
            L_on = 0;
            J_on = 0;
            U_on = 0;
            M_on = 0;
            P_on = 0;
            
            end
    end


    
reg [8:0] temp_S_X;
reg [8:0] temp_S_Y;
reg [8:0] temp_C_X;
reg [8:0] temp_C_Y;
reg [8:0] temp_O_X;
reg [8:0] temp_O_Y;
reg [8:0] temp_R_X;
reg [8:0] temp_R_Y;
reg [8:0] temp_E_X;
reg [8:0] temp_E_Y;

always_comb 
    begin 
        BKG_address_S = (temp_letter_size * (DrawY - temp_S_Y) + DrawX);
        BKG_address_C = (temp_letter_size * (DrawY - temp_C_Y) + (DrawX - temp_C_X));
        BKG_address_O = (temp_letter_size * (DrawY - temp_O_Y ) + (DrawX - temp_O_X));
        BKG_address_R = (temp_letter_size * (DrawY - temp_R_Y) + (DrawX - temp_R_X));
        BKG_address_E = (temp_letter_size * (DrawY - temp_E_Y) + (DrawX - temp_E_X));
    if(outstate == 3'b010 || outstate == 3'b011 || outstate == 3'b110 || outstate == 3'b100)
        begin
        if(DrawY >= letter_size && DrawX >= 0 && DrawX <= letter_size && DrawY <= (2 * letter_size))
            begin
                temp_S_Y = letter_size; 
                temp_C_X = 0;
                temp_C_Y = 0;
                temp_O_X = 0;
                temp_O_Y = 0;
                temp_R_X = 0;
                temp_R_Y = 0;
                temp_E_X = 0;
                temp_E_Y = 0;
                temp_letter_size = letter_size;

                if(S_BKG_out != 24'h0)
                    begin
                        S_on = 1;
                        C_on = 0;
                        O_on = 0;
                        R_on = 0;
                        E_on = 0; 
                    end
                else
                    begin
                        S_on = 0;
                        C_on = 0;
                        O_on = 0;
                        R_on = 0;
                        E_on = 0; 
                    end
            end

        else if(DrawY >= letter_size && DrawX >= letter_size && DrawX <= (2 * letter_size) && DrawY <= (2 * letter_size))
            begin
                temp_S_Y = 0; 
                temp_C_X = letter_size;
                temp_C_Y = letter_size;
                temp_O_X = 0;
                temp_O_Y = 0;
                temp_R_X = 0;
                temp_R_Y = 0;
                temp_E_X = 0;
                temp_E_Y = 0;
                temp_letter_size = letter_size;
                if(C_BKG_out != 24'h0)
                    begin
                        S_on = 0;
                        C_on = 1;
                        O_on = 0;
                        R_on = 0;
                        E_on = 0; 
                    end
                else
                    begin
                        S_on = 0;
                        C_on = 0;
                        O_on = 0;
                        R_on = 0;
                        E_on = 0; 
                    end
            end
        
        else if(DrawY >= letter_size && DrawX >= (2 * letter_size) && DrawX <= (3 * letter_size) && DrawY <= (2 * letter_size))
            begin
                temp_S_Y = 0;
                temp_C_X = 0;
                temp_C_Y = 0;
                temp_O_X = 2 * letter_size;
                temp_O_Y = letter_size;
                temp_R_X = 0;
                temp_R_Y = 0;
                temp_E_X = 0;
                temp_E_Y = 0;
                temp_letter_size = letter_size;
                if(O_BKG_out != 24'h0)
                    begin
                        S_on = 0;
                        C_on = 0;
                        O_on = 1;
                        R_on = 0;
                        E_on = 0; 
                    end
                else
                    begin
                        S_on = 0;
                        C_on = 0;
                        O_on = 0;
                        R_on = 0;
                        E_on = 0; 
                    end 
            end

        else if(DrawY >= letter_size && DrawX >= (3 *letter_size) && DrawX <= (4 * letter_size) && DrawY <= (2 * letter_size))
            begin
                temp_S_Y = 0; 
                temp_C_X = 0;
                temp_C_Y = 0;
                temp_O_X = 0;
                temp_O_Y = 0;
                temp_R_X = 3 * letter_size;
                temp_R_Y = letter_size;
                temp_E_X = 0;
                temp_E_Y = 0;
                temp_letter_size = letter_size;
                if(R_BKG_out != 24'h0)
                    begin
                        S_on = 0;
                        C_on = 0;
                        O_on = 0;
                        R_on = 1;
                        E_on = 0; 
                    end
                else
                    begin
                        S_on = 0;
                        C_on = 0;
                        O_on = 0;
                        R_on = 0;
                        E_on = 0; 
                    end 
            end

        else if(DrawY >= letter_size && DrawX >= (4 *letter_size) && DrawX <= (5 * letter_size) && DrawY <= (2 * letter_size))
            begin
                temp_S_Y = 0; 
                temp_C_X = 0;
                temp_C_Y = 0;
                temp_O_X = 0;
                temp_O_Y = 0;
                temp_R_X = 0;
                temp_R_Y = 0;
                temp_E_X = 4 * letter_size;
                temp_E_Y = letter_size;
                temp_letter_size = letter_size;

                if(E_BKG_out != 24'h0)
                    begin
                        S_on = 0;
                        C_on = 0;
                        O_on = 0;
                        R_on = 0;
                        E_on = 1; 
                    end
                else
                    begin
                        S_on = 0;
                        C_on = 0;
                        O_on = 0;
                        R_on = 0;
                        E_on = 0;  
                    end
            end

        else
            begin
                temp_S_Y = 0; 
                temp_C_X = 0;
                temp_C_Y = 0;
                temp_O_X = 0;
                temp_O_Y = 0;
                temp_R_X = 0;
                temp_R_Y = 0;
                temp_E_X = 0;
                temp_E_Y = 0;
                temp_letter_size = letter_size;
                S_on = 0;
                C_on = 0;
                O_on = 0;
                R_on = 0;
                E_on = 0; 
            end
        
        end
    else if(outstate == 3'b000)
        begin
            if(DrawX >= 230 && DrawX <= 262 && DrawY >= 300 && DrawY <= 332)
                begin
                    temp_S_Y = 0; 
                    temp_C_X = 0;
                    temp_C_Y = 0;
                    temp_O_X = 230;
                    temp_O_Y = 300;
                    temp_R_X = 0;
                    temp_R_Y = 0;
                    temp_E_X = 0;
                    temp_E_Y = 0;
                    temp_letter_size = letter_size;
                    if(O_BKG_out != 24'h0)
                        begin
                            S_on = 0;
                            C_on = 0;
                            O_on = 1;
                            R_on = 0;
                            E_on = 0; 
                        end
                    else
                        begin
                            S_on = 0;
                            C_on = 0;
                            O_on = 0;
                            R_on = 0;
                            E_on = 0;  
                        end
                end
            
            else if(DrawX >= 280 && DrawX <= 312 && DrawY >= 300 && DrawY <= 332)
                begin
                    temp_S_Y = 0; 
                    temp_C_X = 0;
                    temp_C_Y = 0;
                    temp_O_X = 280;
                    temp_O_Y = 300;
                    temp_R_X = 0;
                    temp_R_Y = 0;
                    temp_E_X = 0;
                    temp_E_Y = 0;
                    temp_letter_size = letter_size;
                    if(O_BKG_out != 24'h0)
                        begin
                            S_on = 0;
                            C_on = 0;
                            O_on = 1;
                            R_on = 0;
                            E_on = 0; 
                        end
                    else
                        begin
                            S_on = 0;
                            C_on = 0;
                            O_on = 0;
                            R_on = 0;
                            E_on = 0;  
                        end
                end  

            else if(DrawX >= 430 && DrawX <= 462 && DrawY >= 300 && DrawY <= 332)
                begin
                    temp_S_Y = 0; 
                    temp_C_X = 0;
                    temp_C_Y = 0;
                    temp_O_X = 0;
                    temp_O_Y = 0;
                    temp_R_X = 0;
                    temp_R_Y = 0;
                    temp_E_X = 430;
                    temp_E_Y = 300;
                    temp_letter_size = letter_size;
                    if(E_BKG_out != 24'h0)
                        begin
                            S_on = 0;
                            C_on = 0;
                            O_on = 0;
                            R_on = 0;
                            E_on = 1; 
                        end
                    else
                        begin
                            S_on = 0;
                            C_on = 0;
                            O_on = 0;
                            R_on = 0;
                            E_on = 0;  
                        end
                end        
            else 
                begin
                    temp_S_Y = 0; 
                    temp_C_X = 0;
                    temp_C_Y = 0;
                    temp_O_X = 0;
                    temp_O_Y = 0;
                    temp_R_X = 0;
                    temp_R_Y = 0;
                    temp_E_X = 0;
                    temp_E_Y = 0;
                    temp_letter_size = letter_size;
                    S_on = 0;
                    C_on = 0;
                    O_on = 0;
                    R_on = 0;
                    E_on = 0;
                end
        end

    else 
        begin
            temp_S_Y = 0; 
            temp_C_X = 0;
            temp_C_Y = 0;
            temp_O_X = 0;
            temp_O_Y = 0;
            temp_R_X = 0;
            temp_R_Y = 0;
            temp_E_X = 0;
            temp_E_Y = 0;
            temp_letter_size = letter_size;
            S_on = 0;
            C_on = 0;
            O_on = 0;
            R_on = 0;
            E_on = 0; 
        end
end


reg [8:0] temp_G_X;
reg [8:0] temp_G_Y;
always_comb 
    begin
        BKG_address_G = (temp_letter_size * (DrawY - temp_G_Y) + (DrawX - temp_G_X));
        
        if(outstate == 3'b110)
        begin
            if(DrawX >= 288 && DrawX <= 320 && DrawY >= 224 && DrawY <= 256) 
                begin
                temp_G_X = 288;
                temp_G_Y = 224;
                temp_letter_size = letter_size;
                    if(G_BKG_out != 24'h0)
                        begin
                        G_on = 1;
                        end
                    else
                        begin
                        G_on = 0;
                        end
                end
                    
            else if(DrawX >= 322 && DrawX <= 354 && DrawY >= 224 && DrawY <= 256) 
                begin
                temp_G_X = 322;
                temp_G_Y = 224;
                temp_letter_size = letter_size;
                    if(G_BKG_out != 24'h0)
                        begin
                        G_on = 1;
                        end
                    else
                        begin
                        G_on = 0;
                        end
                end

            else
                begin
                temp_G_X = 0;
                temp_G_Y = 0;
                temp_letter_size = letter_size;
                G_on = 0;
                end
        end

    else
        begin
        temp_G_X = 0;
        temp_G_Y = 0;
        temp_letter_size = letter_size;
        G_on = 0;
        end
end         





bin2bcd bin2bcd(
    .bin(Score[13:0]),
    .bcd(BCD[15:0])
);

logic [5:0] antighosting1; 
logic [15:0] BCD; 

always_comb 
    begin 
        first_digit = BCD[3:0];
        second_digit = BCD[7:4];
        third_digit = BCD[11:8];
        fourth_digit = BCD[15:12];
        if(Score[19:0] >= 10000)
            fifth_digit = 1; 
        else 
            fifth_digit = 0; 
        
        BKG_address_zero = (letter_size * DrawY) + DrawX;
        BKG_address_one = (letter_size * DrawY) + DrawX;
        BKG_address_two = (letter_size * DrawY) + DrawX;
        BKG_address_three = (letter_size * DrawY) + DrawX;
        BKG_address_four = (letter_size * DrawY) + DrawX;
        BKG_address_five = (letter_size * DrawY) + DrawX;
        BKG_address_six = (letter_size * DrawY) + DrawX;
        BKG_address_seven = (letter_size * DrawY) + DrawX;
        BKG_address_eight = (letter_size * DrawY) + DrawX;
        BKG_address_nine = (letter_size * DrawY) + DrawX;
    if(outstate == 3'b010 || outstate == 3'b011 || outstate == 3'b100 || outstate == 3'b110) 
        begin   
        if(DrawY >= 0 && DrawX >= 0 && DrawX <= letter_size && DrawY <= letter_size)
            begin
            unique case(fifth_digit)
                4'b0000: 
                    begin
                        if(zero_BKG_out != 24'h0)
                            begin
                                zero_on = 1;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end
                4'b0001:
                    begin
                        if(one_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 1;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                                end 
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end

                4'b0010:
                    begin
                        if(two_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 1;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end
                
                4'b0011:
                    begin
                        if(three_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 1;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                                end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end

                4'b0100:
                    begin
                        if(four_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 1;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;
                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;
                            end
                    end

                4'b0101:
                    begin
                        if(five_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 1;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end

                4'b0110:
                    begin
                        if(six_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 1;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end

                4'b0111:
                    begin
                        if(seven_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 1;
                                eight_on = 0;
                                nine_on = 0;

                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end

                4'b1000:
                    begin
                        if(eight_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 1;
                                nine_on = 0;

                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end

                4'b1001:
                    begin
                        if(nine_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 1;

                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end
            endcase

           
        end 

        else if(DrawY >= 0 && DrawX <= (2 * letter_size) && DrawX > letter_size && DrawY <= letter_size)
            begin
            unique case(fourth_digit)
                4'b0000: 
                    begin
                        if(zero_BKG_out != 24'h0)
                            begin
                                zero_on = 1;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end
                4'b0001:
                    begin
                        if(one_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 1;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                                end 
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end

                4'b0010:
                    begin
                        if(two_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 1;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end
                
                4'b0011:
                    begin
                        if(three_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 1;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                                end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end

                4'b0100:
                    begin
                        if(four_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 1;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;
                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;
                            end
                    end

                4'b0101:
                    begin
                        if(five_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 1;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end

                4'b0110:
                    begin
                        if(six_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 1;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end

                4'b0111:
                    begin
                        if(seven_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 1;
                                eight_on = 0;
                                nine_on = 0;

                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end

                4'b1000:
                    begin
                        if(eight_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 1;
                                nine_on = 0;

                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end

                4'b1001:
                    begin
                        if(nine_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 1;

                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end
            endcase

           
        end 

        else if(DrawY >= 0 && DrawX <= (3 * letter_size) && DrawX > (2 * letter_size) && DrawY <= letter_size)
            begin
            unique case(third_digit)
                4'b0000: 
                    begin
                        if(zero_BKG_out != 24'h0)
                            begin
                                zero_on = 1;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end
                4'b0001:
                    begin
                        if(one_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 1;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                                end 
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end

                4'b0010:
                    begin
                        if(two_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 1;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end
                
                4'b0011:
                    begin
                        if(three_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 1;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                                end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end

                4'b0100:
                    begin
                        if(four_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 1;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;
                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;
                            end
                    end

                4'b0101:
                    begin
                        if(five_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 1;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end

                4'b0110:
                    begin
                        if(six_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 1;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end

                4'b0111:
                    begin
                        if(seven_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 1;
                                eight_on = 0;
                                nine_on = 0;

                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end

                4'b1000:
                    begin
                        if(eight_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 1;
                                nine_on = 0;

                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end

                4'b1001:
                    begin
                        if(nine_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 1;

                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end
            endcase

           
        end 

        else if(DrawY >= 0 && DrawX <= (4 * letter_size) && DrawX > (3 * letter_size) && DrawY <= letter_size)
            begin
            unique case(second_digit)
                4'b0000: 
                    begin
                        if(zero_BKG_out != 24'h0)
                            begin
                                zero_on = 1;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end
                4'b0001:
                    begin
                        if(one_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 1;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                                end 
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end

                4'b0010:
                    begin
                        if(two_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 1;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end
                
                4'b0011:
                    begin
                        if(three_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 1;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                                end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end

                4'b0100:
                    begin
                        if(four_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 1;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;
                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;
                            end
                    end

                4'b0101:
                    begin
                        if(five_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 1;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end

                4'b0110:
                    begin
                        if(six_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 1;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end

                4'b0111:
                    begin
                        if(seven_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 1;
                                eight_on = 0;
                                nine_on = 0;

                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end

                4'b1000:
                    begin
                        if(eight_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 1;
                                nine_on = 0;

                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end

                4'b1001:
                    begin
                        if(nine_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 1;

                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end
            endcase

           
        end 

        else if(DrawY >= 0 && DrawX <= (5 * letter_size) && DrawX > (4 * letter_size) && DrawY <= letter_size)
            begin
            unique case(first_digit)
                4'b0000: 
                    begin
                        if(zero_BKG_out != 24'h0)
                            begin
                                zero_on = 1;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end
                4'b0001:
                    begin
                        if(one_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 1;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                                end 
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end

                4'b0010:
                    begin
                        if(two_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 1;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end
                
                4'b0011:
                    begin
                        if(three_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 1;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                                end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end

                4'b0100:
                    begin
                        if(four_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 1;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;
                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;
                            end
                    end

                4'b0101:
                    begin
                        if(five_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 1;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end

                4'b0110:
                    begin
                        if(six_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 1;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end

                4'b0111:
                    begin
                        if(seven_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 1;
                                eight_on = 0;
                                nine_on = 0;

                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end

                4'b1000:
                    begin
                        if(eight_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 1;
                                nine_on = 0;

                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end

                4'b1001:
                    begin
                        if(nine_BKG_out != 24'h0)
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 1;

                            end
                        else
                            begin
                                zero_on = 0;
                                one_on = 0;
                                two_on = 0;
                                three_on = 0;
                                four_on = 0;
                                five_on = 0;
                                six_on = 0;
                                seven_on = 0;
                                eight_on = 0;
                                nine_on = 0;

                            end
                    end
            endcase

           
        end 



        else 
            begin 
                zero_on = 0;
                one_on = 0;
                two_on = 0;
                three_on = 0;
                four_on = 0;
                five_on = 0;
                six_on = 0;
                seven_on = 0;
                eight_on = 0;
                nine_on = 0;
            end 
    end

    else 
        begin
        zero_on = 0;
        one_on = 0;
        two_on = 0;
        three_on = 0;
        four_on = 0;
        five_on = 0;
        six_on = 0;
        seven_on = 0;
        eight_on = 0;
        nine_on = 0;
        end

end 



always_comb
    begin 
        BKG_address = (640 * DrawY) + DrawX;
        BKG_address2 = (640 * DrawY) + DrawX;
        BKG_address4 = (640 * DrawY) + DrawX;
        
        cannon_ram_address = (2 * CannonS * (DrawY - (CannonY - CannonS)) + (DrawX - (CannonX - CannonS)));
        cannon1_ram_address = (2 * CannonS * (DrawY - (CannonY1 - CannonS)) + (DrawX - (CannonX1 - CannonS)));
        cannon2_ram_address = (2 * CannonS * (DrawY - (CannonY2 - CannonS)) + (DrawX - (CannonX2 - CannonS)));
        
        doodle_right_address = (doodle_shape_size_x * (DrawY - (DoodleY + Doodle_size - doodle_shape_size_y)) + (DrawX - (DoodleX - (doodle_shape_size_x / 2))));
        doodle_left_address = (doodle_shape_size_x * (DrawY - (DoodleY + Doodle_size - doodle_shape_size_y)) + (DrawX - (DoodleX - (doodle_shape_size_x / 2))));
        
        underwater_BKG_on = 1; 
        soccer_BKG_on = 0;
        space_BKG_on = 0;

        if(DrawY >= 0 && DrawY < shape_size_y && DrawX >= 0 && DrawX < shape_size_x) //Ball_x = 0
            begin
                if(Score >= 20'h500 && Score <= 20'h1000) //BKG2--grassland
                    begin
                    if(DrawY >= (DoodleY + Doodle_size - doodle_shape_size_y) && DrawY < (DoodleY + Doodle_size) && DrawX >= (DoodleX - (doodle_shape_size_x /2) ) && DrawX < (DoodleX + (doodle_shape_size_x /2)))
                        begin//inside the doodle hitbox 
                            if(direction == 1'b1) //right key
                                begin
                                    if(legsupr[4:0] == 6'b000000)
                                        begin 
                                            if(doodle_right_BKG_out == 24'hfe43e3) //background in the doodle image
                                                begin
                                                    underwater_BKG_on = 0; 
                                                    soccer_BKG_on = 1;
                                                    space_BKG_on = 0;
                                                    doodle_right_BKG_on = 0;                                                    
                                                    doodle_left_BKG_on = 0;
                                                    doodle_rightC_BKG_on = 0;                                            
                                                    doodle_leftC_BKG_on = 0;
                                                end
                                            else
                                                begin
                                                    underwater_BKG_on  = 0;
                                                    soccer_BKG_on = 0;
                                                    space_BKG_on = 0;
                                                    doodle_right_BKG_on = 1;
                                                    doodle_left_BKG_on = 0;
                                                    doodle_rightC_BKG_on = 0;                                            
                                                    doodle_leftC_BKG_on = 0;
                                                    
                                                end
                                        end 
                                    else 
                                        begin 
                                            if(doodle_rightC_BKG_out == 24'hfe43e3) //background in the doodle image
                                                begin
                                                    underwater_BKG_on = 0; 
                                                    soccer_BKG_on = 1;
                                                    space_BKG_on = 0;
                                                    doodle_right_BKG_on = 0;                                                    
                                                    doodle_left_BKG_on = 0;
                                                    doodle_rightC_BKG_on = 0;                                            
                                                    doodle_leftC_BKG_on = 0;
                                                    
                                                end
                                            else
                                                begin
                                                    underwater_BKG_on  = 0;
                                                    soccer_BKG_on = 0;
                                                    space_BKG_on = 0;
                                                    doodle_right_BKG_on = 0;
                                                    doodle_left_BKG_on = 0;
                                                    doodle_rightC_BKG_on = 1;                                            
                                                    doodle_leftC_BKG_on = 0;
                                                  
                                                end                                            
                                        end 
                                end
                            else
                                begin
                                    if(legsupl[4:0] == 6'b000000)
                                        begin 
                                            if(doodle_left_BKG_out == 24'hfe43e3)
                                                begin
                                                    underwater_BKG_on  = 0;
                                                    soccer_BKG_on = 1;
                                                    space_BKG_on = 0;
                                                    doodle_right_BKG_on = 0;
                                                    doodle_left_BKG_on = 0;
                                                    doodle_rightC_BKG_on = 0;                                            
                                                    doodle_leftC_BKG_on = 0;
                                                  
                                                end
                                            else
                                                begin
                                                    underwater_BKG_on  = 0;
                                                    soccer_BKG_on = 0;
                                                    space_BKG_on = 0;
                                                    doodle_right_BKG_on = 0;
                                                    doodle_left_BKG_on = 1;
                                                    doodle_rightC_BKG_on = 0;                                            
                                                    doodle_leftC_BKG_on = 0;
                                                    
                                                end
                                        end 
                                    else 
                                        begin 
                                            if(doodle_leftC_BKG_out == 24'hfe43e3) //background in the doodle image
                                                begin
                                                    underwater_BKG_on = 0; 
                                                    soccer_BKG_on = 1;
                                                    space_BKG_on = 0;
                                                    doodle_right_BKG_on = 0;                                                    
                                                    doodle_left_BKG_on = 0;
                                                    doodle_rightC_BKG_on = 0;                                            
                                                    doodle_leftC_BKG_on = 0;
                                                   
                                                end
                                            else
                                                begin
                                                    underwater_BKG_on  = 0;
                                                    soccer_BKG_on = 0;
                                                    space_BKG_on = 0;
                                                    doodle_right_BKG_on = 0;
                                                    doodle_left_BKG_on = 0;
                                                    doodle_rightC_BKG_on = 0;                                            
                                                    doodle_leftC_BKG_on = 1;
                                                    
                                                end                                            
                                        end  
                                
                                end
             
                        end
                        else //outside of the doodle hitbox 
                            begin
                                underwater_BKG_on = 0; 
                                soccer_BKG_on = 1;
                                doodle_right_BKG_on = 0;
                                space_BKG_on = 0;
                                doodle_left_BKG_on = 0;
                                doodle_rightC_BKG_on = 0;
                                doodle_leftC_BKG_on = 0;
                               
                            end
                    end
                

                else if(Score > 20'h1000) //BKG4 -- stats and space
                    begin
                    if(DrawY >= (DoodleY + Doodle_size - doodle_shape_size_y) && DrawY < (DoodleY + Doodle_size) && DrawX >= (DoodleX - (doodle_shape_size_x /2) ) && DrawX < (DoodleX + (doodle_shape_size_x /2)))
                        begin //inside the doodle hitbox 
                            if(direction == 1'b1) //right key
                                begin
                                    if(legsupr[4:0] == 6'b000000)
                                        begin 
                                            if(doodle_right_BKG_out == 24'hfe43e3) //background in the doodle image
                                                begin
                                                    underwater_BKG_on = 0; 
                                                    soccer_BKG_on = 0;
                                                    space_BKG_on = 1;
                                                    doodle_right_BKG_on = 0;                                                    
                                                    doodle_left_BKG_on = 0;
                                                    doodle_rightC_BKG_on = 0;                                            
                                                    doodle_leftC_BKG_on = 0;
                                                    
                                                    
                                                end
                                            else
                                                begin
                                                    underwater_BKG_on  = 0;
                                                    soccer_BKG_on = 0;
                                                    space_BKG_on = 0;
                                                    doodle_right_BKG_on = 1;
                                                    doodle_left_BKG_on = 0;
                                                    doodle_rightC_BKG_on = 0;                                            
                                                    doodle_leftC_BKG_on = 0;
                                                   
                                                end
                                        end 
                                    else 
                                        begin 
                                            if(doodle_rightC_BKG_out == 24'hfe43e3) //background in the doodle image
                                                begin
                                                    underwater_BKG_on = 0; 
                                                    soccer_BKG_on = 0;
                                                    space_BKG_on = 1;
                                                    doodle_right_BKG_on = 0;                                                    
                                                    doodle_left_BKG_on = 0;
                                                    doodle_rightC_BKG_on = 0;                                            
                                                    doodle_leftC_BKG_on = 0;
                                                   
                                                end
                                            else
                                                begin
                                                    underwater_BKG_on  = 0;
                                                    soccer_BKG_on = 0;
                                                    space_BKG_on = 0;
                                                    doodle_right_BKG_on = 0;
                                                    doodle_left_BKG_on = 0;
                                                    doodle_rightC_BKG_on = 1;                                            
                                                    doodle_leftC_BKG_on = 0;
                                                    
                                                end                                            
                                        end 
                                end
                            else
                                begin
                                    if(legsupl[4:0] == 6'b000000)
                                        begin 
                                            if(doodle_left_BKG_out == 24'hfe43e3)
                                                begin
                                                    underwater_BKG_on = 0; 
                                                    soccer_BKG_on = 0;
                                                    space_BKG_on = 1;
                                                    doodle_right_BKG_on = 0;                                                    
                                                    doodle_left_BKG_on = 0;
                                                    doodle_rightC_BKG_on = 0;                                            
                                                    doodle_leftC_BKG_on = 0;
                                                   
                                                end
                                            else
                                                begin
                                                    underwater_BKG_on  = 0;
                                                    soccer_BKG_on = 0;
                                                    space_BKG_on = 0;
                                                    doodle_right_BKG_on = 0;
                                                    doodle_left_BKG_on = 1;
                                                    doodle_rightC_BKG_on = 0;                                            
                                                    doodle_leftC_BKG_on = 0;
                                                   
                                                end
                                        end 
                                    else 
                                        begin 
                                            if(doodle_leftC_BKG_out == 24'hfe43e3) //background in the doodle image
                                                begin
                                                    underwater_BKG_on = 0; 
                                                    soccer_BKG_on = 0;
                                                    space_BKG_on = 1;
                                                    doodle_right_BKG_on = 0;                                                    
                                                    doodle_left_BKG_on = 0;
                                                    doodle_rightC_BKG_on = 0;                                            
                                                    doodle_leftC_BKG_on = 0;
                                                   
                                                end
                                            else
                                                begin
                                                    underwater_BKG_on  = 0;
                                                    soccer_BKG_on = 0;
                                                    space_BKG_on = 0;
                                                    doodle_right_BKG_on = 0;
                                                    doodle_left_BKG_on = 0;
                                                    doodle_rightC_BKG_on = 0;                                            
                                                    doodle_leftC_BKG_on = 1;
                                                   
                                                end                                            
                                        end  
                                
                                end
             
                        end
                    else //outside of the doodle gitbox 
                        begin
                            underwater_BKG_on = 0;
                            soccer_BKG_on = 0;
                            space_BKG_on = 1;
                            doodle_right_BKG_on = 0;
                            doodle_left_BKG_on = 0;
                            doodle_rightC_BKG_on = 0;
                            doodle_leftC_BKG_on = 0;
                           
                        end
                    end

                else //BKG1 -- ocean
                    begin   
                        if(DrawY >= (DoodleY + Doodle_size - doodle_shape_size_y) && DrawY < (DoodleY + Doodle_size) && DrawX >= (DoodleX - (doodle_shape_size_x /2) ) && DrawX < (DoodleX + (doodle_shape_size_x /2)))
                        begin//inside the doodle hitbox 
                            if(direction == 1'b1) //right key
                                begin
                                    if(legsupr[4:0] == 6'b000000)
                                        begin 
                                            if(doodle_right_BKG_out == 24'hfe43e3) //background in the doodle image
                                                begin
                                                    underwater_BKG_on = 1; 
                                                    soccer_BKG_on = 0;
                                                    space_BKG_on = 0;
                                                    doodle_right_BKG_on = 0;                                                    
                                                    doodle_left_BKG_on = 0;
                                                    doodle_rightC_BKG_on = 0;                                            
                                                    doodle_leftC_BKG_on = 0;
                                                    
                                                end
                                            else
                                                begin
                                                    underwater_BKG_on  = 0;
                                                    soccer_BKG_on = 0;
                                                    space_BKG_on = 0;
                                                    doodle_right_BKG_on = 1;
                                                    doodle_left_BKG_on = 0;
                                                    doodle_rightC_BKG_on = 0;                                            
                                                    doodle_leftC_BKG_on = 0;
                                                   
                                                end
                                        end 
                                    else 
                                        begin 
                                            if(doodle_rightC_BKG_out == 24'hfe43e3) //background in the doodle image
                                                begin
                                                    underwater_BKG_on = 1; 
                                                    soccer_BKG_on = 0;
                                                    space_BKG_on = 0;
                                                    doodle_right_BKG_on = 0;                                                    
                                                    doodle_left_BKG_on = 0;
                                                    doodle_rightC_BKG_on = 0;                                            
                                                    doodle_leftC_BKG_on = 0;
                                                   
                                                end
                                            else
                                                begin
                                                    underwater_BKG_on  = 0;
                                                    soccer_BKG_on = 0;
                                                    space_BKG_on = 0;
                                                    doodle_right_BKG_on = 0;
                                                    doodle_left_BKG_on = 0;
                                                    doodle_rightC_BKG_on = 1;                                            
                                                    doodle_leftC_BKG_on = 0;
                                                   
                                                end                                            
                                        end 
                                end
                            else
                                begin
                                    if(legsupl[4:0] == 6'b000000)
                                        begin 
                                            if(doodle_left_BKG_out == 24'hfe43e3)
                                                begin
                                                    underwater_BKG_on = 1; 
                                                    soccer_BKG_on = 0;
                                                    space_BKG_on = 0;
                                                    doodle_right_BKG_on = 0;                                                    
                                                    doodle_left_BKG_on = 0;
                                                    doodle_rightC_BKG_on = 0;                                            
                                                    doodle_leftC_BKG_on = 0;
                                                    
                                                end
                                            else
                                                begin
                                                    underwater_BKG_on  = 0;
                                                    soccer_BKG_on = 0;
                                                    space_BKG_on = 0;
                                                    doodle_right_BKG_on = 0;
                                                    doodle_left_BKG_on = 1;
                                                    doodle_rightC_BKG_on = 0;                                            
                                                    doodle_leftC_BKG_on = 0;
                                                   
                                                end
                                        end 
                                    else 
                                        begin 
                                            if(doodle_leftC_BKG_out == 24'hfe43e3) //background in the doodle image
                                                begin
                                                    underwater_BKG_on = 1; 
                                                    soccer_BKG_on = 0;
                                                    space_BKG_on = 0;
                                                    doodle_right_BKG_on = 0;                                                    
                                                    doodle_left_BKG_on = 0;
                                                    doodle_rightC_BKG_on = 0;                                            
                                                    doodle_leftC_BKG_on = 0;
                                                    
                                                end
                                            else
                                                begin
                                                    underwater_BKG_on  = 0;
                                                    soccer_BKG_on = 0;
                                                    space_BKG_on = 0;
                                                    doodle_right_BKG_on = 0;
                                                    doodle_left_BKG_on = 0;
                                                    doodle_rightC_BKG_on = 0;                                            
                                                    doodle_leftC_BKG_on = 1;
                                                   
                                                end                                            
                                        end  
                                
                                end
             
                        end
                        else //outside of the doodle gitbox 
                            begin
                                underwater_BKG_on = 1;
                                soccer_BKG_on = 0;
                                space_BKG_on = 0;
                                doodle_right_BKG_on = 0;
                                doodle_left_BKG_on = 0;
                                doodle_rightC_BKG_on = 0;
                                doodle_leftC_BKG_on = 0;
                                
                        end
                    end    
            end
        else //DrawX/Y out of the screen
            begin
                underwater_BKG_on = 0; 
                soccer_BKG_on = 0;
                doodle_right_BKG_on = 0;
                space_BKG_on = 0;
                doodle_left_BKG_on = 0;
                doodle_rightC_BKG_on = 0;
                doodle_leftC_BKG_on = 0;
               
            end
    end






   

    always_comb
        begin:RGB_Display
        //turn on pixels for the Doodle 
        if(doodle_rightC_BKG_on == 1)
            begin 
                Red = doodle_rightC_BKG_out[23:16];
                Green = doodle_rightC_BKG_out[15:8];
                Blue = doodle_rightC_BKG_out[7:0];
            end 
        else if(doodle_leftC_BKG_on == 1)
            begin 
                Red = doodle_leftC_BKG_out[23:16];
                Green = doodle_leftC_BKG_out[15:8];
                Blue = doodle_leftC_BKG_out[7:0];
            end
        else if(doodle_right_BKG_on == 1)
            begin 
                Red = doodle_right_BKG_out[23:16];
                Green = doodle_right_BKG_out[15:8];
                Blue = doodle_right_BKG_out[7:0];
            end 
        else if(doodle_left_BKG_on == 1)
            begin 
                Red = doodle_left_BKG_out[23:16];
                Green = doodle_left_BKG_out[15:8];
                Blue = doodle_left_BKG_out[7:0];
            end
        else if(spring_on)
            begin 
                Red = 8'h7F;
                Green = 8'h0;
                Blue = 8'hFF; 
            end 
        else if(spring1_on)
            begin 
                Red = 8'h7F;
                Green = 8'h0;
                Blue = 8'hFF; 
            end 
        else if(spring2_on)
            begin 
                Red = 8'h7F;
                Green = 8'h0;
                Blue = 8'hFF; 
            end 
        else if(spring3_on)
            begin 
                Red = 8'h7F;
                Green = 8'h0;
                Blue = 8'hFF; 
            end   
        else if(rocket_on) 
            begin
                Red = 8'h33; 
                Green = 8'h0;
                Blue = 8'h33; 
            end           
        //turn on pixels for the platforms 
            // difficulty plats 
        else if(platform_easy_on)
            begin
                Red = 8'h00;
                Green = 8'h00;
                Blue = 8'hAA; 
            end 
        else if(platform_medium_on)
            begin
                Red = 8'h00;
                Green = 8'hAA;
                Blue = 8'h00; 
            end 
        else if(platform_hard_on)
            begin
                Red = 8'hAA;
                Green = 8'h00;
                Blue = 8'h00; 
            end         
        else if(monster_on)
            begin
                Red = monster_BKG_out[23:16];
                Green = monster_BKG_out[15:8];
                Blue = monster_BKG_out[7:0]; 
            end         
// ~~~~~~~~~~~~~~~~~~~~~~~~~platform color logic 

        else if(S_on)
            begin 
                Red = S_BKG_out[23:16];
                Green = S_BKG_out[15:8];
                Blue = S_BKG_out[7:0];
            end

        else if(C_on)
            begin 
                Red = C_BKG_out[23:16];
                Green = C_BKG_out[15:8];
                Blue = C_BKG_out[7:0];
            end

        else if(O_on)
            begin 
                Red = O_BKG_out[23:16];
                Green = O_BKG_out[15:8];
                Blue = O_BKG_out[7:0];
            end

        else if(R_on)
            begin 
                Red = R_BKG_out[23:16];
                Green = R_BKG_out[15:8];
                Blue = R_BKG_out[7:0];
            end

        else if(E_on)
            begin 
                Red = E_BKG_out[23:16];
                Green = E_BKG_out[15:8];
                Blue = E_BKG_out[7:0];
            end
        
        else if(D_on)
            begin 
                Red = D_BKG_out[23:16];
                Green = D_BKG_out[15:8];
                Blue = D_BKG_out[7:0];
            end

        else if(J_on)
            begin 
                Red = J_BKG_out[23:16];
                Green = J_BKG_out[15:8];
                Blue = J_BKG_out[7:0];
            end

        else if(U_on)
            begin 
                Red = U_BKG_out[23:16];
                Green = U_BKG_out[15:8];
                Blue = U_BKG_out[7:0];
            end

        else if(M_on)
            begin 
                Red = M_BKG_out[23:16];
                Green = M_BKG_out[15:8];
                Blue = M_BKG_out[7:0];
            end

        else if(P_on)
            begin 
                Red = P_BKG_out[23:16];
                Green = P_BKG_out[15:8];
                Blue = P_BKG_out[7:0];
            end

        else if(L_on)
            begin 
                Red = L_BKG_out[23:16];
                Green = L_BKG_out[15:8];
                Blue = L_BKG_out[7:0];
            end

        else if(G_on)
            begin 
                Red = 8'h00;
                Green = 8'h00;
                Blue = 8'h00;
            end

        else if(one_on == 1)
                begin 
                    Red = one_BKG_out[23:16];
                    Green = one_BKG_out[15:8];
                    Blue = one_BKG_out[7:0];
                end
            
        else if(two_on == 1)
            begin 
                Red = two_BKG_out[23:16];
                Green = two_BKG_out[15:8];
                Blue = two_BKG_out[7:0];
            end

        else if(three_on == 1)
            begin 
                Red = three_BKG_out[23:16];
                Green = three_BKG_out[15:8];
                Blue = three_BKG_out[7:0];
            end

        else if(four_on == 1)
            begin 
                Red = four_BKG_out[23:16];
                Green = four_BKG_out[15:8];
                Blue = four_BKG_out[7:0];
            end

        else if(five_on == 1)
            begin 
                Red = five_BKG_out[23:16];
                Green = five_BKG_out[15:8];
                Blue = five_BKG_out[7:0];
            end

        else if(six_on == 1)
            begin 
                Red = six_BKG_out[23:16];
                Green = six_BKG_out[15:8];
                Blue = six_BKG_out[7:0];
            end

        else if(seven_on == 1)
            begin 
                Red = seven_BKG_out[23:16];
                Green = seven_BKG_out[15:8];
                Blue = seven_BKG_out[7:0];
            end

        else if(eight_on == 1)
            begin 
                Red = eight_BKG_out[23:16];
                Green = eight_BKG_out[15:8];
                Blue = eight_BKG_out[7:0];
            end

        else if(nine_on == 1)
            begin 
                Red = nine_BKG_out[23:16];
                Green = nine_BKG_out[15:8];
                Blue = nine_BKG_out[7:0];
            end

        else if(zero_on == 1)
            begin 
                Red = zero_BKG_out[23:16];
                Green = zero_BKG_out[15:8];
                Blue = zero_BKG_out[7:0];
            end

        else if(greenplat16_on)
            begin   
                Red = greenplat16_out[23:16];
                Green = greenplat16_out[15:8];
                Blue = greenplat16_out[7:0];
            end
        else if(blueplat16_on)
            begin  
                if(greenplat16_out == 24'h0)
                begin  
                    Red = greenplat16_out[23:16];
                    Green = greenplat16_out[15:8];
                    Blue = greenplat16_out[7:0];
                end 
                else 
                begin
                    Red = 0;
                    Green = 0; 
                    Blue = 8'hFF;
                end 
            end
        else if(yellowplat16_on)
            begin  
                if(greenplat16_out == 24'h0)
                begin  
                    Red = greenplat16_out[23:16];
                    Green = greenplat16_out[15:8];
                    Blue = greenplat16_out[7:0];
                end 
                else 
                begin
                    Red = 8'hFF;
                    Green = 8'hFF; 
                    Blue = 8'h0;
                end 
            end
        else if(whiteplat16_on)
            begin  
                if(greenplat16_out == 24'h0)
                begin  
                    Red = greenplat16_out[23:16];
                    Green = greenplat16_out[15:8];
                    Blue = greenplat16_out[7:0];
                end 
                else 
                begin
                    Red = 8'hFF;
                    Green = 8'hFF; 
                    Blue = 8'hFF;
                end 
            end
        else if(brownplat16_on)
            begin  
                if(greenplat16_out == 24'h0)
                begin  
                    Red = greenplat16_out[23:16];
                    Green = greenplat16_out[15:8];
                    Blue = greenplat16_out[7:0];
                end 
                else 
                begin
                    Red = 8'hA0;
                    Green = 8'h52; 
                    Blue = 8'h2D;
                end 
            end
        else if(greenplat32_on)
            begin   
                Red = greenplat32_out[23:16];
                Green = greenplat32_out[15:8];
                Blue = greenplat32_out[7:0];
            end
        else if(blueplat32_on)
            begin  
                if(greenplat32_out == 24'h0)
                begin  
                    Red = greenplat32_out[23:16];
                    Green = greenplat32_out[15:8];
                    Blue = greenplat32_out[7:0];
                end 
                else 
                begin
                    Red = 0;
                    Green = 0; 
                    Blue = 8'hFF;
                end 
            end
        else if(yellowplat32_on)
            begin  
                if(greenplat32_out == 24'h0)
                begin  
                    Red = greenplat32_out[23:16];
                    Green = greenplat32_out[15:8];
                    Blue = greenplat32_out[7:0];
                end 
                else 
                begin
                    Red = 8'hFF;
                    Green = 8'hFF; 
                    Blue = 8'h0;
                end 
            end
        else if(whiteplat32_on)
            begin  
                if(greenplat32_out == 24'h0)
                begin  
                    Red = greenplat32_out[23:16];
                    Green = greenplat32_out[15:8];
                    Blue = greenplat32_out[7:0];
                end 
                else 
                begin
                    Red = 8'hFF;
                    Green = 8'hFF; 
                    Blue = 8'hFF;
                end 
            end
        else if(brownplat32_on)
            begin  
                if(greenplat32_out == 24'h0)
                begin  
                    Red = greenplat32_out[23:16];
                    Green = greenplat32_out[15:8];
                    Blue = greenplat32_out[7:0];
                end 
                else 
                begin
                    Red = 8'hA0;
                    Green = 8'h52; 
                    Blue = 8'h2D;
                end 
            end        
        else if(greenplat64_on)
            begin   
                Red = greenplat64_out[23:16];
                Green = greenplat64_out[15:8];
                Blue = greenplat64_out[7:0];
            end
        else if(blueplat64_on)
            begin  
                if(greenplat64_out == 24'h0)
                begin  
                    Red = greenplat64_out[23:16];
                    Green = greenplat64_out[15:8];
                    Blue = greenplat64_out[7:0];
                end 
                else 
                begin
                    Red = 0;
                    Green = 0; 
                    Blue = 8'hFF;
                end 
            end
        else if(yellowplat64_on)
            begin  
                if(greenplat64_out == 24'h0)
                begin  
                    Red = greenplat64_out[23:16];
                    Green = greenplat64_out[15:8];
                    Blue = greenplat64_out[7:0];
                end 
                else 
                begin
                    Red = 8'hFF;
                    Green = 8'hFF; 
                    Blue = 8'h0;
                end 
            end
        else if(whiteplat64_on)
            begin  
                if(greenplat64_out == 24'h0)
                begin  
                    Red = greenplat64_out[23:16];
                    Green = greenplat64_out[15:8];
                    Blue = greenplat64_out[7:0];
                end 
                else 
                begin
                    Red = 8'hFF;
                    Green = 8'hFF; 
                    Blue = 8'hFF;
                end 
            end
        else if(brownplat64_on)
            begin  
                if(greenplat64_out == 24'h0)
                begin  
                    Red = greenplat64_out[23:16];
                    Green = greenplat64_out[15:8];
                    Blue = greenplat64_out[7:0];
                end 
                else 
                begin
                    Red = 8'hA0;
                    Green = 8'h52; 
                    Blue = 8'h2D;
                end 
            end
        
        // turn on pixels for the cannon 
            else if(cannon_on)
                begin 
                    Red = cannon_BKG_out[23:16]; 
                    Green = cannon_BKG_out[15:8]; 
                    Blue = cannon_BKG_out[7:0]; 
                end 
            else if(cannon_on1)
                begin 
                    Red = cannon1_BKG_out[23:16]; 
                    Green = cannon1_BKG_out[15:8]; 
                    Blue = cannon1_BKG_out[7:0]; 
                end 
            else if(cannon_on2)
                begin 
                    Red = cannon2_BKG_out[23:16]; 
                    Green = cannon2_BKG_out[15:8]; 
                    Blue = cannon2_BKG_out[7:0]; 
                end 
            
            else if(doodle_left_BKG_on == 1)
                begin 
                    Red = doodle_left_BKG_out[23:16];
                    Green = doodle_left_BKG_out[15:8];
                    Blue = doodle_left_BKG_out[7:0];
                end

            else if(underwater_BKG_on == 1)
                begin 
                    Red = underwater_BKG_out[23:16];
                    Green = underwater_BKG_out[15:8];
                    Blue = underwater_BKG_out[7:0];
                end 		 

            else if(soccer_BKG_on == 1)
                begin 
                    Red = soccer_BKG_out[23:16];
                    Green = soccer_BKG_out[15:8];
                    Blue = soccer_BKG_out[7:0];
                end
            else if(space_BKG_on == 1)
                begin 
                    Red = space_BKG_out[23:16];
                    Green = space_BKG_out[15:8];
                    Blue = space_BKG_out[7:0];
                end 

			else 
                begin 
                    Red = 8'hED;
                    Green = 8'hE2;
                    Blue = 8'hD4;
                end 	
                
    end 

logic PlatformBrown_collision0; 
logic PlatformBrown_collision1; 
logic PlatformBrown_collision2; 
logic PlatformBrown_collision3; 
logic PlatformBrown_collision4; 
logic PlatformBrown_collision5; 
logic PlatformBrown_collision6; 
logic PlatformBrown_collision7; 
logic PlatformBrown_collision8; 
logic PlatformBrown_collision9; 
logic PlatformBrown_collision10; 
logic PlatformBrown_collision11; 
logic PlatformBrown_collision12; 
logic PlatformBrown_collision13; 
logic PlatformBrown_collision14; 
logic PlatformBrown_collision15; 

always_comb 
    begin 

    PlatformBrown_collision0 = (plat0_color == 3'b100 && (DoodleY + Doodle_size <= platY + plat_sizeY) && (DoodleY + Doodle_size >= platY - plat_sizeY) && (platX + plat_sizeX >= DoodleX - Doodle_size ) && (platX - plat_sizeX <= DoodleX + Doodle_size));
	PlatformBrown_collision1 = (plat1_color == 3'b100 && (DoodleY + Doodle_size <= platY1 + plat_sizeY) &&(DoodleY + Doodle_size >= platY1 - plat_sizeY) && (platX1 + plat_sizeX >= DoodleX - Doodle_size) && (platX1 - plat_sizeX <= DoodleX + Doodle_size)); 
	PlatformBrown_collision2 = (plat2_color == 3'b100 && (DoodleY + Doodle_size <= platY2 + plat_sizeY) &&(DoodleY + Doodle_size >= platY2 - plat_sizeY) && (platX2 + plat_sizeX >= DoodleX - Doodle_size) && (platX2 - plat_sizeX <= DoodleX + Doodle_size));
	PlatformBrown_collision3 = (plat3_color == 3'b100 && (DoodleY + Doodle_size <= platY3 + plat_sizeY) &&(DoodleY + Doodle_size >= platY3 - plat_sizeY) && (platX3 + plat_sizeX >= DoodleX - Doodle_size) && (platX3 - plat_sizeX <= DoodleX + Doodle_size));
	PlatformBrown_collision4 = (plat4_color == 3'b100 && (DoodleY + Doodle_size <= platY4 + plat_sizeY) &&(DoodleY + Doodle_size >= platY4 - plat_sizeY) && (platX4 + plat_sizeX >= DoodleX - Doodle_size) && (platX4 - plat_sizeX <= DoodleX + Doodle_size));
	PlatformBrown_collision5 = (plat5_color == 3'b100 && (DoodleY + Doodle_size <= platY5 + plat_sizeY) &&(DoodleY + Doodle_size >= platY5 - plat_sizeY) && (platX5 + plat_sizeX >= DoodleX - Doodle_size) && (platX5 - plat_sizeX <= DoodleX + Doodle_size));
	PlatformBrown_collision6 = (plat6_color == 3'b100 && (DoodleY + Doodle_size <= platY6 + plat_sizeY) &&(DoodleY + Doodle_size >= platY6 - plat_sizeY) && (platX6 + plat_sizeX >= DoodleX - Doodle_size) && (platX6 - plat_sizeX <= DoodleX + Doodle_size));
	PlatformBrown_collision7 = (plat7_color == 3'b100 && (DoodleY + Doodle_size <= platY7 + plat_sizeY) &&(DoodleY + Doodle_size >= platY7 - plat_sizeY) && (platX7 + plat_sizeX >= DoodleX - Doodle_size) && (platX7 - plat_sizeX <= DoodleX + Doodle_size));
	PlatformBrown_collision8 = (plat8_color == 3'b100 && (DoodleY + Doodle_size <= platY8 + plat_sizeY) &&(DoodleY + Doodle_size >= platY8 - plat_sizeY) && (platX8 + plat_sizeX >= DoodleX - Doodle_size) && (platX8 - plat_sizeX <= DoodleX + Doodle_size));
	PlatformBrown_collision9 = (plat9_color == 3'b100 && (DoodleY + Doodle_size <= platY9 + plat_sizeY) &&(DoodleY + Doodle_size >= platY9 - plat_sizeY) && (platX9 + plat_sizeX >= DoodleX - Doodle_size) && (platX9 - plat_sizeX <= DoodleX + Doodle_size));
	PlatformBrown_collision10 = (plat10_color == 3'b100 && (DoodleY + Doodle_size <= platY10  + plat_sizeY) &&(DoodleY + Doodle_size >= platY10 - plat_sizeY) && (platX10 + plat_sizeX >= DoodleX - Doodle_size) && (platX10 - plat_sizeX <= DoodleX + Doodle_size));
	PlatformBrown_collision11 = (plat11_color == 3'b100 && (DoodleY + Doodle_size <= platY11  + plat_sizeY) &&(DoodleY + Doodle_size >= platY11 - plat_sizeY) && (platX11 + plat_sizeX >= DoodleX - Doodle_size) && (platX11 - plat_sizeX <= DoodleX + Doodle_size));
	PlatformBrown_collision12 = (plat12_color == 3'b100 && (DoodleY + Doodle_size <= platY12  + plat_sizeY) &&(DoodleY + Doodle_size >= platY12 - plat_sizeY) && (platX12 + plat_sizeX >= DoodleX - Doodle_size) && (platX12 - plat_sizeX <= DoodleX + Doodle_size));
	PlatformBrown_collision13 = (plat13_color == 3'b100 && (DoodleY + Doodle_size <= platY13  + plat_sizeY) &&(DoodleY + Doodle_size >= platY13 - plat_sizeY) && (platX13 + plat_sizeX >= DoodleX - Doodle_size) && (platX13 - plat_sizeX <= DoodleX + Doodle_size));
	PlatformBrown_collision14 = (plat14_color == 3'b100 && (DoodleY + Doodle_size <= platY14  + plat_sizeY) &&(DoodleY + Doodle_size >= platY14 - plat_sizeY) && (platX14 + plat_sizeX >= DoodleX - Doodle_size) && (platX14 - plat_sizeX <= DoodleX + Doodle_size));
	PlatformBrown_collision15 = (plat15_color == 3'b100 && (DoodleY + Doodle_size <= platY15  + plat_sizeY) &&(DoodleY + Doodle_size >= platY15 - plat_sizeY) && (platX15 + plat_sizeX >= DoodleX - Doodle_size) && (platX15 - plat_sizeX <= DoodleX + Doodle_size));


    end

endmodule