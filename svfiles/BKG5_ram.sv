/*
 * ECE385-HelperTools/PNG-To-Txt
 * Author: Rishi Thakkar
 *
 */

module  BKG5_ram
(
		input [4:0] data_In5,
		input [14:0] write_address5, read_address5,
		input we, Clk,

		output logic [23:0] data_Out5
);

// mem has width of 23 bits and a total of 870 addresses
logic [23:0] mem [0:869];

initial
begin
	 $readmemh("doodle_left_resized.txt", mem); 
end


always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address5] <= data_In5;
	data_Out5<= mem[read_address5];
end

endmodule
