module countdown(
    input logic Clk, Reset, enable,
    input logic [7:0] seed, 
    output logic done, 
    output logic [7:0] temp
);

always_ff @ (posedge Clk or posedge Reset)
    begin 
        if(Reset)
            begin 
                temp <= seed;
                done <= 0;
            end 
        else 
            begin 
                temp <= temp - 1; 
                if(temp[7:0] == 8'h0)
                    done <= 1; 
            end 
    end 
	 

endmodule