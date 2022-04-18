module LFSR(
    input Clk, Reset, 
    input [8:0] seed, 
    output [8:0] outp
); 


logic [8:0] out;
logic input0; 
bit_register bit_register0(
    .Clk(Clk), .Reset(Reset), .D(input0), .Q(out[0])
);
bit_register bit_register1(
    .Clk(Clk), .Reset(Reset), .D(out[0]), .Q(out[1])
);
bit_register bit_register2(
    .Clk(Clk), .Reset(Reset), .D(out[1]), .Q(out[2])
);
bit_register bit_register3(
    .Clk(Clk), .Reset(Reset), .D(out[2]), .Q(out[3])
);
bit_register bit_register4(
    .Clk(Clk), .Reset(Reset), .D(out[3]), .Q(out[4])
);
bit_register bit_register5(
    .Clk(Clk), .Reset(Reset), .D(out[4]), .Q(out[5])
);
bit_register bit_register6(
    .Clk(Clk), .Reset(Reset), .D(out[5]), .Q(out[6])
);
bit_register bit_register7(
    .Clk(Clk), .Reset(Reset), .D(out[6]), .Q(out[7])
);
bit_register bit_register8(
    .Clk(Clk), .Reset(Reset), .D(out[7]), .Q(out[8])
);


always_comb
    begin
        
        outp[8:0] = out[8:0];
        if(outp[8:0] == 9'h1FF)
            input0 = (out[3] ^ out[8]);
        else
            input0 = ~(out[3] ^ out[8]);  

    end 

endmodule 


module bit_register(
    input Clk, Reset, 
    input D, 
    output Q 
); 

always_ff @(posedge Clk)
    begin 
        Q <= D;
    end 

endmodule 