// Modified for final project, Ranpo & Gally 


module  jumplogic( input Reset, frame_clk, Clk,
					input [7:0] keycode,
               output [9:0]  BallX, BallY, BallS, 
			   output [9:0]  CannonX, CannonY, CannonS, 
			   output [2:0] outstate);
    
    logic [9:0] Ball_X_Pos, Ball_X_Motion, Ball_Y_Pos, Ball_Y_Motion, Ball_Size;
	 
    parameter [9:0] Ball_X_Center=320;  // Center position on the X axis
    parameter [9:0] Ball_Y_Center=240;  // Center position on the Y axis
    
	parameter [9:0] Ball_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis

    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=479;     // Bottommost point on the Y axis
    

	parameter [1:0] Gravity = 3; 
	parameter [2:0] CannonSpeed = 7;
    assign Ball_Size = 12;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
	assign Cannon_Size = 2; 
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
logic [2:0] Status, state; 
logic [7:0] counting; 
logic [1:0] counting2;
logic jump_enable, jump_reset; 
logic [9:0] Ball_Top; 
 
logic [9:0] Cannon_Y_Motion, Cannon_X_Motion, Cannon_Y_Pos, Cannon_X_Pos, Cannon_Size; 


always_ff @ (posedge Reset or posedge frame_clk)
    begin
        if (Reset)  // Asynchronous Reset
        begin 
            	Ball_Y_Motion = 10'h0; //Ball_Y_Step;
				Ball_X_Motion = 10'h0; //Ball_X_Step;
				Ball_Y_Pos <= Ball_Y_Center;
				Ball_X_Pos <= Ball_X_Center;
				Cannon_Y_Pos <= 10'h0; 
				Cannon_X_Pos <= 10'h0; 
				
        end
           
        else 
        begin 
			unique case(outstate)
			3'b000:
			begin 
					;
			end 

			3'b001: 
			begin
				// wrap around screen 
				if((Ball_X_Pos + Ball_Size) >= Ball_X_Max )  
					Ball_X_Pos <= Ball_X_Min; 
				else if ( (Ball_X_Pos - Ball_Size) <= Ball_X_Min ) 
					Ball_X_Pos <= Ball_X_Max; 
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
					8'd44:
					begin 
						Cannon_X_Pos <= Ball_X_Pos; 
						Cannon_Y_Pos <= Ball_Y_Pos; 
						Cannon_Y_Motion = (1'b1 + ~CannonSpeed); 
					end 
					8'd7, 8'd79:
						Ball_X_Motion = 2; 
					8'd4, 8'd80:
						Ball_X_Motion = -2;	 
					default:
					begin 
						Ball_X_Motion = 0;
						Cannon_X_Motion = 0; 
					end 
				endcase 
			end

			3'b010: 
			begin
				Ball_Y_Motion = 0; 
				Ball_X_Motion = 0; 
			end


			endcase 

				// Update ball position
				Ball_Y_Pos <= (Ball_Y_Pos + Ball_Y_Motion);  
				Ball_X_Pos <= (Ball_X_Pos + Ball_X_Motion);
				
				// Update Cannon position 
				Cannon_Y_Pos <= (Cannon_Y_Pos + Cannon_Y_Motion); 
				Cannon_X_Pos <= (Cannon_X_Pos + Cannon_X_Motion); 

		end  
    end
       
    assign BallX = Ball_X_Pos;
    assign BallY = Ball_Y_Pos;
    assign BallS = Ball_Size;

	assign CannonX = Cannon_X_Pos; 
	assign CannonY = Cannon_Y_Pos; 
    assign CannonS = Cannon_Size; 

endmodule
