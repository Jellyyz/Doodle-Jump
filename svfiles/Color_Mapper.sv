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
                    input Clk, Reset, frame_clk, pixel_clk,
                    input loadplat, 
					input        [9:0] DoodleX, DoodleY, DrawX, DrawY, Doodle_size,
                    input        [6:0] keycode, 
                    input        [2:0] outstate,
                    input        [9:0] CannonX, CannonY, CannonS,  
                    input [9:0] Doodle_Y_Pos, plat_temp_Y,
                    input [7:0] displacement,
                    input       refresh_en,


                    output trigger, 
                    output [7:0]  Red, Green, Blue,
                    output [8:0]platX, platY, plat_sizeX, plat_sizeY,
                    output [8:0]platX1, platY1, 
                    output [8:0]platX2, platY2, 
                    output [8:0]platX3, platY3, 
                    output [8:0]platX4, platY4, 
                    output [8:0]platX5, platY5, 
                    output [8:0]platX6, platY6, 
                    output [8:0]platX7, platY7, 
                    output [8:0]platX8, platY8, 
                    output [8:0]platX9, platY9, 
                    output [8:0]platX10, platY10, 
                    output [8:0]platX11, platY11, 
                    output [8:0]platX12, platY12, 
                    output [8:0]platX13, platY13, 
                    output [8:0]platX14, platY14, 
                    output [8:0]platX15, platY15
);  
    parameter [9:0] Screen_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Screen_Y_Max=479;     // Bottommost point on the Y axis

    logic Doodle_on;


    int DistX, DistY, Size;
	assign DistX = DrawX - DoodleX;
    assign DistY = DrawY - DoodleY;
    assign Size = Doodle_size;
	  
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
// this is for calculation of platX
always_ff@(posedge loadplat)
    begin 
        if(testX >= 0 && testX<= 500)
            platX <= testX + 9'd100;
        else 
            platX <= testX; 
        if(testX1 >= 0 && testX1<= 500)
            platX1 <= testX1 + 9'd100;
        else 
            platX1 <= testX1; 
        if(testX2 >= 0 && testX2<= 500)
            platX2 <= testX2 + 9'd100; 
        else 
            platX2 <= testX2; 
        if(testX3 >= 0 && testX3<= 500)
            platX3 <= testX3 + 9'd100;  
        else 
            platX3 <= testX3; 
        if(testX4 >= 0 && testX4<= 500)
            platX4 <= testX4 + 9'd100; 
        else 
            platX4 <= testX4; 
        if(testX5 >= 0 && testX5<= 500)
            platX5 <= testX5 + 9'd100; 
        else 
            platX5 <= testX5; 
        if(testX6 >= 0 && testX6<= 500)
            platX6 <= testX6 + 9'd100; 
        else 
            platX6 <= testX6; 
        if(testX7 >= 0 && testX7<= 500)
            platX7 <= testX7 + 9'd100;
        else 
            platX7 <= testX7; 
        if(testX8 >= 0 && testX8<= 500)
            platX8 <= testX8 + 9'd100; 
        else 
            platX8 <= testX8; 
        if(testX9 >= 0 && testX9<= 500)
            platX9 <= testX9 + 9'd100; 
        else 
            platX9 <= testX9; 
        if(testX10 >= 0 && testX10<= 500)
            platX10 <= testX10 + 9'd100; 
        else 
            platX10 <= testX10; 
        if(testX11 >= 0 && testX11<= 500)
            platX11 <= testX11 + 9'd100;      
        else 
            platX11 <= testX11; 
        if(testX12 >= 0 && testX12<= 500)
            platX12 <= testX12 + 9'd100; 
        else 
            platX12 <= testX12; 
        if(testX13 >= 0 && testX13<= 500)
            platX13 <= testX13 + 9'd100;
        else 
            platX13 <= testX13; 
        if(testX14 >= 0 && testX14<= 500)
            platX14 <= testX14 + 9'd100; 
        else 
            platX14 <= testX14; 
        if(testX15 >= 0 && testX15<= 500)
            platX15 <= testX15 + 9'd100;    
        else 
            platX15 <= testX15; 
    
    end 


