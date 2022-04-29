module Background_mapper(
            input logic [9:0] DrawX, DrawY,
            input logic clk,
            output logic [7:0] Red, Green, Blue
        
           );

    logic ball_on;
    logic shape_on;
    logic [10:0] shape_x = 10'b0;
    logic [10:0] shape_y = 10'b0;
    logic [10:0] shape_size_x = 10'b1100100;
    logic [10:0] shape_size_y = 10'b1100100;
    logic [20:0] memoryaddress;
    logic        processor_out;

    always_comb
    begin
        memoryaddress = ((DrawX - shape_x) + 640 * (DrawY - shape_y));
    end

    Background_Rom br1(.Clk(clk), .read_address(memoryaddress), .data_Out(processor_out));

    always_comb
    begin: Ball_on_Proc

            shape_on = 1'b0;
            if(DrawX >= shape_y && DrawY < shape_y + shape_size_y && DrawX >= shape_x && DrawX < shape_x + shape_size_x) //Ball_x = shape_x
                begin   
                    shape_on = 1'b1;
                end
    end

    always_latch
    begin
            if (shape_on == 1'b1) 
            begin
                if(processor_out == 1) 
                    begin 
                        Red = 8'hFF;
                        Green = 8'hA5;
                        Blue = 8'h00;
                    end      

                    else 
                    begin
                        Red = 8'hFF;
                        Green = 8'hFF;
                        Blue = 8'hFF;
                    end    
            end

            else
            begin
                ;
            end
    end
endmodule