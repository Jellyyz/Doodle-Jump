module  cannon_ram2
(
		input [14:0] write_address, read_address,
		input we, Clk,

		output logic [6:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:63];

initial
begin
	 $readmemh("cannon2.txt", mem); 
end


always_ff @ (posedge Clk) begin
	data_Out<= mem[read_address];
end

endmodule
