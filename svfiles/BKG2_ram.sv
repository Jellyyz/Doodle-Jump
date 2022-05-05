/*
 * ECE385-HelperTools/PNG-To-Txt
 * Author: Rishi Thakkar
 *
 */

module  BKG2_ram
(
		input [4:0] data_In2,
		input [14:0] write_address2, read_address,
		input we, Clk,

		output logic [23:0] data_Out2
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:25599];

initial
begin
	 $readmemh("soccer.txt", mem); 
end


always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address2] <= data_In2;
	data_Out2<= mem[read_address];
end

endmodule
