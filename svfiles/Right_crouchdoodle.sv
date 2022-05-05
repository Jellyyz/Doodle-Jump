
module  Doodle_rightC_ram
(
		input [4:0] data_In3,
		input [10:0] write_address3, read_address3,
		input we, Clk,

		output logic [23:0] data_Out3
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("right_crouch32.txt", mem); 
end


always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address3] <= data_In3;
	data_Out3<= mem[read_address3];
end

endmodule
