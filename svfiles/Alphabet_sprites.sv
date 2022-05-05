/*
 * ECE385-HelperTools/PNG-To-Txt
 * Author: Rishi Thakkar
 *
 */

module  A
(
		input [4:0] data_In_A,
		input [9:0] write_address_A, read_address_A,
		input we, Clk,

		output logic [23:0] data_Out_A
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("A.txt", mem); 
end


always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address_A] <= data_In_A;
	data_Out_A<= mem[read_address_A];
end

endmodule
