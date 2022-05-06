module jumpstate(
    input logic Clock, Reset, trigger, frame_clk,
	input logic [7:0] Keycode,
	input logic refresh_en, 
	input logic game_over_trigger, 
	output logic [2:0] outstate,
	output logic loadplat
);

	enum logic [2:0] { Main_Menu, 
					   Loading,
                       Game,
					   Pause,
					   Refreshing,
					   INIT,
					   Game_Over 
					   
						}   State, Next_state;   // Internal state logic
	always_ff @ (posedge Clock)
	begin
		if (Reset) 
			State <= INIT;
		else 
			State <= Next_state;
	end
counter loaddelay1(
	.Reset(loaddelay_res), 
	.enable(loaddelay_en), 
    .Clk(frame_clk), 

    .out(loaddelay[5:0])
);
logic [5:0] loaddelay; 
logic loaddelay_en;
logic loaddelay_res;
always_comb
begin 
	if(outstate == 3'b001)
	begin 
		loaddelay_en = 1; 
		loaddelay_res = 0;
	end 
	else
	begin 
		loaddelay_res = 1;
		loaddelay_en = 0; 
	end 
end 
    always_comb 
    begin
        // Default next state is staying at current state
		Next_state = State;

        unique case(State)
			Main_Menu: 
				begin
					if(Keycode == 8'd44) // space 
						Next_state = Loading; 
					else 
						Next_state = Main_Menu; 
				end 
			Loading:
				begin 
					if(loaddelay == 6'd60)
						Next_state = Game;
					else 
						Next_state = Loading; 
				end 
			Game:
				begin
					if(Keycode == 8'd41) // esc 
						Next_state = Pause;
					else if(game_over_trigger)
						Next_state = Game_Over;  
					else if(refresh_en)
						Next_state = Refreshing;
					else 
						Next_state = Game; 
				end
			Pause: 
				begin 
					if(Keycode != 9'h0)
						Next_state = Game;
					else 
						Next_state = Pause; 
				end 
			Refreshing:
				begin
					if(trigger)
						Next_state = Game;
					else
						Next_state = Refreshing;
				end
			INIT:
				Next_state = Main_Menu;
			Game_Over:
				 begin
					if(Keycode == 8'd41) // esc 
						Next_state = INIT; 
					else 
						Next_state = Game_Over; 
				end
		
		endcase 
		
		unique case(State)
			INIT:
			begin 
				loadplat = 0; 
				outstate = 3'b101;
			end
			Main_Menu:
			// probably output some main screen menu 
			begin 
				loadplat = 0; 
				outstate = 3'b000; 
			end 
			Loading:
			begin
				loadplat = 1; 
				outstate = 3'b001; 
			end
			Game: 
			// the actual gameplay logic
			begin 
				loadplat = 0; 
				outstate = 3'b010;  
			end 
			Pause:
			// pause screen 
			begin 
				loadplat = 0; 
				outstate = 3'b011;
			end 
			Refreshing:
			// refresh the screen
			begin 
				loadplat = 0; 
				outstate = 3'b100;
			end 
			Game_Over:
			begin 
				loadplat = 0; 
				outstate = 3'b110;
			end 

		endcase 


    end


endmodule 