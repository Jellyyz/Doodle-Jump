module  jumplogic(  input logic Reset, frame_clk, Clk,
				    input logic [7:0] keycode,
				    input logic [8:0]plat_sizeX, plat_sizeY,
					input logic [8:0]platX, platY, 
					input logic [8:0]platX1, platY1, 
					input logic [8:0]platX2, platY2, 
					input logic [8:0]platX3, platY3, 
					input logic [8:0]platX4, platY4, 
					input logic [8:0]platX5, platY5, 
					input logic [8:0]platX6, platY6, 
					input logic [8:0]platX7, platY7, 
					input logic [8:0]platX8, platY8, 
					input logic [8:0]platX9, platY9, 
					input logic [8:0]platX10, platY10, 
					input logic [8:0]platX11, platY11, 
					input logic [8:0]platX12, platY12, 
					input logic [8:0]platX13, platY13, 
					input logic [8:0]platX14, platY14, 
					input logic [8:0]platX15, platY15,
                    input logic [8:0]plat_size_easy_X, plat_size_medium_X, plat_size_hard_X,                    
                	input logic [8:0]plat_size_easy_Y, plat_size_medium_Y, plat_size_hard_Y,
					input logic trigger, 

					output logic loadplat,
					output logic [9:0]  DoodleX, DoodleY, DoodleS, 
					output logic [9:0]  CannonX, CannonY, CannonS, 
					output logic [9:0]  CannonX1, CannonY1, 
					output logic [9:0]  CannonX2, CannonY2,
					output logic [5:0] outstate,
					output logic [9:0] Doodle_Y_Motion,
					output logic [9:0] Doodle_X_Pos, 
					output logic [8:0] plat_temp_Y, 
					output logic refresh_en,
					output logic [15:0] countingss, 
					output logic [7:0] displacement, airtime,
					output logic [11:0]Score,
					output logic [1:0] difficulty
					);


    logic [9:0] Doodle_Y_Pos, Doodle_X_Motion, Doodle_Size;
	

		

    parameter [9:0] Screen_X_Center=320;  // Center position on the X axis
    parameter [9:0] Screen_Y_Center=240;  // Center position on the Y axis
    
	parameter [9:0] Screen_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Screen_X_Max=639;     // Rightmost point on the X axis

    parameter [9:0] Screen_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Screen_Y_Max=479;     // Bottommost point on the Y axis
    

	parameter [1:0] Gravity = 3; 
	parameter [4:0] CannonSpeed = 5'd14;
	parameter [4:0] CannonSpeed1 = 5'd10;
    parameter [2:0] CannonSpeed2 = 3'd6;
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

counter antispam(
	.Reset(0), 
	.enable(1), 
    .Clk(frame_clk), 

    .out(antighosting[5:0])
);
jumpstate jumpstate(
	.Clock(Clk), 
	.frame_clk(frame_clk), 
	.Reset(Reset), 
	.Keycode(keycode[7:0]),
	.trigger(trigger),
	.refresh_en(refresh_en),
	.outstate(outstate[5:0]),
	.loadplat(loadplat)
);
logic [2:0] Status, state; 
logic [7:0] counting; 
logic [5:0] antighosting; 
logic [7:0] antighostkey; 
//logic [15:0] countingss;
logic [1:0] counting2;
logic jump_enable, jump_reset; 
logic [9:0] Doodle_Top; 
 
logic [9:0] Cannon_Y_Motion, Cannon_X_Motion, Cannon_Y_Pos, Cannon_X_Pos, Cannon_Size; 
logic [9:0] Cannon_Y_Motion1, Cannon_X_Motion1, Cannon_Y_Pos1, Cannon_X_Pos1; 
logic [9:0] Cannon_Y_Motion2, Cannon_X_Motion2, Cannon_Y_Pos2, Cannon_X_Pos2; 
logic [9:0] Score_diff;
logic [9:0] Current_Y;

logic [7:0] counterdis; 

