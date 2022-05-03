module plat_type(
    input logic Clk, Reset, 
    input logic [2:0] type_trigger, 
    output logic [2:0] plat_color
);
assign plat_color= State; 
	enum logic [2:0] { Green,  // 000
                       White,  // 001
					   Blue,   // 010
                       Yellow, // 011
                       Brown   // 100
					   
						}   State, Next_state;   // Internal state logic
	always_ff @ (posedge Clk)
	begin
		if (Reset) 
			State <= Green;
		else 
			State <= Next_state;
	end

    always_comb 
    begin
        // Default next state is staying at current state
		Next_state = State;

        unique case(State)
            Green:
                begin 
                    unique case(type_trigger) 
                        3'b000:
                            Next_state = Green;
                        3'b001:
                            Next_state = White; 
                        3'b010:
                            Next_state = Blue;
                        3'b011: 
                            Next_state = Yellow;
                        3'b100:
                            Next_state = Brown; 
                    endcase
                end 
            White:
                begin 
                    unique case(type_trigger) 
                        3'b000:
                            Next_state = Green;
                        3'b001:
                            Next_state = White; 
                        3'b010:
                            Next_state = Blue;
                        3'b011: 
                            Next_state = Yellow;
                        3'b100:
                            Next_state = Brown; 
                    endcase
                end
            Blue:
                begin 
                    unique case(type_trigger) 
                        3'b000:
                            Next_state = Green;
                        3'b001:
                            Next_state = White; 
                        3'b010:
                            Next_state = Blue;
                        3'b011: 
                            Next_state = Yellow;
                        3'b100:
                            Next_state = Brown; 
                    endcase
                end
            Yellow:
                begin 
                    unique case(type_trigger) 
                        3'b000:
                            Next_state = Green;
                        3'b001:
                            Next_state = White; 
                        3'b010:
                            Next_state = Blue;
                        3'b011: 
                            Next_state = Yellow;
                        3'b100:
                            Next_state = Brown; 
                    endcase
                end
            Brown: 
                begin 
                    unique case(type_trigger) 
                        3'b000:
                            Next_state = Green;
                        3'b001:
                            Next_state = White; 
                        3'b010:
                            Next_state = Blue;
                        3'b011: 
                            Next_state = Yellow;
                        3'b100:
                            Next_state = Brown; 
                    endcase
                end
		endcase 
		
		unique case(State)
				3'b000:
					;
				3'b001:
					;
				3'b010:
					;
                3'b011:
                    ;
                3'b100:
                    ;
		endcase 

    end


endmodule 