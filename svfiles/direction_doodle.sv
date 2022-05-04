module doodle_direction(
    input logic Clock, Reset, frame_clk,
	input logic [7:0] Keycode,
	output logic direction

);


assign direction = State;
	enum logic { left,
                       right 
	
						}   State, Next_state;   // Internal state logic
	always_ff @ (posedge Clock)
	begin
		if (Reset) 
			State <= right;
		else 
			State <= Next_state;
	end

    always_comb 
    begin
        // Default next state is staying at current state
		Next_state = State;

        unique case(State)
            left:
                begin 
                    if((Keycode == 8'd7) || (Keycode == 8'd79))
                        Next_state <= right; 
                    else 
                        Next_state <= left; 
                end 
            right:
                begin 
                    if((Keycode == 8'd4) || (Keycode == 8'd80))
                        Next_state <= left; 
                    else 
                        Next_state <= right; 
                end 
		endcase 


    end


endmodule 