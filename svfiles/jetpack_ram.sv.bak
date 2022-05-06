module  jetpack_ram
(
		input [4:0] data_In,
		input [8:0] write_address, read_address,
		input we, Clk,

		output logic [23:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:255];

initial
begin
	 $readmemh("jetpack.txt", mem); 
end


always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address3] <= data_In3;
	data_Out3<= mem[read_address3];
end

endmodule
