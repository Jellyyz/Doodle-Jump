// Modified for final project, Ranpo & Gally 


module  physics( input Reset, frame_clk, Clk,
				 input [7:0] keycode 

			   output loadplat, 
               output [9:0]  DoodleX, DoodleY, DoodleS, 
			   output [2:0] outstate);
    
    logic [9:0] Doodle_X_Pos, Doodle_X_Motion, Doodle_Y_Pos, Doodle_Y_Motion, Doodle_Size; 
    logic [8:0] PlatX, PlatY, Plat_Size;
	 
    parameter [9:0] Screen_X_Center=320;  // Center position on the X axis
    parameter [9:0] Screen_Y_Center=240;  // Center position on the Y axis
    
	parameter [9:0] Screen_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Screen_X_Max=639;     // Rightmost point on the X axis

    parameter [9:0] Screen_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Screen_Y_Max=479;     // Bottommost point on the Y axis
    

	parameter [1:0] Gravity = 3; 
	parameter [2:0] CannonSpeed = 7;
    assign Doodle_Size = 12;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
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

	.outstate(outstate[2:0]),
	.loadplat(loadplat)
);
logic [2:0] Status, state; 
logic [7:0] counting; 
logic [1:0] counting2;
logic jump_enable, jump_reset; 
logic [9:0] Doodle_Top; 
 
logic [9:0] Cannon_Y_Motion, Cannon_X_Motion, Cannon_Y_Pos, Cannon_X_Pos, Cannon_Size; 

initial begin
	Doodle_Y_Motion = 10'h0; //Doodle_Y_Step;
	Doodle_X_Motion = 10'h0; //Doodle_X_Step;
	Doodle_Y_Pos <= Screen_Y_Center;
	Doodle_X_Pos <= Screen_X_Center;


end 

always_ff @ (posedge Reset or posedge frame_clk)
	assign platY = 9'd090;
    assign plat_size = 9'd4;
    begin
        if (Reset)  // Asynchronous Reset
        begin 
            	Doodle_Y_Motion = 10'h0; //Doodle_Y_Step;
				Doodle_X_Motion = 10'h0; //Doodle_X_Step;
				Doodle_Y_Pos <= Screen_Y_Center;
				Doodle_X_Pos <= Screen_X_Center;

				
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
					
				
				// on the ground and in motion must stop the Doodle 
				if(Doodle_Y_Pos + Doodle_Size >= Screen_Y_Max)
					Doodle_Y_Motion = 10'h0; 
				// above the ground and in motion start accelerating it in the positive time 
				else if(Doodle_Y_Motion > 10'h0 && Doodle_Y_Pos + Doodle_Size < Screen_Y_Max)
					begin
						jump_reset <= 1'b0; 
						jump_enable <= 1'b1; 
						Doodle_Y_Motion += counting2[1:0]; 
					end 
				// if not moving then get it to start falling or start jumping 
				if(Doodle_Y_Motion == 10'h0)
				begin 
					// if the Doodle is currently on the ground
					if(Doodle_Y_Pos + Doodle_Size >= Screen_Y_Max)
						begin
							jump_reset <= 1'b0; 
							jump_enable <= 1'b1; 
							Doodle_Y_Motion = (1'b1 + ~Gravity); 
						end 

					// if the Doodle is currently above the ground 
					else if(Doodle_Y_Pos + Doodle_Size <= Screen_Y_Max)
						begin 
							jump_reset <= 1'b1; 
							jump_enable <= 1'b0; 
							Doodle_Y_Motion = Gravity; 
						end 

				end 

				unique case(keycode)
					8'd7, 8'd79:
						Doodle_X_Motion = 2; 
					8'd4, 8'd80:
						Doodle_X_Motion = -2;	 
					default:
					begin 
						Doodle_X_Motion = 0;
					end 
				endcase 
				

			end

			3'b010: 
			begin
				Doodle_Y_Motion = 0; 
				Doodle_X_Motion = 0;
			end


			endcase 
							// Update Doodle position
				// wrap around screen condition  
				if((Doodle_X_Pos + Doodle_Size) >= (Screen_X_Max - 10'd25))  
					Doodle_X_Pos <= Screen_X_Min + (Doodle_Size << 2); 
				else if ( (Doodle_X_Pos - Doodle_Size) <= 10'd25) 
					Doodle_X_Pos <= Screen_X_Max - (Doodle_Size << 2); 
				else 
				begin 
					Doodle_Y_Pos <= (Doodle_Y_Pos + Doodle_Y_Motion);  
					Doodle_X_Pos <= (Doodle_X_Pos + Doodle_X_Motion);
				end 
		end 


    end

always_ff @ (posedge Reset or posedge frame_clk)
    begin 
    if(Doodle_Y_Pos - Doodle_Size == PlatY + Plat_Size && Doodle_Y_Motion < 0)
        begin
            jump_reset <= 1'b0; 
			jump_enable <= 1'b1; 
			Doodle_Y_Motion += counting2[1:0]; 
        end
    else 
        begin
            ;
        end
    end
       
    assign DoodleX = Doodle_X_Pos;
    assign DoodleY = Doodle_Y_Pos;
    assign DoodleS = Doodle_Size;

endmodule
