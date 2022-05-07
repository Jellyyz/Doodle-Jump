/*
 * ECE385-HelperTools/PNG-To-Txt
 * Author: Rishi Thakkar
 *
 */

module  BKG2_ram
(
		input [4:0] data_In2,
		input [12:0] write_address2, read_address,
		input we, Clk,

		output logic [23:0] data_Out2
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:7679];

initial
begin
	 $readmemh("soccer-final.txt", mem); 
end


always_ff @ (posedge Clk) begin
if(read_address >= 13'd7680)
	data_Out2<= mem[read_address - 7680];
else 
	data_Out2<= mem[read_address];
end

endmodule