// initial Y values of the platforms before anything, should be loaded in loadplat
logic [8:0]testY, testY1, testY2, testY3, testY4, testY5, testY6, testY7, testY8, testY9, testY10, testY11, testY12, testY13, testY14, testY15;
assign testY = 9'd030;
assign testY1 = 9'd060;
assign testY2 = 9'd090 ;
assign testY3 = 9'd0120 ;
assign testY4 = 9'd150 ;
assign testY5 = 9'd180 ;
assign testY6 = 9'd210 ;
assign testY7 = 9'd240 ;
assign testY8 = 9'd270 ;
assign testY9 = 9'd300 ;
assign testY10 = 9'd330 ;
assign testY11 = 9'd360 ;
assign testY12 = 9'd390 ;
assign testY13 = 9'd420 ;
assign testY14 = 9'd450 ;
assign testY15 = 9'd475 ;


logic [8:0]ImY,ImY1,ImY2,ImY3,ImY4,ImY5,ImY6,ImY7,ImY8,ImY9,ImY10,ImY11,ImY12,ImY13,ImY14,ImY15;

always_ff@(posedge Clk) 
    begin
        // initially load all platforms 
        if(loadplat)
            begin
                trigger <= 0; 
                platY  <= testY;
			    platY1 <= testY1;
			    platY2 <= testY2;
			    platY3 <= testY3;
			    platY4 <= testY4;
			    platY5 <= testY5;
			    platY6 <= testY6;
			    platY7 <= testY7;
			    platY8 <= testY8;
			    platY9 <= testY9;
			    platY10 <= testY10;
			    platY11 <= testY11;
			    platY12 <= testY12;
			    platY13 <= testY13;
			    platY14 <= testY14;
			    platY15 <= testY15;

                ImY  <= testY;
			    ImY1 <= testY1;
			    ImY2 <= testY2;
			    ImY3 <= testY3;
			    ImY4 <= testY4;
			    ImY5 <= testY5;
			    ImY6 <= testY6;
			    ImY7 <= testY7;
			    ImY8 <= testY8;
			    ImY9 <= testY9;
			    ImY10 <= testY10;
			    ImY11 <= testY11;
			    ImY12 <= testY12;
			    ImY13 <= testY13;
			    ImY14 <= testY14;
			    ImY15 <= testY15;
                
            end
        // if we have the need to refresh the platforms 
        else if(refresh_en)
            begin 
                ImY <= platY + 1;
                ImY1 <= platY1 + 1;
                ImY2 <= platY2 + 1;
                ImY3 <= platY3 + 1;
                ImY4 <= platY4 + 1;
                ImY5 <= platY5 + 1;
                ImY6 <= platY6 + 1;
                ImY7 <= platY7 + 1;
                ImY8 <= platY8 + 1;
                ImY9 <= platY9 + 1;
                ImY10 <= platY10 + 1;
                ImY11 <= platY11 + 1;
                ImY12 <= platY12 + 1;
                ImY13 <= platY13 + 1;
                ImY14 <= platY14 + 1;
                ImY15 <= platY15 + 1;
                platY  = ImY;
                platY1 = ImY1;
                platY2 = ImY2;
                platY3 = ImY3;
                platY4 = ImY4;
                platY5 = ImY5;
                platY6 = ImY6;
                platY7 = ImY7;
                platY8 = ImY8;
                platY9 = ImY9;
                platY10 = ImY10;
                platY11 = ImY11;
                platY12 = ImY12;
                platY13 = ImY13;
                platY14 = ImY14;
                platY15 = ImY15;
                trigger <= 1;
            end 
            
        // if we dont need to refresh platforms 
        else if(!refresh_en)
            begin
                trigger <= 0; 
                platY <= ImY;
			    platY1 <= ImY1;
			    platY2 <= ImY2;
			    platY3 <= ImY3;
			    platY4 <= ImY4;
			    platY5 <= ImY5;
			    platY6 <= ImY6;
			    platY7 <= ImY7;
			    platY8 <= ImY8;
			    platY9 <= ImY9;
			    platY10 <= ImY10;
			    platY11 <= ImY11;
			    platY12 <= ImY12;
			    platY13 <= ImY13;
			    platY14 <= ImY14;
			    platY15 <= ImY15;
            end
    end
         
