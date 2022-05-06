/*
 * ECE385-HelperTools/PNG-To-Txt
 * Author: Rishi Thakkar
 *
 */
module  Zero
(
		input [4:0] data_In_zero,
		input [9:0] write_address_zero, read_address_zero,
		input we, Clk,

		output logic [23:0] data_Out_zero
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("zero.txt", mem); 
end


always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address_zero] <= data_In_zero;
	data_Out_zero<= mem[read_address_zero];
end

endmodule

module  One
(
		input [4:0] data_In_one,
		input [9:0] write_address_one, read_address_one,
		input we, Clk,

		output logic [23:0] data_Out_one
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("one.txt", mem); 
end


always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address_one] <= data_In_one;
	data_Out_one<= mem[read_address_one];
end

endmodule

module  Two
(
		input [4:0] data_In_two,
		input [9:0] write_address_two, read_address_two,
		input we, Clk,

		output logic [23:0] data_Out_two
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("two.txt", mem); 
end


always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address_two] <= data_In_two;
	data_Out_two<= mem[read_address_two];
end

endmodule


module  Three
(
		input [4:0] data_In_three,
		input [9:0] write_address_three, read_address_three,
		input we, Clk,

		output logic [23:0] data_Out_three
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("three.txt", mem); 
end


always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address_three] <= data_In_three;
	data_Out_three<= mem[read_address_three];
end

endmodule

module  Four
(
		input [4:0] data_In_four,
		input [9:0] write_address_four, read_address_four,
		input we, Clk,

		output logic [23:0] data_Out_four
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("four.txt", mem); 
end


always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address_four] <= data_In_four;
	data_Out_four<= mem[read_address_four];
end

endmodule

module  Five
(
		input [4:0] data_In_five,
		input [9:0] write_address_five, read_address_five,
		input we, Clk,

		output logic [23:0] data_Out_five
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("five.txt", mem); 
end


always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address_five] <= data_In_five;
	data_Out_five<= mem[read_address_five];
end

endmodule

module  Six
(
		input [4:0] data_In_six,
		input [9:0] write_address_six, read_address_six,
		input we, Clk,

		output logic [23:0] data_Out_six
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("six.txt", mem); 
end


always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address_six] <= data_In_six;
	data_Out_six<= mem[read_address_six];
end

endmodule

module  Seven
(
		input [4:0] data_In_seven,
		input [9:0] write_address_seven, read_address_seven,
		input we, Clk,

		output logic [23:0] data_Out_seven
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("seven.txt", mem); 
end


always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address_seven] <= data_In_seven;
	data_Out_seven<= mem[read_address_seven];
end

endmodule

module  Eight
(
		input [4:0] data_In_eight,
		input [9:0] write_address_eight, read_address_eight,
		input we, Clk,

		output logic [23:0] data_Out_eight
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("eight.txt", mem); 
end


always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address_eight] <= data_In_eight;
	data_Out_eight<= mem[read_address_eight];
end

endmodule

module  Nine
(
		input [4:0] data_In_nine,
		input [9:0] write_address_nine, read_address_nine,
		input we, Clk,

		output logic [23:0] data_Out_nine
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("nine.txt", mem); 
end


always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address_nine] <= data_In_nine;
	data_Out_nine<= mem[read_address_nine];
end

endmodule



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



module  B
(
		input [4:0] data_In_B,
		input [9:0] write_address_B, read_address_B,
		input we, Clk,

		output logic [23:0] data_Out_B
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("B.txt", mem); 
end


always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address_B] <= data_In_B;
	data_Out_B<= mem[read_address_B];
end

endmodule


