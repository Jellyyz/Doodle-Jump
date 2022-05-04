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
					input logic [8:0] springX, springY, 
                    input logic [8:0] springX1, springY1, 
                    input logic [8:0] springX2, springY2, 
                    input logic [8:0] springX3, springY3,
					input logic springsizeX, springsizeY,
					input logic [8:0] rocketX, rocketY, 
					input logic rocketsizeX, rocketsizeY,
                    input logic [2:0] plat0_color,
                    input logic [2:0] plat1_color,
                    input logic [2:0] plat2_color,
                    input logic [2:0] plat3_color,
                    input logic [2:0] plat4_color,
                    input logic [2:0] plat5_color,
                    input logic [2:0] plat6_color,
                    input logic [2:0] plat7_color,
                    input logic [2:0] plat8_color,
                    input logic [2:0] plat9_color,
                    input logic [2:0] plat10_color,
                    input logic [2:0] plat11_color,
                    input logic [2:0] plat12_color,
                    input logic [2:0] plat13_color,
                    input logic [2:0] plat14_color,
                    input logic [2:0] plat15_color,

					output logic doodle_down_check, 
					output logic Platform_collision,
					output logic Platform_collision0,
					output logic Platform_collision1,
					output logic Platform_collision2,
					output logic Platform_collision3,
					output logic Platform_collision4,
					output logic Platform_collision5,
					output logic Platform_collision6,
					output logic Platform_collision7,
					output logic Platform_collision8,
					output logic Platform_collision9,
					output logic Platform_collision10,
					output logic Platform_collision11,
					output logic Platform_collision12,
					output logic Platform_collision13,
					output logic Platform_collision14,
					output logic Platform_collision15,
					output logic loadplat,
					output logic [9:0]  DoodleX, DoodleY, DoodleS, 
					output logic [9:0]  CannonX, CannonY, CannonS, 
					output logic [9:0]  CannonX1, CannonY1, 
					output logic [9:0]  CannonX2, CannonY2,
					output logic [5:0] outstate,
					output logic [9:0] Doodle_Y_Motion,
					output logic [9:0] Doodle_X_Pos, 
					output logic [9:0] Doodle_Y_Pos,
					output logic [8:0] plat_temp_Y, 
					output logic refresh_en,
					output logic [15:0] countingss, 
					output logic [7:0] displacement, airtime,
					output logic [19:0]Score,
					output logic [1:0] difficulty
					);


    logic [9:0] Doodle_X_Motion;
	

		

    parameter [9:0] Screen_X_Center=320;  // Center position on the X axis
    parameter [9:0] Screen_Y_Center=240;  // Center position on the Y axis
    
	parameter [9:0] Screen_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Screen_X_Max=639;     // Rightmost point on the X axis

    parameter [9:0] Screen_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Screen_Y_Max=479;     // Bottommost point on the Y axis
    

	parameter [1:0] Gravity = 3; 
	parameter [2:0] Spring_Modifier = 7;
	parameter [3:0] Rocket_Modifier = 15;
	parameter [4:0] CannonSpeed = 5'd14;
	parameter [4:0] CannonSpeed1 = 5'd10;
    parameter [2:0] CannonSpeed2 = 3'd6;
	assign Doodle_Size = 16;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
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

    .out(counting2[3:0])
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
logic jump_enable, jump_reset; 
logic [9:0] Doodle_Top; 
logic [3:0] counting2;
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
					Cannon_Y_Pos1 <= Doodle_Y_Pos; 
					Cannon_X_Pos1 <= Doodle_X_Pos; 
					Cannon_Y_Motion1 <= 0; 
					Cannon_X_Motion1 <= 0;
					Cannon_Y_Pos2 <= Doodle_Y_Pos; 
					Cannon_X_Pos2 <= Doodle_X_Pos; 
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
					Score <= 0;
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
								if(counting2 == 2'd3 && Doodle_Y_Motion == 1'b1 + ~Gravity)
									Doodle_Y_Motion += 2'd3;  
								else if(counting2 == 3'd7 && Doodle_Y_Motion == 1'b1 + ~Spring_Modifier)
									Doodle_Y_Motion += 3'd7; 
								else if(counting2 == 4'd15 && Doodle_Y_Motion == 1'b1 + ~Rocket_Modifier)
									Doodle_Y_Motion += 4'd15; 
							end 
						// if the doodle is moving downwards 
						else if(doodle_down_check)
							begin 
								if((airtime == 8'h0) && ((Doodle_Y_Pos + Doodle_Size >= Screen_Y_Max) || Spring_collision ))
									begin 
									// if doodle falling then allow for it to turn velocity to 0 
										jump_reset <= 1; 
										jump_enable <= 0;
										Doodle_Y_Motion = (1'b1 + ~Spring_Modifier); 
									end 
								// if the doodle is moving downwards and hitting the ground or platform 
								else if((airtime == 8'h0) && ((Doodle_Y_Pos + Doodle_Size >= Screen_Y_Max) || Platform_collision))
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
										if(counting2 == 2'd3)
											Doodle_Y_Motion += counting2[1:0]; 
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
							Doodle_X_Motion <= 4; 
						8'd4, 8'd80:
							Doodle_X_Motion <= -4;	 
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


assign doodle_down_check = Doodle_Y_Motion[7:4] >= 4'h0 && Doodle_Y_Motion[7:4] <= 4'hA; 
always_comb
begin:Plat_coll

logic Platform_collisionE;
logic Platform_collisionM;
logic Platform_collisionH;
// DETECTS IF WE HIT A PLATFORM
	if(plat0_color == 3'b100)
		Platform_collision0 = 0; 
	else 
		Platform_collision0 = ((Doodle_Y_Pos + Doodle_Size <= platY + plat_sizeY) && (Doodle_Y_Pos + Doodle_Size >= platY - plat_sizeY) && (platX + plat_sizeX >= Doodle_X_Pos - Doodle_Size ) && (platX - plat_sizeX <= Doodle_X_Pos + Doodle_Size));
	if(plat1_color == 3'b100)
		Platform_collision1 = 0; 
	else 
		Platform_collision1 = ((Doodle_Y_Pos + Doodle_Size <= platY1 + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= platY1 - plat_sizeY) && (platX1 + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (platX1 - plat_sizeX <= Doodle_X_Pos + Doodle_Size)); 
	if(plat2_color == 3'b100)
		Platform_collision2 = 0; 
	else 
		Platform_collision2 = ((Doodle_Y_Pos + Doodle_Size <= platY2 + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= platY2 - plat_sizeY) && (platX2 + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (platX2 - plat_sizeX <= Doodle_X_Pos + Doodle_Size));
	if(plat3_color == 3'b100)
		Platform_collision3 = 0; 
	else 
		Platform_collision3 = ((Doodle_Y_Pos + Doodle_Size <= platY3 + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= platY3 - plat_sizeY) && (platX3 + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (platX3 - plat_sizeX <= Doodle_X_Pos + Doodle_Size));
	if(plat4_color == 3'b100)
		Platform_collision4 = 0; 
	else 
		Platform_collision4 = ((Doodle_Y_Pos + Doodle_Size <= platY4 + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= platY4 - plat_sizeY) && (platX4 + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (platX4 - plat_sizeX <= Doodle_X_Pos + Doodle_Size));
	if(plat5_color == 3'b100)
		Platform_collision5 = 0; 
	else 
		Platform_collision5 = ((Doodle_Y_Pos + Doodle_Size <= platY5 + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= platY5 - plat_sizeY) && (platX5 + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (platX5 - plat_sizeX <= Doodle_X_Pos + Doodle_Size));
	if(plat6_color == 3'b100)
		Platform_collision6 = 0; 
	else 
		Platform_collision6 = ((Doodle_Y_Pos + Doodle_Size <= platY6 + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= platY6 - plat_sizeY) && (platX6 + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (platX6 - plat_sizeX <= Doodle_X_Pos + Doodle_Size));
	if(plat7_color == 3'b100)
		Platform_collision7 = 0; 
	else 
		Platform_collision7 = ((Doodle_Y_Pos + Doodle_Size <= platY7 + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= platY7 - plat_sizeY) && (platX7 + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (platX7 - plat_sizeX <= Doodle_X_Pos + Doodle_Size));
	if(plat8_color == 3'b100)
		Platform_collision8 = 0; 
	else 
		Platform_collision8 = ((Doodle_Y_Pos + Doodle_Size <= platY8 + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= platY8 - plat_sizeY) && (platX8 + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (platX8 - plat_sizeX <= Doodle_X_Pos + Doodle_Size));
	if(plat9_color == 3'b100)
		Platform_collision9 = 0; 
	else 
		Platform_collision9 = ((Doodle_Y_Pos + Doodle_Size <= platY9 + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= platY9 - plat_sizeY) && (platX9 + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (platX9 - plat_sizeX <= Doodle_X_Pos + Doodle_Size));
	if(plat10_color == 3'b100)
		Platform_collision10 = 0; 
	else 
		Platform_collision10 = ((Doodle_Y_Pos + Doodle_Size <= platY10  + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= platY10 - plat_sizeY) && (platX10 + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (platX10 - plat_sizeX <= Doodle_X_Pos + Doodle_Size));
	if(plat11_color == 3'b100)
		Platform_collision11 = 0; 
	else 
		Platform_collision11 = ((Doodle_Y_Pos + Doodle_Size <= platY11  + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= platY11 - plat_sizeY) && (platX11 + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (platX11 - plat_sizeX <= Doodle_X_Pos + Doodle_Size));
	if(plat12_color == 3'b100)
		Platform_collision12 = 0; 
	else 
		Platform_collision12 = ((Doodle_Y_Pos + Doodle_Size <= platY12  + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= platY12 - plat_sizeY) && (platX12 + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (platX12 - plat_sizeX <= Doodle_X_Pos + Doodle_Size));
	if(plat13_color == 3'b100)
		Platform_collision13 = 0; 
	else 
		Platform_collision13 = ((Doodle_Y_Pos + Doodle_Size <= platY13  + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= platY13 - plat_sizeY) && (platX13 + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (platX13 - plat_sizeX <= Doodle_X_Pos + Doodle_Size));
	if(plat14_color == 3'b100)
		Platform_collision14 = 0; 
	else 
		Platform_collision14 = ((Doodle_Y_Pos + Doodle_Size <= platY14  + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= platY14 - plat_sizeY) && (platX14 + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (platX14 - plat_sizeX <= Doodle_X_Pos + Doodle_Size));
	if(plat15_color == 3'b100)
		Platform_collision15 = 0; 
	else 
		Platform_collision15 = ((Doodle_Y_Pos + Doodle_Size <= platY15  + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= platY15 - plat_sizeY) && (platX15 + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (platX15 - plat_sizeX <= Doodle_X_Pos + Doodle_Size));
	Platform_collisionE = ((Doodle_Y_Pos + Doodle_Size <= plat_size_easy_Y  + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= plat_size_easy_Y - plat_sizeY) && (plat_size_easy_X + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (plat_size_easy_X - plat_sizeX <= Doodle_X_Pos + Doodle_Size));
	Platform_collisionM = ((Doodle_Y_Pos + Doodle_Size <= plat_size_medium_Y  + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= plat_size_medium_Y - plat_sizeY) && (plat_size_medium_X + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (plat_size_medium_X - plat_sizeX <= Doodle_X_Pos + Doodle_Size));
	Platform_collisionH = ((Doodle_Y_Pos + Doodle_Size <= plat_size_hard_Y  + plat_sizeY) &&(Doodle_Y_Pos + Doodle_Size >= plat_size_hard_Y - plat_sizeY) && (plat_size_hard_X + plat_sizeX >= Doodle_X_Pos - Doodle_Size) && (plat_size_hard_X - plat_sizeX <= Doodle_X_Pos + Doodle_Size));						
	Platform_collision = Platform_collision0 || Platform_collision1 || Platform_collision2 || Platform_collision3 || Platform_collision4 || Platform_collision5 || Platform_collision6 || Platform_collision7 || Platform_collision8 || Platform_collision9 || Platform_collision10 || Platform_collision11 || Platform_collision12 || Platform_collision13 || Platform_collision14 || Platform_collision15 || Platform_collisionE || Platform_collisionM || Platform_collisionH;

end 
logic Spring_collision;
always_comb
begin:Spring_collision_
	Spring_collision = (((Doodle_Y_Pos + Doodle_Size <= springY + springsizeY) && (Doodle_Y_Pos + Doodle_Size >= springY - springsizeY) && (springX + springsizeX >= Doodle_X_Pos - Doodle_Size ) && (springX - springsizeX <= Doodle_X_Pos + Doodle_Size)) ||
	((Doodle_Y_Pos + Doodle_Size <= springY1 + springsizeY) && (Doodle_Y_Pos + Doodle_Size >= springY1 - springsizeY) && (springX1 + springsizeX >= Doodle_X_Pos - Doodle_Size ) && (springX - springsizeX <= Doodle_X_Pos + Doodle_Size)) ||
	((Doodle_Y_Pos + Doodle_Size <= springY2 + springsizeY) && (Doodle_Y_Pos + Doodle_Size >= springY2 - springsizeY) && (springX2 + springsizeX >= Doodle_X_Pos - Doodle_Size ) && (springX - springsizeX <= Doodle_X_Pos + Doodle_Size)) ||
	((Doodle_Y_Pos + Doodle_Size <= springY3 + springsizeY) && (Doodle_Y_Pos + Doodle_Size >= springY3 - springsizeY) && (springX3 + springsizeX >= Doodle_X_Pos - Doodle_Size ) && (springX - springsizeX <= Doodle_X_Pos + Doodle_Size))
	);
end 
logic Rocket_collision;

always_comb 
begin:Rocket_collision_
	Rocket_collision = ((Doodle_Y_Pos + Doodle_Size <= rocketY + rocketsizeY) && (Doodle_Y_Pos + Doodle_Size >= rocketY - rocketsizeY) && (rocketX + rocketsizeX >= Doodle_X_Pos - Doodle_Size ) && (rocketX - rocketsizeX <= Doodle_X_Pos + Doodle_Size));
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
