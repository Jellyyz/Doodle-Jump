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
                    output logic plat_enable, plat_reset, test
);  
    parameter [9:0] Screen_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Screen_Y_Max=479;     // Bottommost point on the Y axis

    logic Doodle_on;


    int DistX, DistY, Size;
	assign DistX = DrawX - DoodleX;
    assign DistY = DrawY - DoodleY;
    assign Size = Doodle_size;

// these LFSR are a chain of Shift Registers that generate 16 strings of 9 bit random numbers for platX
logic seed_en, seed_en1, seed_en2, seed_en3, seed_en4, seed_en5, seed_en6, seed_en7, seed_en8, seed_en9, seed_en10, seed_en11, seed_en12, seed_en13, seed_en14, seed_en15;
LFSR LFSR(
    .Clk(Clk), .Reset(Reset), .outp(testX[8:0]), .seed_out(seed_en)
);
LFSR LFSR1(
    .Clk(Clk), .Reset(Reset), .outp(testX1[8:0]), .seed(testX[8:0]), .seed_in(seed_en), .seed_out(seed_en1)
);
LFSR LFSR2(
    .Clk(Clk), .Reset(Reset), .outp(testX2[8:0]), .seed(testX1[8:0]), .seed_in(seed_en1), .seed_out(seed_en2)
);
LFSR LFSR3(
    .Clk(Clk), .Reset(Reset), .outp(testX3[8:0]), .seed(testX2[8:0]), .seed_in(seed_en2), .seed_out(seed_en3)
);
LFSR LFSR4(
    .Clk(Clk), .Reset(Reset), .outp(testX4[8:0]), .seed(testX3[8:0]), .seed_in(seed_en3), .seed_out(seed_en4)
);
LFSR LFSR5(
    .Clk(Clk), .Reset(Reset), .outp(testX5[8:0]), .seed(testX4[8:0]), .seed_in(seed_en4), .seed_out(seed_en5)
);
LFSR LFSR6(
    .Clk(Clk), .Reset(Reset), .outp(testX6[8:0]), .seed(testX5[8:0]), .seed_in(seed_en5), .seed_out(seed_en6)
);
LFSR LFSR7(
    .Clk(Clk), .Reset(Reset), .outp(testX7[8:0]), .seed(testX6[8:0]), .seed_in(seed_en6), .seed_out(seed_en7)
);
LFSR LFSR8(
    .Clk(Clk), .Reset(Reset), .outp(testX8[8:0]), .seed(testX7[8:0]), .seed_in(seed_en7), .seed_out(seed_en8)
);
LFSR LFSR9(
    .Clk(Clk), .Reset(Reset), .outp(testX9[8:0]), .seed(testX8[8:0]), .seed_in(seed_en8), .seed_out(seed_en9)
);
LFSR LFSR10(
    .Clk(Clk), .Reset(Reset), .outp(testX10[8:0]), .seed(testX9[8:0]), .seed_in(seed_en9), .seed_out(seed_en10)
);
LFSR LFSR11(
    .Clk(Clk), .Reset(Reset), .outp(testX11[8:0]), .seed(testX10[8:0]), .seed_in(seed_en10), .seed_out(seed_en11)
);
LFSR LFSR12(
    .Clk(Clk), .Reset(Reset), .outp(testX12[8:0]), .seed(testX11[8:0]), .seed_in(seed_en11), .seed_out(seed_en12)
);
LFSR LFSR13(
    .Clk(Clk), .Reset(Reset), .outp(testX13[8:0]), .seed(testX12[8:0]), .seed_in(seed_en12), .seed_out(seed_en13)
);
LFSR LFSR14(
    .Clk(Clk), .Reset(Reset), .outp(testX14[8:0]), .seed(testX13[8:0]), .seed_in(seed_en13), .seed_out(seed_en14)
);
LFSR LFSR15(
    .Clk(Clk), .Reset(Reset), .outp(testX15[8:0]), .seed(testX15[8:0]), .seed_in(seed_en14), .seed_out(seed_en15)
);
 logic [8:0]testX,testX1, testX2, testX3, testX4, testX5, testX6, testX7,  testX8, testX9, testX10, testX11, testX12, testX13, testX14, testX15;
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
// this is for calculation of platX
always_ff @ (posedge loadplat)
    begin 
        if(testX >= 9'h0 && testX <= 9'd400)
            platX = testX + 9'd100;
        else 
            platX = testX; 
        if(testX1 >= 9'h0 && testX1 <= 9'd400)
            platX1 = testX1 + 9'd100;
        else 
            platX1 = testX1; 
        if(testX2 >= 9'h0 && testX2 <= 9'd400)
            platX2 = testX2 + 9'd100; 
        else 
            platX2 = testX2; 
        if(testX3 >= 9'h0 && testX3 <= 9'd400)
            platX3 = testX3 + 9'd100;  
        else 
            platX3 = testX3; 
        if(testX4 >= 9'h0 && testX4 <= 9'd400)
            platX4 = testX4 + 9'd100; 
        else 
            platX4 = testX4; 
        if(testX5 >= 9'h0 && testX5 <= 9'd400)
            platX5 = testX5 + 9'd100; 
        else 
            platX5 = testX5; 
        if(testX6 >= 9'h0 && testX6 <= 9'd400)
            platX6 = testX6 + 9'd100; 
        else 
            platX6 = testX6; 
        if(testX7 >= 9'h0 && testX7 <= 9'd400)
            platX7 = testX7 + 9'd100;
        else 
            platX7 = testX7; 
        if(testX8 >= 9'h0 && testX8 <= 9'd400)
            platX8 = testX8 + 9'd100; 
        else 
            platX8 = testX8; 
        if(testX9 >= 9'h0 && testX9 <= 9'd400)
            platX9 = testX9 + 9'd100; 
        else 
            platX9 = testX9; 
        if(testX10 >= 9'h0 && testX10 <= 9'd400)
            platX10 = testX10 + 9'd100; 
        else 
            platX10 = testX10; 
        if(testX11 >= 9'h0 && testX11 <= 9'd400)
            platX11 = testX11 + 9'd100;      
        else 
            platX11 = testX11; 
        if(testX12 >= 9'h0 && testX12 <= 9'd400)
            platX12 = testX12 + 9'd100; 
        else 
            platX12 = testX12; 
        if(testX13 >= 9'h0 && testX13 <= 9'd400)
            platX13 = testX13 + 9'd100;
        else 
            platX13 = testX13; 
        if(testX14 >= 9'h0 && testX14 <= 9'd400)
            platX14 = testX14 + 9'd100; 
        else 
            platX14 = testX14; 
        if(testX15 >= 9'h0 && testX15 <= 9'd400)
            platX15 = testX15 + 9'd100;    
        else 
            platX15 = testX15; 

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
                platY9 <= 9'd300;
                platY10 <= 9'd430;
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
    assign plat_size_easy_Y = 9'd200;
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
    assign plat_size_medium_Y = 9'd200;
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
    assign plat_size_hard_Y = 9'd200;
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
            else if(outstate == 3'b000)
            begin 
                Red = 8'h00; 
                Green = 8'h00;
                Blue = 8'h00;
            end  
            else 
            begin 
                Red = 8'hEE; 
                Green = 8'hEE;
                Blue = 8'hEE;
            end      
        end 
 

endmodule
