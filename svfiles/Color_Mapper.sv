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


module  color_mapper ( input Clk, Reset, frame_clk,
                       input loadplat, 
							  input        [9:0] BallX, BallY, DrawX, DrawY, Ball_size,
                       input        [6:0] keycode, 
                       input        [2:0] outstate,
                       input        [9:0] CannonX, CannonY, CannonS,  
                       output logic [7:0]  Red, Green, Blue );
    
    logic ball_on;


    int DistX, DistY, Size;
	assign DistX = DrawX - BallX;
    assign DistY = DrawY - BallY;
    assign Size = Ball_size;
	  
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
    begin:Ball_on_proc
         if ((DrawX >= BallX - Ball_size) &&
            (DrawX <= BallX + Ball_size) &&
            (DrawY >= BallY - Ball_size) &&
            (DrawY <= BallY + Ball_size)) 
            ball_on = 1'b1;
        else 
            ball_on = 1'b0;
    end 

LFSR LFSR(
    .Clk(Clk), .Reset(Reset), .outp(testX[8:0])
);
LFSR LFSR1(
    .Clk(Clk), .Reset(Reset), .outp(testX1[8:0])
);
LFSR LFSR2(
    .Clk(Clk), .Reset(Reset), .outp(testX2[8:0])
);
LFSR LFSR3(
    .Clk(Clk), .Reset(Reset), .outp(testX3[8:0])
);
LFSR LFSR4(
    .Clk(Clk), .Reset(Reset), .outp(testX4[8:0])
);
LFSR LFSR5(
    .Clk(Clk), .Reset(Reset), .outp(testX5[8:0])
);
LFSR LFSR6(
    .Clk(Clk), .Reset(Reset), .outp(testX6[8:0])
);
LFSR LFSR7(
    .Clk(Clk), .Reset(Reset), .outp(testX7[8:0])
);
LFSR LFSR8(
    .Clk(Clk), .Reset(Reset), .outp(testX8[8:0])
);
LFSR LFSR9(
    .Clk(Clk), .Reset(Reset), .outp(testX9[8:0])
);
LFSR LFSR10(
    .Clk(Clk), .Reset(Reset), .outp(testX10[8:0])
);
LFSR LFSR11(
    .Clk(Clk), .Reset(Reset), .outp(testX11[8:0])
);
LFSR LFSR12(
    .Clk(Clk), .Reset(Reset), .outp(testX12[8:0])
);
LFSR LFSR13(
    .Clk(Clk), .Reset(Reset), .outp(testX13[8:0])
);
LFSR LFSR14(
    .Clk(Clk), .Reset(Reset), .outp(testX14[8:0])
);
LFSR LFSR15(
    .Clk(Clk), .Reset(Reset), .outp(testX15[8:0])
);
 logic [8:0]testX,testX1, testX2, testX3, testX4, testX5, testX6, testX7,  testX8, testX9, testX10, testX11, testX12, testX13, testX14, testX15;
always_ff@(posedge loadplat)
    begin 
        platX <= testX; 
        platX1 <= testX1; 
        platX2 <= testX2; 
        platX3 <= testX3;  
        platX4 <= testX4; 
        platX5 <= testX5; 
        platX6 <= testX6; 
        platX7 <= testX7;
        platX8 <= testX8; 
        platX9 <= testX9; 
        platX10 <= testX10; 
        platX11 <= testX11;      
        platX12 <= testX12; 
        platX13 <= testX13;
        platX14 <= testX14; 
        platX15 <= testX15; 
         
    end 

