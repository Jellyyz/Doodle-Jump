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


module  color_mapper ( input        [9:0] BallX, BallY, DrawX, DrawY, Ball_size,
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
    
//~~~~~~~~~~PLATFORMS~~~~~~~~~~~~~~~~~~~~~~~
    logic platform_on; 
    logic [9:0] platX, platY, plat_size; 
    assign platX = 10'd012; 
    assign platY = 10'd012;
    assign plat_size = 10'd4;
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
    logic [9:0] platX1, platY1, plat_size1; 
    assign platX1 = 10'd025; 
    assign platY1 = 10'd025;
    assign plat_size1 = 10'd4;
    always_comb
    begin:Platform_on_proc1
         if ((DrawX >= platX1 - plat_size1) &&
            (DrawX <= platX1 + plat_size1) &&
            (DrawY >= platY1 - plat_size1) &&
            (DrawY <= platY1 + plat_size1)) 
            platform_on1 = 1'b1;
        else 
            platform_on1 = 1'b0;
     end 

    logic platform_on2; 
    logic [9:0] platX2, platY2, plat_size2; 
    assign platX2 = 10'd050; 
    assign platY2 = 10'd050;
    assign plat_size2 = 10'd4;
    always_comb
    begin:Platform_on_proc2
         if ((DrawX >= platX2 - plat_size2) &&
            (DrawX <= platX2 + plat_size2) &&
            (DrawY >= platY2 - plat_size2) &&
            (DrawY <= platY2 + plat_size2)) 
            platform_on2 = 1'b1;
        else 
            platform_on2 = 1'b0;
     end 

    logic platform_on3; 
    logic [9:0] platX3, platY3, plat_size3; 
    assign platX3 = 10'd075; 
    assign platY3 = 10'd075;
    assign plat_size3 = 10'd4;
    always_comb
    begin:Platform_on_proc3
         if ((DrawX >= platX3 - plat_size3) &&
            (DrawX <= platX3 + plat_size3) &&
            (DrawY >= platY3 - plat_size3) &&
            (DrawY <= platY3 + plat_size3)) 
            platform_on3 = 1'b1;
        else 
            platform_on3 = 1'b0;
     end 

    logic platform_on4; 
    logic [9:0] platX4, platY4, plat_size4; 
    assign platX4 = 10'd100; 
    assign platY4 = 10'd100;
    assign plat_size4 = 10'd4;
    always_comb
    begin:Platform_on_proc4
         if ((DrawX >= platX4 - plat_size4) &&
            (DrawX <= platX4 + plat_size4) &&
            (DrawY >= platY4 - plat_size4) &&
            (DrawY <= platY4 + plat_size4)) 
            platform_on4 = 1'b1;
        else 
            platform_on4 = 1'b0;
     end 

   logic platform_on5; 
    logic [9:0] platX5, platY5, plat_size5; 
    assign platX5 = 10'd125; 
    assign platY5 = 10'd125;
    assign plat_size5 = 10'd4;
    always_comb
    begin:Platform_on_proc5
         if ((DrawX >= platX5 - plat_size5) &&
            (DrawX <= platX5 + plat_size5) &&
            (DrawY >= platY5 - plat_size5) &&
            (DrawY <= platY5 + plat_size5)) 
            platform_on5 = 1'b1;
        else 
            platform_on5 = 1'b0;
     end 

    logic platform_on6; 
    logic [9:0] platX6, platY6, plat_size6; 
    assign platX6 = 10'd150; 
    assign platY6 = 10'd150;
    assign plat_size6 = 10'd4;
    always_comb
    begin:Platform_on_proc6
         if ((DrawX >= platX6 - plat_size6) &&
            (DrawX <= platX6 + plat_size6) &&
            (DrawY >= platY6 - plat_size6) &&
            (DrawY <= platY6 + plat_size6)) 
            platform_on6 = 1'b1;
        else 
            platform_on6 = 1'b0;
     end 

    logic platform_on7; 
    logic [9:0] platX7, platY7, plat_size7; 
    assign platX7 = 10'd175; 
    assign platY7 = 10'd175;
    assign plat_size7 = 10'd4;
    always_comb
    begin:Platform_on_proc7
         if ((DrawX >= platX7 - plat_size7) &&
            (DrawX <= platX7 + plat_size7) &&
            (DrawY >= platY7 - plat_size7) &&
            (DrawY <= platY7 + plat_size7)) 
            platform_on7 = 1'b1;
        else 
            platform_on7 = 1'b0;
     end 

    logic platform_on8; 
    logic [9:0] platX8, platY8, plat_size8; 
    assign platX8 = 10'd200; 
    assign platY8 = 10'd200;
    assign plat_size8 = 10'd4;
    always_comb
    begin:Platform_on_proc8
         if ((DrawX >= platX8 - plat_size8) &&
            (DrawX <= platX8 + plat_size8) &&
            (DrawY >= platY8 - plat_size8) &&
            (DrawY <= platY8 + plat_size8)) 
            platform_on8 = 1'b1;
        else 
            platform_on8 = 1'b0;
     end

    logic platform_on9; 
    logic [9:0] platX9, platY9, plat_size9; 
    assign platX9 = 10'd225; 
    assign platY9 = 10'd225;
    assign plat_size9 = 10'd4;
    always_comb
    begin:Platform_on_proc9
         if ((DrawX >= platX9 - plat_size9) &&
            (DrawX <= platX9 + plat_size9) &&
            (DrawY >= platY9 - plat_size9) &&
            (DrawY <= platY9 + plat_size9)) 
            platform_on9 = 1'b1;
        else 
            platform_on9 = 1'b0;
     end

    logic platform_on10; 
    logic [9:0] platX10, platY10, plat_size10; 
    assign platX10 = 10'd250; 
    assign platY10 = 10'd250;
    assign plat_size10 = 10'd4;
    always_comb
    begin:Platform_on_proc10
         if ((DrawX >= platX10 - plat_size10) &&
            (DrawX <= platX10 + plat_size10) &&
            (DrawY >= platY10 - plat_size10) &&
            (DrawY <= platY10 + plat_size10)) 
            platform_on10 = 1'b1;
        else 
            platform_on10 = 1'b0;
     end

    logic platform_on11; 
    logic [9:0] platX11, platY11, plat_size11; 
    assign platX11 = 10'd275; 
    assign platY11 = 10'd275;
    assign plat_size11 = 10'd4;
    always_comb
    begin:Platform_on_proc11
         if ((DrawX >= platX11 - plat_size11) &&
            (DrawX <= platX11 + plat_size11) &&
            (DrawY >= platY11 - plat_size11) &&
            (DrawY <= platY11 + plat_size11)) 
            platform_on11 = 1'b1;
        else 
            platform_on11 = 1'b0;
     end

    logic platform_on12; 
    logic [9:0] platX12, platY12, plat_size12; 
    assign platX12 = 10'd325; 
    assign platY12 = 10'd325;
    assign plat_size12 = 10'd4;
    always_comb
    begin:Platform_on_proc12
         if ((DrawX >= platX12 - plat_size12) &&
            (DrawX <= platX12 + plat_size12) &&
            (DrawY >= platY12 - plat_size12) &&
            (DrawY <= platY12 + plat_size12)) 
            platform_on12 = 1'b1;
        else 
            platform_on12 = 1'b0;
     end


    logic platform_on13; 
    logic [9:0] platX13, platY13, plat_size13; 
    assign platX13 = 10'd350; 
    assign platY13 = 10'd350;
    assign plat_size13 = 10'd4;
    always_comb
    begin:Platform_on_proc13
         if ((DrawX >= platX13 - plat_size13) &&
            (DrawX <= platX13 + plat_size13) &&
            (DrawY >= platY13 - plat_size13) &&
            (DrawY <= platY13 + plat_size13)) 
            platform_on13 = 1'b1;
        else 
            platform_on13 = 1'b0;
     end

    logic platform_on14; 
    logic [9:0] platX14, platY14, plat_size14; 
    assign platX14 = 10'd375; 
    assign platY14 = 10'd375;
    assign plat_size14 = 10'd4;
    always_comb
    begin:Platform_on_proc14
         if ((DrawX >= platX14 - plat_size14) &&
            (DrawX <= platX14 + plat_size14) &&
            (DrawY >= platY14 - plat_size14) &&
            (DrawY <= platY14 + plat_size14)) 
            platform_on14 = 1'b1;
        else 
            platform_on14 = 1'b0;
     end

    logic platform_on15; 
    logic [9:0] platX15, platY15, plat_size15; 
    assign platX15 = 10'd400; 
    assign platY15 = 10'd400;
    assign plat_size15 = 10'd4;
    always_comb
    begin:Platform_on_proc15
         if ((DrawX >= platX15 - plat_size15) &&
            (DrawX <= platX15 + plat_size15) &&
            (DrawY >= platY15 - plat_size15) &&
            (DrawY <= platY15 + plat_size15)) 
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
            Green = 8'hC5;
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
            Green = 8'hBB;
            Blue = 8'h11;
        end 
    // turn on pixels for the cannon 
        else if((cannon_on == 1'b1))
        begin 
            Red = 8'hFF; 
            Green = 8'h00; 
            Blue = 8'h00; 
        end 
    // turn on pixels for the background..? needs blank signal fix still 
        else 
        begin 
            Red = 8'h00; 
            Green = 8'h00;
            Blue = 8'h00;
        end      
    end 
    
endmodule
