module jumpstate(
    input logic Clock, Reset, trigger,
	input logic [7:0] Keycode,
	input logic refresh_en, 
	output logic [2:0] outstate,
	output logic loadplat
);

	enum logic [2:0] { Main_Menu, 
					   Loading,
                       Game,
					   Pause,
					   Refreshing
					   
						}   State, Next_state;   // Internal state logic
	always_ff @ (posedge Clock)
	begin
		if (Reset) 
			State <= Main_Menu;
		else 
			State <= Next_state;
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
					Next_state = Game;
				end 
			Game:
				begin
					if(Keycode == 8'd41) // esc 
						Next_state = Pause; 
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
		endcase 
		
		unique case(State)

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

		endcase 


    end


endmodule 