//~~~~~~~~~~PLATFORMS~~~~~~~~~~~~~~~~~~~~~~~ this should cause for the platforms to be drawn on the screen 
    logic platform_on; 
    assign plat_sizeX = 9'd10;
    assign plat_sizeY = 9'd4;
    always_comb
    begin:Platform_on_proc
            if ((DrawX >= platX - plat_sizeX) &&
                (DrawX <= platX + plat_sizeX) &&
                (DrawY >= platY - plat_sizeY) &&
                (DrawY <= platY + plat_sizeY)) 
                platform_on = 1'b1; // platform_on[0] = 1'b1 
            else 
                platform_on = 1'b0;
        end 
    
    
    
    logic platform_on1; 
    always_comb
    begin:Platform_on_proc1
         if ((DrawX >= platX1 - plat_sizeX) &&
            (DrawX <= platX1 + plat_sizeX) &&
            (DrawY >= platY1 - plat_sizeY) &&
            (DrawY <= platY1 + plat_sizeY)) 
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
            (DrawY <= platY2 + plat_sizeY)) 
            platform_on2 = 1'b1;
        else 
            platform_on2 = 1'b0;
     end 

    logic platform_on3; 
    // assign testY3 = 9'd0120 ;
       
    always_comb
    begin:Platform_on_proc3
         if ((DrawX >= platX3 - plat_sizeX) &&
            (DrawX <= platX3 + plat_sizeX) &&
            (DrawY >= platY3 - plat_sizeY) &&
            (DrawY <= platY3 + plat_sizeY)) 
            platform_on3 = 1'b1;
        else 
            platform_on3 = 1'b0;
     end 

    logic platform_on4; 
    // assign testY4 = 9'd150 ;
       
    always_comb
    begin:Platform_on_proc4
         if ((DrawX >= platX4 - plat_sizeX) &&
            (DrawX <= platX4 + plat_sizeX) &&
            (DrawY >= platY4 - plat_sizeY) &&
            (DrawY <= platY4 + plat_sizeY)) 
            platform_on4 = 1'b1;
        else 
            platform_on4 = 1'b0;
     end 

   logic platform_on5; 
    // assign testY5 = 9'd180 ;
       
    always_comb
    begin:Platform_on_proc5
         if ((DrawX >= platX5 - plat_sizeX) &&
            (DrawX <= platX5 + plat_sizeX) &&
            (DrawY >= platY5 - plat_sizeY) &&
            (DrawY <= platY5 + plat_sizeY)) 
            platform_on5 = 1'b1;
        else 
            platform_on5 = 1'b0;
     end 

    logic platform_on6; 
    // assign testY6 = 9'd210 ;
       
    always_comb
    begin:Platform_on_proc6
         if ((DrawX >= platX6 - plat_sizeX) &&
            (DrawX <= platX6 + plat_sizeX) &&
            (DrawY >= platY6 - plat_sizeY) &&
            (DrawY <= platY6 + plat_sizeY)) 
            platform_on6 = 1'b1;
        else 
            platform_on6 = 1'b0;
     end 

    logic platform_on7;  
    // assign testY7 = 9'd240 ;
       
    always_comb
    begin:Platform_on_proc7
         if ((DrawX >= platX7 - plat_sizeX) &&
            (DrawX <= platX7 + plat_sizeX) &&
            (DrawY >= platY7 - plat_sizeY) &&
            (DrawY <= platY7 + plat_sizeY)) 
            platform_on7 = 1'b1;
        else 
            platform_on7 = 1'b0;
     end 

    logic platform_on8; 
    // assign testY8 = 9'd270 ;
       
    always_comb
    begin:Platform_on_proc8
         if ((DrawX >= platX8 - plat_sizeX) &&
            (DrawX <= platX8 + plat_sizeX) &&
            (DrawY >= platY8 - plat_sizeY) &&
            (DrawY <= platY8 + plat_sizeY)) 
            platform_on8 = 1'b1;
        else 
            platform_on8 = 1'b0;
     end

    logic platform_on9; 
    // assign testY9 = 9'd300 ;
    
    always_comb
    begin:Platform_on_proc9
         if ((DrawX >= platX9 - plat_sizeX) &&
            (DrawX <= platX9 + plat_sizeX) &&
            (DrawY >= platY9 - plat_sizeY) &&
            (DrawY <= platY9 + plat_sizeY)) 
            platform_on9 = 1'b1;
        else 
            platform_on9 = 1'b0;
     end

    logic platform_on10; 
    // assign testY10 = 9'd330 ;
    
    always_comb
    begin:Platform_on_proc10
         if ((DrawX >= platX10 - plat_sizeX) &&
            (DrawX <= platX10 + plat_sizeX) &&
            (DrawY >= platY10 - plat_sizeY) &&
            (DrawY <= platY10 + plat_sizeY)) 
            platform_on10 = 1'b1;
        else 
            platform_on10 = 1'b0;
     end

    logic platform_on11; 
    // assign testY11 = 9'd360 ;
    
    always_comb
    begin:Platform_on_proc11
         if ((DrawX >= platX11 - plat_sizeX) &&
            (DrawX <= platX11 + plat_sizeX) &&
            (DrawY >= platY11 - plat_sizeY) &&
            (DrawY <= platY11 + plat_sizeY)) 
            platform_on11 = 1'b1;
        else 
            platform_on11 = 1'b0;
     end

    logic platform_on12; 
    // assign testY12 = 9'd390 ;
    
    always_comb
    begin:Platform_on_proc12
         if ((DrawX >= platX12 - plat_sizeX) &&
            (DrawX <= platX12 + plat_sizeX) &&
            (DrawY >= platY12 - plat_sizeY) &&
            (DrawY <= platY12 + plat_sizeY)) 
            platform_on12 = 1'b1;
        else 
            platform_on12 = 1'b0;
     end


    logic platform_on13;  
    // assign testY13 = 9'd420 ;
    
    always_comb
    begin:Platform_on_proc13
         if ((DrawX >= platX13 - plat_sizeX) &&
            (DrawX <= platX13 + plat_sizeX) &&
            (DrawY >= platY13 - plat_sizeY) &&
            (DrawY <= platY13 + plat_sizeY)) 
            platform_on13 = 1'b1;
        else 
            platform_on13 = 1'b0;
     end

    logic platform_on14; 
    // assign testY14 = 9'd450 ;
    
    always_comb
    begin:Platform_on_proc14
         if ((DrawX >= platX14 - plat_sizeX) &&
            (DrawX <= platX14 + plat_sizeX) &&
            (DrawY >= platY14 - plat_sizeY) &&
            (DrawY <= platY14 + plat_sizeY)) 
            platform_on14 = 1'b1;
        else 
            platform_on14 = 1'b0;
     end

    logic platform_on15; 
    // assign testY15 = 9'd475 ;
    
    always_comb
    begin:Platform_on_proc15
         if ((DrawX >= platX15 - plat_sizeX) &&
            (DrawX <= platX15 + plat_sizeX) &&
            (DrawY >= platY15 - plat_sizeY) &&
            (DrawY <= platY15 + plat_sizeY)) 
            platform_on15 = 1'b1;
        else 
            platform_on15 = 1'b0;
     end

