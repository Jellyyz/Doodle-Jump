module  Doodle_leftC_ram
(
		input [4:0] data_In5,
		input [10:0] write_address5, read_address5,
		input we, Clk,

		output logic [23:0] data_Out5
);

// mem has width of 23 bits and a total of 870 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("left_crouch32.txt", mem); 
end


always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address5] <= data_In5;
	data_Out5<= mem[read_address5];
end

endmodule
