module modifiedcounter(
    input Reset, 
    input Clk, 
    output [4:0] outM

);
logic [4:0] out; 

always_ff @ (posedge Clk)begin

    if(Reset)
        out <= 5'b0;
    else 
        outM <= out; 
        if(out == 5'b11111)
            begin 
                outM <= 5'b00000;
            end 
        else   
            out <= out + 1; 
end
endmodule 