// ~~~~~~Platforms~~~~~~~~~~~~~       
    always_comb
    begin:RGB_Display
    //turn on pixels for the Doodle 
        if ((Doodle_on == 1'b1)) 
        begin 
            Red = 8'hCA;
            Green = 8'hC9;
            Blue = 8'h2E;
        end      
    //turn on pixels for the platforms 
        else if(
        (platform_on == 1'b1) || 
        (platform_on1 == 1'b1) ||
        (platform_on2 == 1'b1) || 
        (platform_on3 == 1'b1) ||
        (platform_on4 == 1'b1) || 
        (platform_on5 == 1'b1) ||
        (platform_on6 == 1'b1) || 
        (platform_on7 == 1'b1) ||       
        (platform_on8 == 1'b1) || 
        (platform_on9 == 1'b1) ||
        (platform_on10 == 1'b1) || 
        (platform_on11 == 1'b1) ||
        (platform_on12 == 1'b1) ||
        (platform_on13 == 1'b1) ||
        (platform_on14 == 1'b1) || 
        (platform_on15 == 1'b1)
        ) 
        begin 
            Red = 8'h66;
            Green = 8'hDD;
            Blue = 8'h11;
        end 
    // turn on pixels for the cannon 
        else if((cannon_on == 1'b1))
        begin 
            Red = 8'hFF; 
            Green = 8'h00; 
            Blue = 8'h00; 
        end 
    // turn on pixels for the background
        else 
        begin 
            Red = 8'h98; 
            Green = 8'h85;
            Blue = 8'h58;
        end      
    end 
    
endmodule
