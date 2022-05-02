/*
 * ECE385-HelperTools/PNG-To-Txt
 * Author: Rishi Thakkar
 *
 */

module  BKG4_ram
(
		input [4:0] data_In4,
		input [14:0] write_address4, read_address,
		input we, Clk,

		output logic [23:0] data_Out4
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:25599];

initial
begin
	 $readmemh("space-background1.txt", mem); 
end


always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address4] <= data_In4;
	data_Out4<= mem[read_address];
end

endmodule