module  C
(
		input [4:0] data_In,
		input [9:0] write_address, read_address,
		input we, Clk,

		output logic [23:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("C.txt", mem); 
end


always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
	data_Out<= mem[read_address];
end

endmodule

module  D
(
		input [4:0] data_In,
		input [9:0] write_address, read_address,
		input we, Clk,

		output logic [23:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("D.txt", mem); 
end


always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
	data_Out<= mem[read_address];
end

endmodule

module  E
(
		input [4:0] data_In,
		input [9:0] write_address, read_address,
		input we, Clk,

		output logic [23:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("E.txt", mem); 
end


always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
	data_Out<= mem[read_address];
end

endmodule

module  F
(
		input [4:0] data_In,
		input [9:0] write_address, read_address,
		input we, Clk,

		output logic [23:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("F.txt", mem); 
end


always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
	data_Out<= mem[read_address];
end

endmodule



module  G
(
		input [4:0] data_In,
		input [9:0] write_address, read_address,
		input we, Clk,

		output logic [23:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("G.txt", mem); 
end


always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
	data_Out<= mem[read_address];
end

endmodule



module  H
(
		input [4:0] data_In,
		input [9:0] write_address, read_address,
		input we, Clk,

		output logic [23:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("H.txt", mem); 
end


always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
	data_Out<= mem[read_address];
end

endmodule



module  I
(
		input [4:0] data_In,
		input [9:0] write_address, read_address,
		input we, Clk,

		output logic [23:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("I.txt", mem); 
end


always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
	data_Out<= mem[read_address];
end

endmodule



module  J
(
		input [4:0] data_In,
		input [9:0] write_address, read_address,
		input we, Clk,

		output logic [23:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("J.txt", mem); 
end


always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
	data_Out<= mem[read_address];
end

endmodule



module  K
(
		input [4:0] data_In,
		input [9:0] write_address, read_address,
		input we, Clk,

		output logic [23:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("K.txt", mem); 
end


always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
	data_Out<= mem[read_address];
end

endmodule



module  L
(
		input [4:0] data_In,
		input [9:0] write_address, read_address,
		input we, Clk,

		output logic [23:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("L.txt", mem); 
end

always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
	data_Out<= mem[read_address];
end

endmodule




module  M
(
		input [4:0] data_In,
		input [9:0] write_address, read_address,
		input we, Clk,

		output logic [23:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("M.txt", mem); 
end

always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
	data_Out<= mem[read_address];
end

endmodule


module  N
(
		input [4:0] data_In,
		input [9:0] write_address, read_address,
		input we, Clk,

		output logic [23:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("N.txt", mem); 
end

always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
	data_Out<= mem[read_address];
end

endmodule


module  O
(
		input [4:0] data_In,
		input [9:0] write_address, read_address,
		input we, Clk,

		output logic [23:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("O.txt", mem); 
end

always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
	data_Out<= mem[read_address];
end

endmodule


module  P
(
		input [4:0] data_In,
		input [9:0] write_address, read_address,
		input we, Clk,

		output logic [23:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("P.txt", mem); 
end

always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
	data_Out<= mem[read_address];
end

endmodule


module  Q
(
		input [4:0] data_In,
		input [9:0] write_address, read_address,
		input we, Clk,

		output logic [23:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("Q.txt", mem); 
end

always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
	data_Out<= mem[read_address];
end

endmodule


module  R
(
		input [4:0] data_In,
		input [9:0] write_address, read_address,
		input we, Clk,

		output logic [23:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("R.txt", mem); 
end

always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
	data_Out<= mem[read_address];
end

endmodule


module  S
(
		input [4:0] data_In,
		input [9:0] write_address, read_address,
		input we, Clk,

		output logic [23:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("S.txt", mem); 
end

always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
	data_Out<= mem[read_address];
end

endmodule


module  T
(
		input [4:0] data_In,
		input [9:0] write_address, read_address,
		input we, Clk,

		output logic [23:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("T.txt", mem); 
end

always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
	data_Out<= mem[read_address];
end

endmodule


module  U
(
		input [4:0] data_In,
		input [9:0] write_address, read_address,
		input we, Clk,

		output logic [23:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("U.txt", mem); 
end

always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
	data_Out<= mem[read_address];
end

endmodule


module  V
(
		input [4:0] data_In,
		input [9:0] write_address, read_address,
		input we, Clk,

		output logic [23:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("V.txt", mem); 
end

always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
	data_Out<= mem[read_address];
end

endmodule


module  W
(
		input [4:0] data_In,
		input [9:0] write_address, read_address,
		input we, Clk,

		output logic [23:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("W.txt", mem); 
end

always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
	data_Out<= mem[read_address];
end

endmodule


module  X
(
		input [4:0] data_In,
		input [9:0] write_address, read_address,
		input we, Clk,

		output logic [23:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("X.txt", mem); 
end

always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
	data_Out<= mem[read_address];
end

endmodule


module  Y
(
		input [4:0] data_In,
		input [9:0] write_address, read_address,
		input we, Clk,

		output logic [23:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("Y.txt", mem); 
end

always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
	data_Out<= mem[read_address];
end

endmodule


module  Z
(
		input [4:0] data_In,
		input [9:0] write_address, read_address,
		input we, Clk,

		output logic [23:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [23:0] mem [0:1023];

initial
begin
	 $readmemh("Z.txt", mem); 
end

always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
	data_Out<= mem[read_address];
end

endmodule