always_ff @ (posedge Reset or posedge frame_clk)

    begin
        if (Reset)  // Asynchronous Reset
			begin 
					Doodle_Y_Pos <= 9'd100;
					Doodle_X_Pos <= 9'd330;
					Cannon_Y_Motion <= 0; 
					Cannon_X_Motion <= 0;
					Cannon_Y_Pos1 <= Screen_Y_Center; 
					Cannon_X_Pos1 <= Screen_X_Center; 
					Cannon_Y_Motion1 <= 0; 
					Cannon_X_Motion1 <= 0;
					Cannon_Y_Pos2 <= Screen_Y_Center; 
					Cannon_X_Pos2 <= Screen_X_Center; 
					Cannon_Y_Motion2 <= 0; 
					Cannon_X_Motion2 <= 0;  
					plat_temp_Y <= 0; 
					Score <= 0;
			end 

        else 
        begin 
// ▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽STATE MACHINE FOR THE DOODLE GAME BOF▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽
// ▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽
			unique case(outstate)
				3'b101:
				begin 
					Doodle_Y_Pos <= 9'd100;
					Doodle_X_Pos <= 9'd330;
					Doodle_X_Motion <= 10'h0; //Doodle_X_Step;
					jump_reset <= 1; 
					jump_enable <= 0; 
					refresh_en <= 0;
					difficulty <= 2'b01;
				end 
				// ▣	▣	▣	▣	▣	▣	▣	▣	▣	▣   Main Menu   ▣	▣	▣	▣	▣	▣	▣	▣	▣	▣	▣	▣	
				3'b000:
				begin 
					refresh_en <= 0;
					plat_temp_Y <= 0; 
					Score <= 0;
					// modified physics engine for main menu 
					// if not moving then get it to start falling or start jumping 
					if(Doodle_Y_Motion == 10'h0)
						begin 
						// if the Doodle is currently above the platforms
						if(Doodle_Y_Pos + Doodle_Size < 240) // && if not already in proximity of platform ?
							begin 
								jump_reset <= 1; 
								jump_enable <= 0; 
								Doodle_Y_Motion = Gravity;  // allow for the doodle to start falling at peak 
							end 
						else if(Platform_collision)
							begin
								jump_reset <= 1;  // reset the counter for velocity 
								jump_enable <= 0; 	// begin the convergence of velocity toward 0 
								Doodle_Y_Motion = (1'b1 + ~Gravity);  // allow for the doodle to "jump"
							end 
						end 

					else if(Doodle_Y_Motion != 10'h0)
					begin 
						// if the doodle is moving upwards 
						if(Doodle_Y_Motion[7:4] >= 4'hC)
							begin 
								jump_reset <= 0; 
								jump_enable <= 1; 
								if(counting2 == 2'd3)
									Doodle_Y_Motion += counting2[1:0]; 
							end 
						// if the doodle is moving downwards 
						else if(Doodle_Y_Motion[7:4] >= 4'h0 && Doodle_Y_Motion[7:4] <= 4'hA)
							begin 
								// if the doodle is moving downwards and hitting the ground or platform 
								if(Platform_collision)
									begin 
									// if doodle falling then allow for it to turn velocity to 0 
										jump_reset <= 1; 
										jump_enable <= 0;
										Doodle_Y_Motion = (1'b1 + ~Gravity); 
									end 
								else if(Doodle_Y_Motion != 4'hFE)
									begin 
										jump_reset <= 0; 
										jump_enable <= 1; 
										Doodle_Y_Motion += counting2[0]; 
									end 
							end  
					end 
					// keyboard input logic detector for main menu 
					// antighosting allows for polling only 4x a second not 60x 
					if(antighosting == 6'd60 || antighosting == 6'd45 || antighosting == 6'd30 || antighosting == 6'd15)
						antighostkey <= keycode;
					else 
						antighostkey <= 0; 
					unique case(antighostkey)
						8'd7, 8'd79: // right 
							begin 
								if(Doodle_X_Pos == 9'd230)
									Doodle_X_Pos <= 9'd330; 
								else if(Doodle_X_Pos == 9'd330)
									Doodle_X_Pos <= 9'd430; 
								else if(Doodle_X_Pos == 9'd430)
									Doodle_X_Pos <= 9'd230; 
							end
						8'd4, 8'd80: // left 
							begin 
								if(Doodle_X_Pos == 9'd230)
									Doodle_X_Pos <= 9'd430; 
								else if(Doodle_X_Pos == 9'd330)
									Doodle_X_Pos <= 9'd230; 
								else if(Doodle_X_Pos == 9'd430)
									Doodle_X_Pos <= 9'd330; 
							end 
						default:
							begin 
								Doodle_Y_Pos <= (Doodle_Y_Pos + Doodle_Y_Motion);  
							end 
					endcase 
					unique case(Doodle_X_Pos) 
					// ez
					9'd230:
						difficulty <= 2'b00; 
					// normal 
					9'd330:
						difficulty <= 2'b01; 
					// hard
					9'd430:
						difficulty <= 2'b10; 
					endcase 
				
				end
				// ▣	▣	▣	▣	▣	▣	▣	▣	▣	▣	Loading ▣	▣	▣	▣	▣	▣	▣	▣	▣	▣	▣	▣	
				3'b001:
				begin 
					refresh_en <= 0;
					plat_temp_Y <= 0; 
					Doodle_Y_Pos <= 9'd300; 
					Doodle_X_Pos <= 9'd330; 
					Doodle_X_Motion <= 10'h0; //Doodle_X_Step;
					Score <= 0;
				end 
				// ▣	▣	▣	▣	▣	▣	▣	▣	▣	▣	Game ▣	▣	▣	▣	▣	▣	▣	▣	▣	▣	▣	▣	
				3'b010: 
				begin
					if(!refresh_en)
						begin 
						// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~SCROLLING ENGINE~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
						if(!Platform_collision && Doodle_Y_Pos <= 240 && (Doodle_Y_Motion[7:4] == 4'hF))
							begin 
								plat_temp_Y <= Doodle_Y_Motion; 
								refresh_en <= 1; 
							end 
						else 
							plat_temp_Y <= 0; 
						end  
					else if(refresh_en)
						begin 
							Doodle_Y_Motion = 0;
							Doodle_Y_Pos <= 240;  
							if(trigger)
								refresh_en <= 0; 
						end 

					// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~PHYSICS ENGINE BELOW~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
					
					// if not moving then get it to start falling or start jumping 
					if(Doodle_Y_Motion == 10'h0)
						begin 
							// if the Doodle is currently on the ground
							if(Doodle_Y_Pos + Doodle_Size >= Screen_Y_Max)
								begin
									jump_reset <= 1;  // reset the counter for velocity 
									jump_enable <= 0; 	// begin the convergence of velocity toward 0 
									Doodle_Y_Motion = (1'b1 + ~Gravity);  // allow for the doodle to "jump"
								end 

							// if the Doodle is currently above the ground 
							else if(Doodle_Y_Pos + Doodle_Size < Screen_Y_Max) // && if not already in proximity of platform ?
								begin 
									jump_reset <= 1; 
									jump_enable <= 0; 
									Doodle_Y_Motion = Gravity;  // allow for the doodle to start falling at peak 
								end 
						end 

					else if(Doodle_Y_Motion != 10'h0)
					begin 
						// if the doodle is moving upwards 
						if(Doodle_Y_Motion[7:4] >= 4'hC)
							begin 
								jump_reset <= 0; 
								jump_enable <= 1; 
								if(counting2 == 2'd3)
									Doodle_Y_Motion += counting2[1:0]; 
							end 
						// if the doodle is moving downwards 
						else if(Doodle_Y_Motion[7:4] >= 4'h0 && Doodle_Y_Motion[7:4] <= 4'hA)
							begin 
								// if the doodle is moving downwards and hitting the ground or platform 
								if((airtime == 8'h0) && ((Doodle_Y_Pos + Doodle_Size >= Screen_Y_Max) || Platform_collision))
									begin 
									// if doodle falling then allow for it to turn velocity to 0 
										jump_reset <= 1; 
										jump_enable <= 0;
										Doodle_Y_Motion = (1'b1 + ~Gravity); 
									end 
								else if(Doodle_Y_Motion != 4'hFE)
									begin 
										jump_reset <= 0; 
										jump_enable <= 1; 
										Doodle_Y_Motion += counting2[0]; 
									end 
							end 
						// if the doodle is moving upwards 
					end 

					// keyboard input logic detector
					unique case(keycode)
						8'd30:
						begin 
							Cannon_Y_Motion <= (1'b1 + ~CannonSpeed); 
							Cannon_Y_Motion1 <= (1'b1 + ~CannonSpeed1); 
							Cannon_Y_Motion2 <= (1'b1 + ~CannonSpeed2); 
						end 
						8'd7, 8'd79:
							Doodle_X_Motion <= 3; 
						8'd4, 8'd80:
							Doodle_X_Motion <= -3;	 
						default:
							begin 
								Doodle_X_Motion <= 0;
								Cannon_X_Motion <= 0; 
								Cannon_X_Motion1 <= 0;
								Cannon_X_Motion2 <= 0;
							end 
					endcase 
					

				end
				// ▣	▣	▣	▣	▣	▣	▣	▣	▣	▣	Pause ▣	▣	▣	▣	▣	▣	▣	▣	▣	▣	▣	▣	
				3'b011: 
				begin
					Doodle_Y_Motion = 0; 
					Doodle_X_Motion <= 0;
					Cannon_Y_Motion <= 0;
					Cannon_Y_Motion1 <= 0;
					Cannon_Y_Motion2 <= 0;
					plat_temp_Y <= 0;  
				end
				// ▣	▣	▣	▣	▣	▣	▣	▣	▣	▣	Refresh screen  ▣	▣	▣	▣	▣	▣	▣	▣	▣	
				3'b100:
				begin
						refresh_en <= 0;
					Doodle_Y_Motion = 0; 
					unique case(keycode)
						8'd30:
						begin 
							Cannon_Y_Motion <= (1'b1 + ~CannonSpeed); 
							Cannon_Y_Motion1 <= (1'b1 + ~CannonSpeed1); 
							Cannon_Y_Motion2 <= (1'b1 + ~CannonSpeed2); 
						end 
						8'd7, 8'd79:
							Doodle_X_Motion <= 3; 
						8'd4, 8'd80:
							Doodle_X_Motion <= -3;	 
						default:
							begin 
								Doodle_X_Motion <= 0;
								Cannon_X_Motion <= 0; 
								Cannon_X_Motion1 <= 0;
								Cannon_X_Motion2 <= 0;
							end 
					endcase 
				end

			

			endcase 
// △△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△			
// △△△△△△△△△△△△△△△△△△△△△△△STATE MACHINE FOR THE DOODLE GAME EOF△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△
// ▣	▣	▣	▣	▣	▣	▣	▣	▣	▣	Constant Calculation ▣	▣	▣	▣	▣	▣	▣	▣	▣	▣	▣	▣	

				// count however long the doodle is in the air for
				if(outstate != 5'd3 && Doodle_Y_Motion[7:4] >= 4'hC)
					airtime <= airtime + 1; 
				else 
					airtime <= 0; 

				// Update Doodle position
				// wrap around screen condition  
				if((Doodle_X_Pos + Doodle_Size) >= (Screen_X_Max - 10'd25))  
					Doodle_X_Pos <= Screen_X_Min + (Doodle_Size << 4); 
				else if ( (Doodle_X_Pos - Doodle_Size) <= 10'd25) 
					Doodle_X_Pos <= Screen_X_Max - (Doodle_Size << 4); 
				else if(outstate != 6'd0)
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
				if(Cannon_Y_Motion <= 0 && outstate != 3'b011)
					begin 
						Cannon_Y_Pos <= Doodle_Y_Pos; 
						Cannon_X_Pos <= Doodle_X_Pos; 
					end
				else 
				begin 
					Cannon_Y_Pos <= (Cannon_Y_Pos + Cannon_Y_Motion); 
					Cannon_X_Pos <= (Cannon_X_Pos + Cannon_X_Motion); 
				end
				
				// Update Cannon1 position 
				if(Cannon_Y_Pos1 - Cannon_Size <= 10'd25)
					begin 
						Cannon_Y_Pos1 <= Doodle_Y_Pos; 
						Cannon_X_Pos1 <= Doodle_X_Pos; 
						Cannon_X_Motion1 <= 0; 
						Cannon_Y_Motion1 <= 0; 
					end
				if(Cannon_Y_Motion1 <= 0 && outstate != 3'b011)
					begin 
						Cannon_Y_Pos1 <= Doodle_Y_Pos; 
						Cannon_X_Pos1 <= Doodle_X_Pos; 
					end
				else 
				begin 
					Cannon_Y_Pos1 <= (Cannon_Y_Pos1 + Cannon_Y_Motion1); 
					Cannon_X_Pos1 <= (Cannon_X_Pos1 + Cannon_X_Motion1); 
				end

				// Update Cannon2 position 
				if(Cannon_Y_Pos2 - Cannon_Size <= 10'd25)
					begin 
						Cannon_Y_Pos2 <= Doodle_Y_Pos; 
						Cannon_X_Pos2 <= Doodle_X_Pos; 
						Cannon_X_Motion2 <= 0; 
						Cannon_Y_Motion2 <= 0; 
					end
				if(Cannon_Y_Motion2 <= 0 && outstate != 3'b011)
					begin 
						Cannon_Y_Pos2 <= Doodle_Y_Pos; 
						Cannon_X_Pos2 <= Doodle_X_Pos; 
					end
				else 
				begin 
					Cannon_Y_Pos2 <= (Cannon_Y_Pos2 + Cannon_Y_Motion2); 
					Cannon_X_Pos2 <= (Cannon_X_Pos2 + Cannon_X_Motion2); 
				end
		
				Current_Y <= 240;
				
				if(Doodle_Y_Pos < Current_Y)
					begin
						Score_diff <= (Current_Y - Doodle_Y_Pos);
						Current_Y <= Doodle_Y_Pos; 
						Score <= Score + Score_diff;
					end

		end  
	end
logic Platform_collision; 
always_comb
begin
// DETECTS IF WE HIT A PLATFORM
	Platform_collision =  (((Doodle_Y_Pos + Doodle_Size <= platY + plat_sizeY) && (Doodle_Y_Pos + Doodle_Size >= platY - plat_sizeY) && (platX + plat_sizeX >= Doodle_X_Pos - Doodle_Size ) && (platX - plat_sizeX <= Doodle_X_Pos + Doodle_Size)) ||
								((Doodle_Y_Pos + Doodle_Size <= platY1 + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= platY1 - plat_sizeY) && (platX1 + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (platX1 - plat_sizeX <= Doodle_X_Pos + Doodle_Size)) ||
								((Doodle_Y_Pos + Doodle_Size <= platY2 + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= platY2 - plat_sizeY) && (platX2 + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (platX2 - plat_sizeX <= Doodle_X_Pos + Doodle_Size)) ||
								((Doodle_Y_Pos + Doodle_Size <= platY3 + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= platY3 - plat_sizeY) && (platX3 + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (platX3 - plat_sizeX <= Doodle_X_Pos + Doodle_Size)) ||
								((Doodle_Y_Pos + Doodle_Size <= platY4 + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= platY4 - plat_sizeY) && (platX4 + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (platX4 - plat_sizeX <= Doodle_X_Pos + Doodle_Size)) ||
								((Doodle_Y_Pos + Doodle_Size <= platY5 + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= platY5 - plat_sizeY) && (platX5 + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (platX5 - plat_sizeX <= Doodle_X_Pos + Doodle_Size)) ||
								((Doodle_Y_Pos + Doodle_Size <= platY6 + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= platY6 - plat_sizeY) && (platX6 + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (platX6 - plat_sizeX <= Doodle_X_Pos + Doodle_Size)) ||
								((Doodle_Y_Pos + Doodle_Size <= platY7 + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= platY7 - plat_sizeY) && (platX7 + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (platX7 - plat_sizeX <= Doodle_X_Pos + Doodle_Size)) ||
								((Doodle_Y_Pos + Doodle_Size <= platY8 + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= platY8 - plat_sizeY) && (platX8 + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (platX8 - plat_sizeX <= Doodle_X_Pos + Doodle_Size)) ||
								((Doodle_Y_Pos + Doodle_Size <= platY9 + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= platY9 - plat_sizeY) && (platX9 + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (platX9 - plat_sizeX <= Doodle_X_Pos + Doodle_Size)) ||
								((Doodle_Y_Pos + Doodle_Size <= platY10  + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= platY10 - plat_sizeY) && (platX10 + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (platX10 - plat_sizeX <= Doodle_X_Pos + Doodle_Size)) ||
								((Doodle_Y_Pos + Doodle_Size <= platY11  + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= platY11 - plat_sizeY) && (platX11 + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (platX11 - plat_sizeX <= Doodle_X_Pos + Doodle_Size)) ||
								((Doodle_Y_Pos + Doodle_Size <= platY12  + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= platY12 - plat_sizeY) && (platX12 + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (platX12 - plat_sizeX <= Doodle_X_Pos + Doodle_Size)) ||
								((Doodle_Y_Pos + Doodle_Size <= platY13  + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= platY13 - plat_sizeY) && (platX13 + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (platX13 - plat_sizeX <= Doodle_X_Pos + Doodle_Size)) ||
								((Doodle_Y_Pos + Doodle_Size <= platY14  + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= platY14 - plat_sizeY) && (platX14 + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (platX14 - plat_sizeX <= Doodle_X_Pos + Doodle_Size)) ||
								((Doodle_Y_Pos + Doodle_Size <= platY15  + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= platY15 - plat_sizeY) && (platX15 + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (platX15 - plat_sizeX <= Doodle_X_Pos + Doodle_Size)) ||
								((Doodle_Y_Pos + Doodle_Size <= plat_size_easy_Y  + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= plat_size_easy_Y - plat_sizeY) && (plat_size_easy_X + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (plat_size_easy_X - plat_sizeX <= Doodle_X_Pos + Doodle_Size)) ||
								((Doodle_Y_Pos + Doodle_Size <= plat_size_medium_Y  + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= plat_size_medium_Y - plat_sizeY) && (plat_size_medium_X + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (plat_size_medium_X - plat_sizeX <= Doodle_X_Pos + Doodle_Size)) ||
								((Doodle_Y_Pos + Doodle_Size <= plat_size_hard_Y  + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= plat_size_hard_Y - plat_sizeY) && (plat_size_hard_X + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (plat_size_hard_X - plat_sizeX <= Doodle_X_Pos + Doodle_Size))						
								);


end 

    assign DoodleX = Doodle_X_Pos;
    assign DoodleY = Doodle_Y_Pos;
    assign DoodleS = Doodle_Size;

	assign CannonX = Cannon_X_Pos; 
	assign CannonY = Cannon_Y_Pos; 
    assign CannonS = Cannon_Size; 

	assign CannonX1 = Cannon_X_Pos1; 
	assign CannonY1 = Cannon_Y_Pos1; 
	
	assign CannonX2 = Cannon_X_Pos2; 
	assign CannonY2 = Cannon_Y_Pos2; 

endmodule
