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
//    For use with ECE 385 Lab 7                                         --
//    University of Illinois ECE Department                              --
//    Modifed by Gally && Feng Zhao April/May 2022                      --
//    University of Illinois ECE Department                              --
//    University of Illinois ECE Department                              --
//    University of Illinois ECE Department                              --
//    University of Illinois ECE Department                              --
//    University of Illinois ECE Department                              --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper ( 
                    input logic Clk, Reset, frame_clk, pixel_clk,
					input logic        [9:0] DoodleX, DoodleY, DrawX, DrawY, Doodle_size,
                    input logic        [6:0] keycode, 
                    input logic        [5:0] outstate,
					input logic [9:0]  CannonX, CannonY, CannonS, 
					input logic [9:0]  CannonX1, CannonY1, 
					input logic [9:0]  CannonX2, CannonY2, 
                    input logic [8:0]  plat_temp_Y,
					input logic loadplat, 
                    input logic [7:0] airtime,
                    input logic [1:0] difficulty, 
                    input logic [11:0] Score,
						  
						  
                    output logic [7:0] temp, 
                    output logic [31:0] countingplat,
                    output logic trigger, 
                    output logic [7:0]  Red, Green, Blue,
                    output logic [8:0]platX, platY, plat_sizeX, plat_sizeY,
                    output logic [8:0]platX1, platY1, platX2, platY2, platX3, platY3, platX4, platY4, 
                    output logic [8:0]platX5, platY5, platX6, platY6, platX7, platY7, platX8, platY8, 
                    output logic [8:0]platX9, platY9, platX10, platY10, platX11, platY11, platX12, platY12, 
                    output logic [8:0]platX13, platY13, platX14, platY14, platX15, platY15,
                    output logic [8:0]plat_size_easy_X, plat_size_medium_X, plat_size_hard_X,                    
                    output logic [8:0]plat_size_easy_Y, plat_size_medium_Y, plat_size_hard_Y,
                    output logic plat_enable, plat_reset, test, 
                    output logic [8:0] readyX, testX,
                    output logic [23:0] BKG_out,
                    output logic [23:0] BKG_out2,
                    output logic [3:0]BKG_on,
                    output logic [3:0]BKG_on2
);  
    parameter [9:0] Screen_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Screen_Y_Max=479;     // Bottommost point on the Y axis

    logic Doodle_on;



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
// these LFSR are a chain of Shift Registers that generate 16 strings of 9 bit random numbers for platX
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
logic [8:0] testX1, testX2, testX3, testX4, testX5, testX6, testX7,  testX8, testX9, testX10, testX11, testX12, testX13, testX14, testX15;
logic [8:0] readyX1, readyX2, readyX3, readyX4, readyX5, readyX6, readyX7,  readyX8, readyX9, readyX10, readyX11, readyX12, readyX13, readyX14, readyX15;
// checking if the platforms are close enough to each other 

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
// safety to ensure game is winnable
always_ff @ (posedge frame_clk)
begin 
    if (testX <= 9'h1E0) 
        readyX <= testX;
    if (1) 
        readyX1 <= testX1;
    if (testX2 <= 9'h1E0) 
        readyX2 <= testX2;
    if (1) 
        readyX3 <= testX3;
    if (testX4 <= 9'h1E0)
        readyX4 <= testX4;
    if (1)
        readyX5 <= testX5;
    if (testX6 <= 9'h1E0)
        readyX6 <= testX6;
    if (1) 
        readyX7 <= testX7;
    if (testX8 <= 9'h1E0)
        readyX8 <= testX8;
    if (1)
        readyX9 <= testX9;
    if (testX10 <= 9'h1E0)
        readyX10 <= testX10;
    if (1)
        readyX11 <= testX11;
    if (testX12 <= 9'h1E0)
        readyX12 <= testX12;
    if (1)
        readyX13 <= testX13;
    if (testX14 <= 9'h1E0)
        readyX14 <= testX14;
    if (1) 
        readyX15 <= testX15; 
end 
// this is for calculation of platX
always_ff @ (posedge loadplat or 
posedge plat_offscreen[0] or
posedge plat_offscreen[1] or
posedge plat_offscreen[2] or
posedge plat_offscreen[3] or
posedge plat_offscreen[4] or
posedge plat_offscreen[5] or
posedge plat_offscreen[6] or
posedge plat_offscreen[7] or
posedge plat_offscreen[8] or
posedge plat_offscreen[9] or
posedge plat_offscreen[10] or
posedge plat_offscreen[11] or
posedge plat_offscreen[12] or
posedge plat_offscreen[13] or
posedge plat_offscreen[14] or
posedge plat_offscreen[15]

)
    begin 
        if(loadplat || plat_offscreen[0])
            begin 
                if(readyX > 9'h0 && readyX <= 9'd100)
                    platX = readyX + 9'd100;
                else 
                    platX = readyX; 
            end 
        if(loadplat || plat_offscreen[1])
            begin 
                if(readyX1 > 9'h0 && readyX1 <= 9'd100)
                    platX1 = readyX1 + 9'd100;
                else 
                    platX1 = readyX1; 
            end 
        if(loadplat || plat_offscreen[2])
            begin 
                if(readyX2 > 9'h0 && readyX2 <= 9'd100)
                    platX2 = readyX2 + 9'd100;
                else 
                    platX2 = readyX2; 
            end 
        if(loadplat || plat_offscreen[3])
            begin 
                if(readyX3 > 9'h0 && readyX3 <= 9'd100)
                    platX3 = readyX3 + 9'd100;
                else 
                    platX3 = readyX3; 
            end 
        if(loadplat || plat_offscreen[4])
            begin 
                if(readyX4 > 9'h0 && readyX4 <= 9'd100)
                    platX4 = readyX4 + 9'd100;
                else 
                    platX4 = readyX4; 
            end 
        if(loadplat || plat_offscreen[5])
            begin 
                if(readyX5 > 9'h0 && readyX5 <= 9'd100)
                    platX5 = readyX5 + 9'd100;
                else 
                    platX5 = readyX5; 
            end 
        if(loadplat || plat_offscreen[6])
            begin 
                if(readyX6 > 9'h0 && readyX6 <= 9'd100)
                    platX6 = readyX6 + 9'd100;
                else 
                    platX6 = readyX6; 
            end 
        if(loadplat || plat_offscreen[7])
            begin 
                if(readyX7 > 9'h0 && readyX7 <= 9'd100)
                    platX7 = readyX7 + 9'd100;
                else 
                    platX7 = readyX7; 
            end
        if(loadplat || plat_offscreen[8])
            begin 
                if(readyX8 > 9'h0 && readyX8 <= 9'd100)
                    platX8 = readyX8 + 9'd100;
                else 
                    platX8 = readyX8; 
            end 
        if(loadplat || plat_offscreen[9])
            begin 
                if(readyX9 > 9'h0 && readyX9 <= 9'd100)
                    platX9 = readyX9 + 9'd100;
                else 
                    platX9 = readyX9; 
            end 
        if(loadplat || plat_offscreen[10])
            begin 
                if(readyX10 > 9'h0 && readyX10 <= 9'd100)
                    platX10 = readyX10 + 9'd100;
                else 
                    platX10 = readyX10; 
            end 
        if(loadplat || plat_offscreen[11])
            begin 
                if(readyX11 > 9'h0 && readyX11 <= 9'd100)
                    platX11 = readyX11 + 9'd100;
                else 
                    platX11 = readyX11; 
            end 
        if(loadplat || plat_offscreen[12])
            begin 
                if(readyX12 > 9'h0 && readyX12 <= 9'd100)
                    platX12 = readyX12 + 9'd100;
                else 
                    platX12 = readyX12; 
            end 
        if(loadplat || plat_offscreen[13])
            begin 
                if(readyX13 > 9'h0 && readyX13 <= 9'd100)
                    platX13 = readyX13 + 9'd100;
                else 
                    platX13 = readyX13; 
            end 
        if(loadplat || plat_offscreen[14])
            begin 
                if(readyX14 > 9'h0 && readyX14 <= 9'd100)
                    platX14 = readyX14 + 9'd100;
                else 
                    platX14 = readyX14; 
            end 
        if(loadplat || plat_offscreen[15])
            begin 
                if(readyX15 > 9'h0 && readyX15 <= 9'd100)
                    platX15 = readyX15 + 9'd100;
                else 
                    platX15 = readyX15; 
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

always_ff @ (posedge Clk)
    begin 
        // tracks if a platforms has exited the bottom of the screen
        if(platY - plat_sizeY > 9'd480)
            plat_offscreen[0] = 1;
        else   
            plat_offscreen[0] = 0;  
        if(platY1 - plat_sizeY > 9'd480)
            plat_offscreen[1] = 1;
        else   
            plat_offscreen[1] = 0;  
        if(platY2 - plat_sizeY > 9'd480)
            plat_offscreen[2] = 1;
        else   
            plat_offscreen[2] = 0;  
        if(platY3 - plat_sizeY > 9'd480)
            plat_offscreen[3] = 1;
        else   
            plat_offscreen[3] = 0;  
        if(platY4 - plat_sizeY > 9'd480)
            plat_offscreen[4] = 1;
        else   
            plat_offscreen[4] = 0;  
        if(platY5 - plat_sizeY > 9'd480)
            plat_offscreen[5] = 1;
        else   
            plat_offscreen[5] = 0;  
        if(platY6 - plat_sizeY > 9'd480)
            plat_offscreen[6] = 1;
        else   
            plat_offscreen[6] = 0;  
        if(platY7 - plat_sizeY > 9'd480)
            plat_offscreen[7] = 1;
        else   
            plat_offscreen[7] = 0;  
        if(platY8 - plat_sizeY > 9'd480)
            plat_offscreen[8] = 1;
        else   
            plat_offscreen[8] = 0;  
        if(platY9 - plat_sizeY > 9'd480)
            plat_offscreen[9] = 1;
        else   
            plat_offscreen[9] = 0;  
        if(platY10 - plat_sizeY > 9'd480)
            plat_offscreen[10] = 1;
        else   
            plat_offscreen[10] = 0;  
        if(platY11 - plat_sizeY > 9'd480)
            plat_offscreen[11] = 1;
        else   
            plat_offscreen[11] = 0;  
        if(platY12 - plat_sizeY > 9'd480)
            plat_offscreen[12] = 1;
        else   
            plat_offscreen[12] = 0;  
        if(platY13 - plat_sizeY > 9'd480)
            plat_offscreen[13] = 1;
        else   
            plat_offscreen[13] = 0;  
        if(platY14 - plat_sizeY > 9'd480)
            plat_offscreen[14] = 1;
        else   
            plat_offscreen[14] = 0;  
        if(platY15 - plat_sizeY > 9'd480)
            plat_offscreen[15] = 1;
        else   
            plat_offscreen[15] = 0;  
        
    end 
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
// this is the logic for all the misc stuff, cannons, doodles, etc ?
    logic cannon_on; 
    always_comb
    begin:Cannon_on_proc
         if ((DrawX >= CannonX - CannonS) &&
            (DrawX <= CannonX + CannonS) &&
            (DrawY >= CannonY - CannonS) &&
            (DrawY <= CannonY + CannonS)) 
            cannon_on = 1'b1;
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
            cannon_on1 = 1'b1;
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
            cannon_on2 = 1'b1;
        else 
            cannon_on2 = 1'b0;
    end 
       
    always_comb
    begin:Doodle_on_proc
         if ((DrawX >= DoodleX - Doodle_size) &&
            (DrawX <= DoodleX + Doodle_size) &&
            (DrawY >= DoodleY - Doodle_size) &&
            (DrawY <= DoodleY + Doodle_size)) 
            Doodle_on = 1'b1;
        else 
            Doodle_on = 1'b0;
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

// game platforms 
    logic platform_on; 
    always_comb
    begin:Platform_on_proc
            if ((DrawX >= platX - plat_sizeX) &&
                (DrawX <= platX + plat_sizeX) &&
                (DrawY >= platY - plat_sizeY) &&
                (DrawY <= platY + plat_sizeY) && (outstate != 3'b101 || outstate != 3'b000)) 
                platform_on = 1'b1; 
            else 
                platform_on = 1'b0;
        end 
    
    
    
    logic platform_on1; 
    always_comb
    begin:Platform_on_proc1
         if ((DrawX >= platX1 - plat_sizeX) &&
            (DrawX <= platX1 + plat_sizeX) &&
            (DrawY >= platY1 - plat_sizeY) &&
            (DrawY <= platY1 + plat_sizeY) && (outstate != 3'b101 || outstate != 3'b000)) 
            platform_on1 = 1'b1;
        else 
            platform_on1 = 1'b0;
     end 

    logic platform_on2;  
 
    always_comb
    begin:Platform_on_proc2
         if ((DrawX >= platX2 - plat_sizeX) &&
            (DrawX <= platX2 + plat_sizeX) &&
            (DrawY >= platY2 - plat_sizeY) &&
            (DrawY <= platY2 + plat_sizeY) && (outstate != 3'b101 || outstate != 3'b000))
            platform_on2 = 1'b1;
        else 
            platform_on2 = 1'b0;
     end 

    logic platform_on3; 
       
    always_comb
    begin:Platform_on_proc3
         if ((DrawX >= platX3 - plat_sizeX) &&
            (DrawX <= platX3 + plat_sizeX) &&
            (DrawY >= platY3 - plat_sizeY) &&
            (DrawY <= platY3 + plat_sizeY) && (outstate != 3'b101 || outstate != 3'b000))
            platform_on3 = 1'b1;
        else 
            platform_on3 = 1'b0;
     end 

    logic platform_on4; 
       
    always_comb
    begin:Platform_on_proc4
         if ((DrawX >= platX4 - plat_sizeX) &&
            (DrawX <= platX4 + plat_sizeX) &&
            (DrawY >= platY4 - plat_sizeY) &&
            (DrawY <= platY4 + plat_sizeY) && (outstate != 3'b101 || outstate != 3'b000))
            platform_on4 = 1'b1;
        else 
            platform_on4 = 1'b0;
     end 

   logic platform_on5; 
       
    always_comb
    begin:Platform_on_proc5
         if ((DrawX >= platX5 - plat_sizeX) &&
            (DrawX <= platX5 + plat_sizeX) &&
            (DrawY >= platY5 - plat_sizeY) &&
            (DrawY <= platY5 + plat_sizeY) && (outstate != 3'b101 || outstate != 3'b000))
            platform_on5 = 1'b1;
        else 
            platform_on5 = 1'b0;
     end 

    logic platform_on6; 
       
    always_comb
    begin:Platform_on_proc6
         if ((DrawX >= platX6 - plat_sizeX) &&
            (DrawX <= platX6 + plat_sizeX) &&
            (DrawY >= platY6 - plat_sizeY) &&
            (DrawY <= platY6 + plat_sizeY) && (outstate != 3'b101 || outstate != 3'b000))
            platform_on6 = 1'b1;
        else 
            platform_on6 = 1'b0;
     end 

    logic platform_on7;  
       
    always_comb
    begin:Platform_on_proc7
         if ((DrawX >= platX7 - plat_sizeX) &&
            (DrawX <= platX7 + plat_sizeX) &&
            (DrawY >= platY7 - plat_sizeY) &&
            (DrawY <= platY7 + plat_sizeY) && (outstate != 3'b101 || outstate != 3'b000))
            platform_on7 = 1'b1;
        else 
            platform_on7 = 1'b0;
     end 

    logic platform_on8; 
       
    always_comb
    begin:Platform_on_proc8
         if ((DrawX >= platX8 - plat_sizeX) &&
            (DrawX <= platX8 + plat_sizeX) &&
            (DrawY >= platY8 - plat_sizeY) &&
            (DrawY <= platY8 + plat_sizeY) && (outstate != 3'b101 || outstate != 3'b000))
            platform_on8 = 1'b1;
        else 
            platform_on8 = 1'b0;
     end

    logic platform_on9; 
    
    always_comb
    begin:Platform_on_proc9
         if ((DrawX >= platX9 - plat_sizeX) &&
            (DrawX <= platX9 + plat_sizeX) &&
            (DrawY >= platY9 - plat_sizeY) &&
            (DrawY <= platY9 + plat_sizeY) && (outstate != 3'b101 || outstate != 3'b000))
            platform_on9 = 1'b1;
        else 
            platform_on9 = 1'b0;
     end

    logic platform_on10; 
    
    always_comb
    begin:Platform_on_proc10
         if ((DrawX >= platX10 - plat_sizeX) &&
            (DrawX <= platX10 + plat_sizeX) &&
            (DrawY >= platY10 - plat_sizeY) &&
            (DrawY <= platY10 + plat_sizeY) && (outstate != 3'b101 || outstate != 3'b000))
            platform_on10 = 1'b1;
        else 
            platform_on10 = 1'b0;
     end

    logic platform_on11; 
    
    always_comb
    begin:Platform_on_proc11
         if ((DrawX >= platX11 - plat_sizeX) &&
            (DrawX <= platX11 + plat_sizeX) &&
            (DrawY >= platY11 - plat_sizeY) &&
            (DrawY <= platY11 + plat_sizeY) && (outstate != 3'b101 || outstate != 3'b000))
            platform_on11 = 1'b1;
        else 
            platform_on11 = 1'b0;
     end

    logic platform_on12; 
    
    always_comb
    begin:Platform_on_proc12
         if ((DrawX >= platX12 - plat_sizeX) &&
            (DrawX <= platX12 + plat_sizeX) &&
            (DrawY >= platY12 - plat_sizeY) &&
            (DrawY <= platY12 + plat_sizeY) && (outstate != 3'b101 || outstate != 3'b000))
            platform_on12 = 1'b1;
        else 
            platform_on12 = 1'b0;
     end


    logic platform_on13;  
    
    always_comb
    begin:Platform_on_proc13
         if ((DrawX >= platX13 - plat_sizeX) &&
            (DrawX <= platX13 + plat_sizeX) &&
            (DrawY >= platY13 - plat_sizeY) &&
            (DrawY <= platY13 + plat_sizeY) && (outstate != 3'b101 || outstate != 3'b000))
            platform_on13 = 1'b1;
        else 
            platform_on13 = 1'b0;
     end

    logic platform_on14; 
    
    always_comb
    begin:Platform_on_proc14
         if ((DrawX >= platX14 - plat_sizeX) &&
            (DrawX <= platX14 + plat_sizeX) &&
            (DrawY >= platY14 - plat_sizeY) &&
            (DrawY <= platY14 + plat_sizeY) && (outstate != 3'b101 || outstate != 3'b000))
            platform_on14 = 1'b1;
        else 
            platform_on14 = 1'b0;
     end

    logic platform_on15; 
    
    always_comb
    begin:Platform_on_proc15
         if ((DrawX >= platX15 - plat_sizeX) &&
            (DrawX <= platX15 + plat_sizeX) &&
            (DrawY >= platY15 - plat_sizeY) &&
            (DrawY <= platY15 + plat_sizeY) && (outstate != 3'b101 || outstate != 3'b000))
            platform_on15 = 1'b1;
        else 
            platform_on15 = 1'b0;
     end

// ~~~~~~Platforms~~~~~~~~~~~~~       
// writing to the screen
BKG_ram BKG(
    .read_address(BKG_address[14:0]),
    .Clk(Clk), 

    .data_Out(BKG_out[23:0])
); 

BKG2_ram BKG2(
    .read_address(BKG_address2[14:0]),
    .Clk(Clk), 

    .data_Out2(BKG_out2[23:0])
); 

logic [14:0] BKG_address; 
logic [14:0] BKG_address2; 
logic [10:0] shape_size_x = 10'd640;
logic [10:0] shape_size_y = 10'd480;

always_comb
    begin 
        BKG_address = (639 * DrawY) + DrawX;
        BKG_address2 = (639 * DrawY) + DrawX;
        BKG_on = 4'b1; 
        BKG_on2 = 4'b0;
        if(DrawY >= 0 && DrawY < shape_size_y && DrawX >= 0 && DrawX < shape_size_x) //Ball_x = 0
            begin
                if(Score >= 12'b110000000000)
                    begin
                        BKG_on = 4'b0;
                        BKG_on2 = 4'b1;
                    end
                else
                    begin
                        BKG_on = 4'b1;
                        BKG_on2 = 4'b0;
                    end
            end
        else
            begin
            BKG_on = 4'b0; 
            BKG_on2 = 4'b0;
    
            end
    end

always_comb
        begin:RGB_Display
        //turn on pixels for the Doodle 
        if ((Doodle_on)) 
            begin 
                Red = 8'hA5;
                Green = 8'hA5;
                Blue = 8'h25;
            end      
        //turn on pixels for the platforms 
            // difficulty plats 
        else if(platform_easy_on)
            begin
                Red = 8'h00;
                Green = 8'h00;
                Blue = 8'hFF; 
            end 
        else if(platform_medium_on)
            begin
                Red = 8'h00;
                Green = 8'hFF;
                Blue = 8'h00; 
            end 
        else if(platform_hard_on)
            begin
                Red = 8'hFF;
                Green = 8'h00;
                Blue = 8'h00; 
            end         
            // normal plats
        else if(
            (platform_on) || 
            (platform_on1) ||
            (platform_on2) || 
            (platform_on3) ||
            (platform_on4) || 
            (platform_on5) ||
            (platform_on6) || 
            (platform_on7) ||       
            (platform_on8) || 
            (platform_on9) ||
            (platform_on10) || 
            (platform_on11) ||
            (platform_on12) ||
            (platform_on13) ||
            (platform_on14) || 
            (platform_on15)
            ) 
            begin 
                Red = 8'h66;
                Green = 8'hDD;
                Blue = 8'h11;
            end 
        // turn on pixels for the cannon 
            else if(cannon_on)
            begin 
                Red = 8'hFF; 
                Green = 8'h00; 
                Blue = 8'h00; 
            end 
            else if(cannon_on1)
            begin 
                Red = 8'hFF; 
                Green = 8'h33; 
                Blue = 8'h33; 
            end 
            else if(cannon_on2)
            begin 
                Red = 8'hFF; 
                Green = 8'h66; 
                Blue = 8'h66; 
            end 
        // turn on pixels for the background
            // else if(outstate == 3'b000)
            // begin 
            //     Red = 8'h00; 
            //     Green = 8'h00;
            //     Blue = 8'h00;
            // end  
            // else 
            // begin 
            //     Red = 8'hEE; 
            //     Green = 8'hEE;
            //     Blue = 8'hEE;
            // end      
            else if(BKG_on == 4'b1)
                begin 
                    Red = BKG_out[23:16];
                    Green = BKG_out[15:8];
                    Blue = BKG_out[7:0];
                end 		 

            else if(BKG_on2 == 4'b1)
                begin 
                    Red = BKG_out2[23:16];
                    Green = BKG_out2[15:8];
                    Blue = BKG_out2[7:0];
                end 
			else 
                begin 
                    Red = 8'hED;
                    Green = 8'hE2;
                    Blue = 8'hD4;
                end 	
                
        end 
 

endmodule
