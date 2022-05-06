module  greenplat16
(
		input [4:0] data_In,
		input [7:0] write_address, read_address,
		input we, Clk,

		output logic [23:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:127];

initial
begin
	 $readmemh("greenplat16.txt", mem); 
end


always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
	data_Out<= mem[read_address];
end

endmodule
