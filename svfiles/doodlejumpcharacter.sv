// Modified for final project, Feng & Gally 


module  jumplogic( input Reset, frame_clk, Clk,
				   input [7:0] keycode,
					input [8:0]platX, platY, plat_sizeX, plat_sizeY,
					input [9:0]platX1, platY1, 
					input [9:0]platX2, platY2, 
					input [9:0]platX3, platY3, 
					input [9:0]platX4, platY4, 
					input [9:0]platX5, platY5, 
					input [9:0]platX6, platY6, 
					input [9:0]platX7, platY7, 
					input [9:0]platX8, platY8, 
					input [9:0]platX9, platY9, 
					input [9:0]platX10, platY10, 
					input [9:0]platX11, platY11, 
					input [9:0]platX12, platY12, 
					input [9:0]platX13, platY13, 
					input [9:0]platX14, platY14, 
					input [9:0]platX15, platY15,

					output loadplat, 
					output [9:0]  DoodleX, DoodleY, DoodleS, 
					output [9:0]  CannonX, CannonY, CannonS, 
					output [2:0] outstate);

    logic [9:0] Doodle_X_Pos, Doodle_X_Motion, Doodle_Y_Pos, Doodle_Y_Motion, Doodle_Size;
	

    parameter [9:0] Screen_X_Center=320;  // Center position on the X axis
    parameter [9:0] Screen_Y_Center=240;  // Center position on the Y axis
    
	parameter [9:0] Screen_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Screen_X_Max=639;     // Rightmost point on the X axis

    parameter [9:0] Screen_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Screen_Y_Max=479;     // Bottommost point on the Y axis
    

	parameter [1:0] Gravity = 3; 
	parameter [2:0] CannonSpeed = 7;
    assign Doodle_Size = 6;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
	assign Cannon_Size = 2; 
counter counter(
	.Reset(jump_reset), 
	.enable(jump_enable), 
    .Clk(frame_clk), 

    .out(counting[6:0])
);

