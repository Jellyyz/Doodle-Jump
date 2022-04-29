logic [9:0] Score_diff;
output [11:0]Score
Current_Y = 240;
				
				if(Doodle_Y_Pos < Current_Y)
					begin
						Score_diff = (Current_Y - Doodle_Y_Pos);
						Current_Y = Doodle_Y_Pos; 
						Score = Score + Score_diff;
					end
				else
					begin
						;
					end
logic [11:0]Score

HexDriver hex_driver5 (Score[11:8], HEX5[6:0]);
	assign HEX5[7] = 1'b1;

	HexDriver hex_driver4 (Score[7:4], HEX4[6:0]);
	assign HEX4[7] = 1'b1;

    HexDriver hex_driver3 (Score[3:0], HEX3[6:0]); 
	assign HEX3[7] = 1'b1;

.Score(Score[11:0])