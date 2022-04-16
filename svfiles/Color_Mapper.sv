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
                       input        [2:0] outstate, 
                       output logic [7:0]  Red, Green, Blue );
    
    logic ball_on;


    int DistX, DistY, Size;
	assign DistX = DrawX - BallX;
    assign DistY = DrawY - BallY;
    assign Size = Ball_size;
	  
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
    

    logic platform_on; 
    logic [9:0] platX, platY, plat_size; 
    assign platX = 10'd30000; 
    assign platY = 10'd300;
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
       
    always_comb
    begin:RGB_Display
        if ((ball_on == 1'b1)) 
        begin 
            Red = 8'h00;
            Green = 8'hFF;
            Blue = 8'h00;
        end      
        else if((platform_on == 1'b1)) 
        begin 
            Red = 8'h00;
            Green = 8'h00;
            Blue = 8'hFF;
        end  
        else 
        begin 
            Red = 8'h00; 
            Green = 8'h00;
            Blue = 8'h00;
        end      
    end 
    
endmodule
