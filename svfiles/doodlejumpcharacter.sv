// Modified for final project, Ranpo & Gally 


module  jumplogic( input Reset, frame_clk, Clk,
					input [7:0] keycode,
               output [9:0]  BallX, BallY, BallS );
    
    logic [9:0] Ball_X_Pos, Ball_X_Motion, Ball_Y_Pos, Ball_Y_Motion, Ball_Size;
	 
    parameter [9:0] Ball_X_Center=320;  // Center position on the X axis
    parameter [9:0] Ball_Y_Center=240;  // Center position on the Y axis
    
	parameter [9:0] Ball_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis

    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=479;     // Bottommost point on the Y axis
    

	parameter [1:0] Gravity = 3; 
    assign Ball_Size = 4;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
   
counter counter(
	.Reset(jump_reset), 
	.enable(jump_enable), 
    .Clk(frame_clk), 

    .out(counting[6:0])
);

counter counter3(
	.Reset(jump_reset), 
	.enable(counting[6]), 
    .Clk(frame_clk), 

    .out(counting2[1:0])
);

jumpstate jumpstate(
	.Clock(Clk), 
	.Reset(Reset), 
	.Keycode(keycode[7:0]),

	.outstate(outstate[2:0])
);
logic [2:0] outstate; 
logic [7:0] counting; 
logic [1:0] counting2;
logic jump_enable, jump_reset; 
    always_ff @ (posedge Reset or posedge frame_clk )
    begin
        if (Reset)  // Asynchronous Reset
        begin 
            Ball_Y_Motion <= 10'd0; //Ball_Y_Step;
			Ball_X_Motion <= 10'd0; //Ball_X_Step;
			Ball_Y_Pos <= Ball_Y_Center;
			Ball_X_Pos <= Ball_X_Center;
        end
           
        else 
        begin 
			// unique case(outstate)
			// 3'b000: ;
			// 		// display some main menu i guess ; 
			// 3'b001: 
			//begin
				// on the ground and in motion must stop the ball 
				if(Ball_Y_Pos + Ball_Size >= Ball_Y_Max)
					Ball_Y_Motion = 10'h0; 
				// above the ground and in motion start accelerating it in the positive time 
				else if(Ball_Y_Motion > 10'h0 && Ball_Y_Pos + Ball_Size < Ball_Y_Max)
					begin
						jump_reset <= 1'b0; 
						jump_enable <= 1'b1; 
						Ball_Y_Motion += counting2[1:0]; 
					end 
				// if not moving then get it to start falling or start jumping 
				if(Ball_Y_Motion == 10'h0)
				begin 
					// if the ball is currently on the ground
					if(Ball_Y_Pos + Ball_Size >= Ball_Y_Max)
						begin
							jump_reset <= 1'b0; 
							jump_enable <= 1'b1; 
							Ball_Y_Motion = (1'b1 + ~Gravity); 
						end 

					// if the ball is currently above the ground 
					else if(Ball_Y_Pos + Ball_Size <= Ball_Y_Max)
						begin 
							jump_reset <= 1'b1; 
							jump_enable <= 1'b0; 
							Ball_Y_Motion = Gravity; 
						end 

				end 

				unique case(keycode)
					8'd7, 8'd79:
						Ball_X_Motion = 1; 
					8'd4, 8'd80:
						Ball_X_Motion = -1;	
					default:
						Ball_X_Motion = 0;
				endcase 
			//end

			// 3'b010: 
			// begin
			// 	Ball_Y_Motion <= 0; 
			// 	Ball_X_Motion <= 0; 
			// end


			// endcase 


				Ball_Y_Pos <= (Ball_Y_Pos + Ball_Y_Motion);  // Update ball position
				Ball_X_Pos <= (Ball_X_Pos + Ball_X_Motion);

		end  
    end
       
    assign BallX = Ball_X_Pos;
   
    assign BallY = Ball_Y_Pos;
   
    assign BallS = Ball_Size;
    

endmodule