counter counter3(
	.Reset(jump_reset), 
	.enable(counting[5]), 
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
	Cannon_Y_Pos <= Screen_Y_Center; 
	Cannon_X_Pos <= Screen_X_Center; 
	Cannon_Y_Motion = 0; 
	Cannon_X_Motion = 0; 

end 

always_ff @ (posedge Reset or posedge frame_clk)
    begin
		logic [8:0] PlatY;
        if (Reset)  // Asynchronous Reset
        begin 
            	Doodle_Y_Motion = 10'h0; //Doodle_Y_Step;
				Doodle_X_Motion = 10'h0; //Doodle_X_Step;
				Doodle_Y_Pos <= Screen_Y_Center;
				Doodle_X_Pos <= Screen_X_Center;
				Cannon_Y_Pos <= Screen_Y_Center; 
				Cannon_X_Pos <= Screen_X_Center; 
				Cannon_Y_Motion <= 0; 
				Cannon_X_Motion <= 0; 
				
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
				// if not moving then get it to start falling or start jumping 
				if(Doodle_Y_Motion == 10'h0)
				begin 
					// if the Doodle is currently on the ground
					if((Doodle_Y_Pos + Doodle_Size >= Screen_Y_Max) ||
					  ((Doodle_Y_Pos + Doodle_Size == platY - plat_sizeY) && (platX + plat_sizeX >= Doodle_X_Pos) && (platX - plat_sizeX <= Doodle_X_Pos)) ||
					  ((Doodle_Y_Pos + Doodle_Size == platY1 - plat_sizeY) && (platX1 + plat_sizeX >= Doodle_X_Pos) && (platX1 - plat_sizeX <= Doodle_X_Pos)) ||
					  ((Doodle_Y_Pos + Doodle_Size == platY2 - plat_sizeY) && (platX2 + plat_sizeX >= Doodle_X_Pos) && (platX2 - plat_sizeX <= Doodle_X_Pos)) ||
					  ((Doodle_Y_Pos + Doodle_Size == platY3 - plat_sizeY) && (platX3 + plat_sizeX >= Doodle_X_Pos) && (platX3 - plat_sizeX <= Doodle_X_Pos)) ||
					  ((Doodle_Y_Pos + Doodle_Size == platY4 - plat_sizeY) && (platX4 + plat_sizeX >= Doodle_X_Pos) && (platX4 - plat_sizeX <= Doodle_X_Pos)) ||
					  ((Doodle_Y_Pos + Doodle_Size == platY5 - plat_sizeY) && (platX5 + plat_sizeX >= Doodle_X_Pos) && (platX5 - plat_sizeX <= Doodle_X_Pos)) ||
					  ((Doodle_Y_Pos + Doodle_Size == platY6 - plat_sizeY) && (platX6 + plat_sizeX >= Doodle_X_Pos) && (platX6 - plat_sizeX <= Doodle_X_Pos)) ||
					  ((Doodle_Y_Pos + Doodle_Size == platY7 - plat_sizeY) && (platX7 + plat_sizeX >= Doodle_X_Pos) && (platX7 - plat_sizeX <= Doodle_X_Pos)) ||
					  ((Doodle_Y_Pos + Doodle_Size == platY8 - plat_sizeY) && (platX8 + plat_sizeX >= Doodle_X_Pos) && (platX8 - plat_sizeX <= Doodle_X_Pos)) ||
					  ((Doodle_Y_Pos + Doodle_Size == platY9 - plat_sizeY) && (platX9 + plat_sizeX >= Doodle_X_Pos) && (platX9 - plat_sizeX <= Doodle_X_Pos)) ||
					  ((Doodle_Y_Pos + Doodle_Size == platY10 - plat_sizeY) && (platX10 + plat_sizeX >= Doodle_X_Pos) && (platX10 - plat_sizeX <= Doodle_X_Pos)) ||
					  ((Doodle_Y_Pos + Doodle_Size == platY11 - plat_sizeY) && (platX11 + plat_sizeX >= Doodle_X_Pos) && (platX11 - plat_sizeX <= Doodle_X_Pos)) ||
					  ((Doodle_Y_Pos + Doodle_Size == platY12 - plat_sizeY) && (platX12 + plat_sizeX >= Doodle_X_Pos) && (platX12 - plat_sizeX <= Doodle_X_Pos)) ||
					  ((Doodle_Y_Pos + Doodle_Size == platY13 - plat_sizeY) && (platX13 + plat_sizeX >= Doodle_X_Pos) && (platX13 - plat_sizeX <= Doodle_X_Pos)) ||
					  ((Doodle_Y_Pos + Doodle_Size == platY14 - plat_sizeY) && (platX14 + plat_sizeX >= Doodle_X_Pos) && (platX14 - plat_sizeX <= Doodle_X_Pos)) ||
					  ((Doodle_Y_Pos + Doodle_Size == platY15 - plat_sizeY) && (platX15 + plat_sizeX >= Doodle_X_Pos) && (platX15 - plat_sizeX <= Doodle_X_Pos)))
						begin
							jump_reset <= 1'b1;  // reset the counter for velocity 
							jump_enable <= 1'b0; 	// begin the convergence of velocity toward 0 
							Doodle_Y_Motion = (1'b1 + ~Gravity);  // allow for the doodle to "jump"
						end 

					// if the Doodle is currently above the ground 
					else if(Doodle_Y_Pos + Doodle_Size <= Screen_Y_Max)
						begin 
							jump_reset <= 1'b1; // rest the counter for velocity 
							jump_enable <= 1'b0;  // converge 
							Doodle_Y_Motion = Gravity;  // allow for the doodle to start falling at peak 
						end 

				end 

				else if(Doodle_Y_Motion != 10'h0)
				begin 
					// if the doodle is falling 
					if(Doodle_Y_Motion >= Gravity)
						begin 
							if((Doodle_Y_Pos + Doodle_Size >= Screen_Y_Max) ||
								((Doodle_Y_Pos + Doodle_Size == platY - plat_sizeY) && (platX + plat_sizeX >= Doodle_X_Pos ) && (platX - plat_sizeX <= Doodle_X_Pos)) ||
								((Doodle_Y_Pos + Doodle_Size == platY1 - plat_sizeY) && (platX1 + plat_sizeX >= Doodle_X_Pos) && (platX1 - plat_sizeX <= Doodle_X_Pos)) ||
								((Doodle_Y_Pos + Doodle_Size == platY2 - plat_sizeY) && (platX2 + plat_sizeX >= Doodle_X_Pos) && (platX2 - plat_sizeX <= Doodle_X_Pos)) ||
								((Doodle_Y_Pos + Doodle_Size == platY3 - plat_sizeY) && (platX3 + plat_sizeX >= Doodle_X_Pos) && (platX3 - plat_sizeX <= Doodle_X_Pos)) ||
								((Doodle_Y_Pos + Doodle_Size == platY4 - plat_sizeY) && (platX4 + plat_sizeX >= Doodle_X_Pos) && (platX4 - plat_sizeX <= Doodle_X_Pos)) ||
								((Doodle_Y_Pos + Doodle_Size == platY5 - plat_sizeY) && (platX5 + plat_sizeX >= Doodle_X_Pos) && (platX5 - plat_sizeX <= Doodle_X_Pos)) ||
								((Doodle_Y_Pos + Doodle_Size == platY6 - plat_sizeY) && (platX6 + plat_sizeX >= Doodle_X_Pos) && (platX6 - plat_sizeX <= Doodle_X_Pos)) ||
								((Doodle_Y_Pos + Doodle_Size == platY7 - plat_sizeY) && (platX7 + plat_sizeX >= Doodle_X_Pos) && (platX7 - plat_sizeX <= Doodle_X_Pos)) ||
								((Doodle_Y_Pos + Doodle_Size == platY8 - plat_sizeY) && (platX8 + plat_sizeX >= Doodle_X_Pos) && (platX8 - plat_sizeX <= Doodle_X_Pos)) ||
								((Doodle_Y_Pos + Doodle_Size == platY9 - plat_sizeY) && (platX9 + plat_sizeX >= Doodle_X_Pos) && (platX9 - plat_sizeX <= Doodle_X_Pos)) ||
								((Doodle_Y_Pos + Doodle_Size == platY10 - plat_sizeY) && (platX10 + plat_sizeX >= Doodle_X_Pos) && (platX10 - plat_sizeX <= Doodle_X_Pos)) ||
								((Doodle_Y_Pos + Doodle_Size == platY11 - plat_sizeY) && (platX11 + plat_sizeX >= Doodle_X_Pos) && (platX11 - plat_sizeX <= Doodle_X_Pos)) ||
								((Doodle_Y_Pos + Doodle_Size == platY12 - plat_sizeY) && (platX12 + plat_sizeX >= Doodle_X_Pos) && (platX12 - plat_sizeX <= Doodle_X_Pos)) ||
								((Doodle_Y_Pos + Doodle_Size == platY13 - plat_sizeY) && (platX13 + plat_sizeX >= Doodle_X_Pos) && (platX13 - plat_sizeX <= Doodle_X_Pos)) ||
								((Doodle_Y_Pos + Doodle_Size == platY14 - plat_sizeY) && (platX14 + plat_sizeX >= Doodle_X_Pos) && (platX14 - plat_sizeX <= Doodle_X_Pos)) ||
								((Doodle_Y_Pos + Doodle_Size == platY15 - plat_sizeY) && (platX15 + plat_sizeX >= Doodle_X_Pos) && (platX15 - plat_sizeX <= Doodle_X_Pos)))
								begin 
								// if doodle falling then allow for it to turn velocity to 0 
									Doodle_Y_Motion = 10'h0; 
								end 
							else
								begin 
									jump_reset = 0; 
									jump_enable = 1; 
									Doodle_Y_Motion += counting2[1:0]; 
								end 
						end 
					else if(Doodle_Y_Motion < 10'h0)
						begin 
							jump_reset = 0; 
							jump_enable = 1; 
							Doodle_Y_Motion += counting2[1:0]; 
						end 
				end 

				unique case(keycode)
					8'd30:
					begin 
						Cannon_Y_Motion <= (1'b1 + ~CannonSpeed); 
					end 
					8'd7, 8'd79:
						Doodle_X_Motion = 2; 
					8'd4, 8'd80:
						Doodle_X_Motion = -2;	 
					default:
					begin 
						Doodle_X_Motion = 0;
						Cannon_X_Motion <= 0; 
					end 
				endcase 
				

			end

			3'b010: 
			begin
				Doodle_Y_Motion = 0; 
				Doodle_X_Motion = 0;
				Cannon_X_Motion <= 0; 
				Cannon_Y_Motion <= 0; 
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

				// Update Cannon position 
				if(Cannon_Y_Pos - Cannon_Size <= 10'd25)
					begin 
						Cannon_Y_Pos <= Doodle_Y_Pos; 
						Cannon_X_Pos <= Doodle_X_Pos; 
						Cannon_X_Motion <= 0; 
						Cannon_Y_Motion <= 0; 
					end
				if(Cannon_Y_Motion <= 0 && outstate != 3'b010)
					begin 
						Cannon_Y_Pos <= Doodle_Y_Pos; 
						Cannon_X_Pos <= Doodle_X_Pos; 
					end
				else 
				begin 
					Cannon_Y_Pos <= (Cannon_Y_Pos + Cannon_Y_Motion); 
					Cannon_X_Pos <= (Cannon_X_Pos + Cannon_X_Motion); 
				end
		end  
    end
       
    assign DoodleX = Doodle_X_Pos;
    assign DoodleY = Doodle_Y_Pos;
    assign DoodleS = Doodle_Size;

	assign CannonX = Cannon_X_Pos; 
	assign CannonY = Cannon_Y_Pos; 
    assign CannonS = Cannon_Size; 

endmodule