//~~~~~~~~~~PLATFORMS~~~~~~~~~~~~~~~~~~~~~~~
    logic platform_on; 
    logic [8:0] platX, platY, plat_size; 
    assign platY = 9'd012;
    assign plat_size = 9'd4;
    always_comb
    begin:Platform_on_proc
         if ((DrawX >= platX - plat_size) &&
            (DrawX <= platX + plat_size) &&
            (DrawY >= platY - plat_size) &&
            (DrawY <= platY + plat_size)) 
            platform_on = 1'b1;
        else 
            platform_on = 1'b0;
     end 
    
    logic platform_on1; 
    logic [9:0] platX1, platY1;
    assign platY1 = 10'd025;
    always_comb
    begin:Platform_on_proc1
         if ((DrawX >= platX1 - plat_size) &&
            (DrawX <= platX1 + plat_size) &&
            (DrawY >= platY1 - plat_size) &&
            (DrawY <= platY1 + plat_size)) 
            platform_on1 = 1'b1;
        else 
            platform_on1 = 1'b0;
     end 

    logic platform_on2; 
    logic [9:0] platX2, platY2; 
    assign platY2 = 10'd075;
    always_comb
    begin:Platform_on_proc2
         if ((DrawX >= platX2 - plat_size) &&
            (DrawX <= platX2 + plat_size) &&
            (DrawY >= platY2 - plat_size) &&
            (DrawY <= platY2 + plat_size)) 
            platform_on2 = 1'b1;
        else 
            platform_on2 = 1'b0;
     end 

    logic platform_on3; 
    logic [9:0] platX3, platY3; 
    assign platY3 = 10'd075;
    always_comb
    begin:Platform_on_proc3
         if ((DrawX >= platX3 - plat_size) &&
            (DrawX <= platX3 + plat_size) &&
            (DrawY >= platY3 - plat_size) &&
            (DrawY <= platY3 + plat_size)) 
            platform_on3 = 1'b1;
        else 
            platform_on3 = 1'b0;
     end 

    logic platform_on4; 
    logic [9:0] platX4, platY4;  
    assign platY4 = 10'd100;
    always_comb
    begin:Platform_on_proc4
         if ((DrawX >= platX4 - plat_size) &&
            (DrawX <= platX4 + plat_size) &&
            (DrawY >= platY4 - plat_size) &&
            (DrawY <= platY4 + plat_size)) 
            platform_on4 = 1'b1;
        else 
            platform_on4 = 1'b0;
     end 

   logic platform_on5; 
    logic [9:0] platX5, platY5; 
    assign platY5 = 10'd125;
    always_comb
    begin:Platform_on_proc5
         if ((DrawX >= platX5 - plat_size) &&
            (DrawX <= platX5 + plat_size) &&
            (DrawY >= platY5 - plat_size) &&
            (DrawY <= platY5 + plat_size)) 
            platform_on5 = 1'b1;
        else 
            platform_on5 = 1'b0;
     end 

    logic platform_on6; 
    logic [9:0] platX6, platY6;  
    assign platY6 = 10'd150;
    always_comb
    begin:Platform_on_proc6
         if ((DrawX >= platX6 - plat_size) &&
            (DrawX <= platX6 + plat_size) &&
            (DrawY >= platY6 - plat_size) &&
            (DrawY <= platY6 + plat_size)) 
            platform_on6 = 1'b1;
        else 
            platform_on6 = 1'b0;
     end 

    logic platform_on7; 
    logic [9:0] platX7, platY7; 
    assign platY7 = 10'd175;
    always_comb
    begin:Platform_on_proc7
         if ((DrawX >= platX7 - plat_size) &&
            (DrawX <= platX7 + plat_size) &&
            (DrawY >= platY7 - plat_size) &&
            (DrawY <= platY7 + plat_size)) 
            platform_on7 = 1'b1;
        else 
            platform_on7 = 1'b0;
     end 

    logic platform_on8; 
    logic [9:0] platX8, platY8; 
    assign platY8 = 10'd200;
    always_comb
    begin:Platform_on_proc8
         if ((DrawX >= platX8 - plat_size) &&
            (DrawX <= platX8 + plat_size) &&
            (DrawY >= platY8 - plat_size) &&
            (DrawY <= platY8 + plat_size)) 
            platform_on8 = 1'b1;
        else 
            platform_on8 = 1'b0;
     end

    logic platform_on9; 
    logic [9:0] platX9, platY9; 
    assign platY9 = 10'd225;
    always_comb
    begin:Platform_on_proc9
         if ((DrawX >= platX9 - plat_size) &&
            (DrawX <= platX9 + plat_size) &&
            (DrawY >= platY9 - plat_size) &&
            (DrawY <= platY9 + plat_size)) 
            platform_on9 = 1'b1;
        else 
            platform_on9 = 1'b0;
     end

    logic platform_on10; 
    logic [9:0] platX10, platY10; 
    assign platY10 = 10'd250;
    always_comb
    begin:Platform_on_proc10
         if ((DrawX >= platX10 - plat_size) &&
            (DrawX <= platX10 + plat_size) &&
            (DrawY >= platY10 - plat_size) &&
            (DrawY <= platY10 + plat_size)) 
            platform_on10 = 1'b1;
        else 
            platform_on10 = 1'b0;
     end

    logic platform_on11; 
    logic [9:0] platX11, platY11;  
    assign platY11 = 10'd275;
    always_comb
    begin:Platform_on_proc11
         if ((DrawX >= platX11 - plat_size) &&
            (DrawX <= platX11 + plat_size) &&
            (DrawY >= platY11 - plat_size) &&
            (DrawY <= platY11 + plat_size)) 
            platform_on11 = 1'b1;
        else 
            platform_on11 = 1'b0;
     end

    logic platform_on12; 
    logic [9:0] platX12, platY12; 
    assign platY12 = 10'd300;
    always_comb
    begin:Platform_on_proc12
         if ((DrawX >= platX12 - plat_size) &&
            (DrawX <= platX12 + plat_size) &&
            (DrawY >= platY12 - plat_size) &&
            (DrawY <= platY12 + plat_size)) 
            platform_on12 = 1'b1;
        else 
            platform_on12 = 1'b0;
     end


    logic platform_on13; 
    logic [9:0] platX13, platY13; 
    assign platY13 = 10'd325;
    always_comb
    begin:Platform_on_proc13
         if ((DrawX >= platX13 - plat_size) &&
            (DrawX <= platX13 + plat_size) &&
            (DrawY >= platY13 - plat_size) &&
            (DrawY <= platY13 + plat_size)) 
            platform_on13 = 1'b1;
        else 
            platform_on13 = 1'b0;
     end

    logic platform_on14; 
    logic [9:0] platX14, platY14; 
    assign platY14 = 10'd350;
    always_comb
    begin:Platform_on_proc14
         if ((DrawX >= platX14 - plat_size) &&
            (DrawX <= platX14 + plat_size) &&
            (DrawY >= platY14 - plat_size) &&
            (DrawY <= platY14 + plat_size)) 
            platform_on14 = 1'b1;
        else 
            platform_on14 = 1'b0;
     end

    logic platform_on15; 
    logic [9:0] platX15, platY15; 
    assign platY15 = 10'd475;
    always_comb
    begin:Platform_on_proc15
         if ((DrawX >= platX15 - plat_size) &&
            (DrawX <= platX15 + plat_size) &&
            (DrawY >= platY15 - plat_size) &&
            (DrawY <= platY15 + plat_size)) 
            platform_on15 = 1'b1;
        else 
            platform_on15 = 1'b0;
     end
// ~~~~~~Platforms~~~~~~~~~~~~~       
    always_comb
    begin:RGB_Display
    //turn on pixels for the ball 
        if ((ball_on == 1'b1)) 
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
            Red = 8'h69; 
            Green = 8'h69;
            Blue = 8'h69;
        end      
    end 
    
endmodule
