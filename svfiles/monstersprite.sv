module  monster_ram
(
		input [4:0] data_In,
		input [8:0] write_address, read_address,
		input we, Clk,

		output logic [23:0] data_Out
);

// mem has width of 23 bits and a total of 870 addresses
logic [23:0] mem [0:255];

initial
begin
	 $readmemh("monster32.txt", mem); 
end


always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
	data_Out<= mem[read_address];
end

endmodule
