/*
 * ECE385-HelperTools/PNG-To-Txt
 * Author: Rishi Thakkar
 *
 */

module  Background_Rom
(
		
		input [18:0] read_address,
		input Clk,

		output logic data_Out
);

// mem has width of 3 bits and a total of 10000 addresses
logic [2:0] mem [0:9999];

initial
begin
	 $readmemh("./sprites/image2.txt", mem);
end


always_ff @ (posedge Clk) begin
	data_Out<= mem[read_address];
end

endmodule
