module platcolor_on(
input [9:0] DrawX, DrawY, 
input [23:0] greenplat16_out, greenplat32_out, greenplat64_out,
input logic [2:0] difficulty, 
input logic [2:0] plat0_color,
input logic [2:0] plat1_color,
input logic [2:0] plat2_color,
input logic [2:0] plat3_color,
input logic [2:0] plat4_color,
input logic [2:0] plat5_color,
input logic [2:0] plat6_color,
input logic [2:0] plat7_color,
input logic [2:0] plat8_color,
input logic [2:0] plat9_color,
input logic [2:0] plat10_color,
input logic [2:0] plat11_color,
input logic [2:0] plat12_color,
input logic [2:0] plat13_color,
input logic [2:0] plat14_color,
input logic [2:0] plat15_color,
input logic [8:0] platX, platY, plat_sizeX, plat_sizeY,
input logic [8:0] platX1, platY1, platX2, platY2, platX3, platY3, platX4, platY4, 
input logic [8:0] platX5, platY5, platX6, platY6, platX7, platY7, platX8, platY8, 
input logic [8:0] platX9, platY9, platX10, platY10, platX11, platY11, platX12, platY12, 
input logic [8:0] platX13, platY13, platX14, platY14, platX15, platY15,
output greenplat16_on, greenplat32_on, greenplat64_on, blueplat16_on,  blueplat32_on,  blueplat64_on,  yellowplat16_on, yellowplat32_on, yellowplat64_on, whiteplat16_on,  whiteplat32_on,  whiteplat64_on,  brownplat16_on, brownplat32_on, brownplat64_on,
output logic [8:0] temp_platY, temp_platX 
); 
always_comb 
begin 
    if (difficulty == 2'b10)
        begin
            if(DrawX >= (platX - (plat_sizeX)) && DrawX <= (platX + (plat_sizeX)) && DrawY >= (platY - (plat_sizeY)) && DrawY <= (platY + (plat_sizeY)))
                begin
                    temp_platX = platX;  
                    temp_platY = platY; 
                    if(greenplat16_out != 24'hfe43e3)
                        begin
                            unique case (plat0_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 1;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 1; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 1; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 1;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 1;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

            else if(DrawX >= (platX1 - (plat_sizeX)) && DrawX <= (platX1 + (plat_sizeX)) && DrawY >= (platY1 - (plat_sizeY )) && DrawY <= (platY1 + (plat_sizeY )))
                begin
                    temp_platX = platX1;  
                    temp_platY = platY1; 
                    if(greenplat16_out != 24'hfe43e3)
                        begin
                            unique case (plat1_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 1;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 1; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 1; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 1;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 1;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

            else if(DrawX >= (platX2 - (plat_sizeX)) && DrawX <= (platX2 + (plat_sizeX)) && DrawY >= (platY2 - (plat_sizeY )) && DrawY <= (platY2 + (plat_sizeY )))
                begin
                    temp_platX = platX2;  
                    temp_platY = platY2; 
                    if(greenplat16_out != 24'hfe43e3)
                        begin
                            unique case (plat2_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 1;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 1; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 1; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 1;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 1;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

            else if(DrawX >= (platX3 - (plat_sizeX)) && DrawX <= (platX3 + (plat_sizeX)) && DrawY >= (platY3 - (plat_sizeY )) && DrawY <= (platY3 + (plat_sizeY )))
                begin
                    temp_platX = platX3;  
                    temp_platY = platY3; 
                    if(greenplat16_out != 24'hfe43e3)
                        begin
                            unique case (plat3_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 1;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 1; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 1; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 1;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 1;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

            else if(DrawX >= (platX4 - (plat_sizeX)) && DrawX <= (platX4 + (plat_sizeX)) && DrawY >= (platY4 - (plat_sizeY )) && DrawY <= (platY4 + (plat_sizeY )))
                begin
                    temp_platX = platX4;  
                    temp_platY = platY4; 
                    if(greenplat16_out != 24'hfe43e3)
                        begin
                            unique case (plat4_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 1;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 1; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 1; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 1;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 1;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

            else if(DrawX >= (platX5 - (plat_sizeX)) && DrawX <= (platX5 + (plat_sizeX)) && DrawY >= (platY5 - (plat_sizeY )) && DrawY <= (platY5 + (plat_sizeY )))
                begin
                    temp_platX = platX5;  
                    temp_platY = platY5; 
                    if(greenplat16_out != 24'hfe43e3)
                        begin
                            unique case (plat5_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 1;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 1; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 1; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 1;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 1;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

            else if(DrawX >= (platX6 - (plat_sizeX)) && DrawX <= (platX6 + (plat_sizeX)) && DrawY >= (platY6 - (plat_sizeY )) && DrawY <= (platY6 + (plat_sizeY )))
                begin
                    temp_platX = platX6;  
                    temp_platY = platY6; 
                    if(greenplat16_out != 24'hfe43e3)
                        begin
                            unique case (plat6_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 1;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 1; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 1; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 1;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 1;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

            else if(DrawX >= (platX7 - (plat_sizeX)) && DrawX <= (platX7 + (plat_sizeX)) && DrawY >= (platY7 - (plat_sizeY )) && DrawY <= (platY7 + (plat_sizeY )))
                begin
                    temp_platX = platX7; 
                    temp_platY = platY7; 
                    if(greenplat16_out != 24'hfe43e3)
                        begin
                            unique case (plat7_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 1;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 1; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 1; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 1;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 1;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

                else if(DrawX >= (platX8 - (plat_sizeX)) && DrawX <= (platX8 + (plat_sizeX)) && DrawY >= (platY8 - (plat_sizeY )) && DrawY <= (platY8 + (plat_sizeY )))
                begin
                    temp_platX = platX8; 
                    temp_platY = platY8; 
                    if(greenplat16_out != 24'hfe43e3)
                        begin
                            unique case (plat8_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 1;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 1; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 1; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 1;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 1;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

                else if(DrawX >= (platX9 - (plat_sizeX)) && DrawX <= (platX9 + (plat_sizeX)) && DrawY >= (platY9 - (plat_sizeY )) && DrawY <= (platY9 + (plat_sizeY )))
                begin
                    temp_platX = platX9; 
                    temp_platY = platY9; 
                    if(greenplat16_out != 24'hfe43e3)
                        begin
                            unique case (plat9_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 1;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 1; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 1; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 1;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 1;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

                else if(DrawX >= (platX10 - (plat_sizeX)) && DrawX <= (platX10 + (plat_sizeX)) && DrawY >= (platY10 - (plat_sizeY )) && DrawY <= (platY10 + (plat_sizeY )))
                begin
                    temp_platX = platX10; 
                    temp_platY = platY10; 
                    if(greenplat16_out != 24'hfe43e3)
                        begin
                            unique case (plat10_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 1;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 1; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 1; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 1;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 1;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

                else if(DrawX >= (platX11 - (plat_sizeX)) && DrawX <= (platX11 + (plat_sizeX)) && DrawY >= (platY11 - (plat_sizeY )) && DrawY <= (platY11 + (plat_sizeY )))
                begin
                    temp_platX = platX11; 
                    temp_platY = platY11; 
                    if(greenplat16_out != 24'hfe43e3)
                        begin
                            unique case (plat11_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 1;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 1; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 1; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 1;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 1;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

                else if(DrawX >= (platX12 - (plat_sizeX)) && DrawX <= (platX12 + (plat_sizeX)) && DrawY >= (platY12 - (plat_sizeY )) && DrawY <= (platY12 + (plat_sizeY )))
                begin
                    temp_platX = platX12; 
                    temp_platY = platY12; 
                    if(greenplat16_out != 24'hfe43e3)
                        begin
                            unique case (plat12_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 1;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 1; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 1; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 1;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 1;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

                else if(DrawX >= (platX13 - (plat_sizeX)) && DrawX <= (platX13 + (plat_sizeX)) && DrawY >= (platY13 - (plat_sizeY )) && DrawY <= (platY13 + (plat_sizeY )))
                begin
                    temp_platX = platX13; 
                    temp_platY = platY13; 
                    if(greenplat16_out != 24'hfe43e3)
                        begin
                            unique case (plat13_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 1;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 1; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 1; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 1;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 1;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

                else if(DrawX >= (platX14 - (plat_sizeX)) && DrawX <= (platX14 + (plat_sizeX)) && DrawY >= (platY14 - (plat_sizeY )) && DrawY <= (platY14 + (plat_sizeY )))
                begin
                    temp_platX = platX14; 
                    temp_platY = platY14; 
                    if(greenplat16_out != 24'hfe43e3)
                        begin
                            unique case (plat14_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 1;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 1; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 1; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 1;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 1;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

                else if(DrawX >= (platX15 - (plat_sizeX)) && DrawX <= (platX15 + (plat_sizeX)) && DrawY >= (platY15 - (plat_sizeY )) && DrawY <= (platY15 + (plat_sizeY )))
                begin
                    temp_platX = platX15; 
                    temp_platY = platY15; 
                    if(greenplat16_out != 24'hfe43e3)
                        begin
                            unique case (plat15_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 1;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 1; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 1; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 1;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 1;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end
                else 
                    begin
                        temp_platX = platX1; 
                        temp_platY = platY; 
                        greenplat16_on = 0;
                        greenplat32_on = 0;
                        greenplat64_on = 0;
                        blueplat16_on = 0; 
                        blueplat32_on = 0; 
                        blueplat64_on = 0; 
                        yellowplat16_on = 0;
                        yellowplat32_on = 0;
                        yellowplat64_on = 0;
                        whiteplat16_on = 0; 
                        whiteplat32_on = 0; 
                        whiteplat64_on = 0; 
                        brownplat16_on = 0;
                        brownplat32_on = 0;
                        brownplat64_on = 0;
                    end 
        end 
        else if (difficulty == 2'b01)
            begin
            if(DrawX >= (platX - (plat_sizeX)) && DrawX <= (platX + (plat_sizeX)) && DrawY >= (platY - (plat_sizeY )) && DrawY <= (platY + (plat_sizeY )))
                begin
                    temp_platX = platX; 
                    temp_platY = platY; 
                    if(greenplat32_out != 24'hfe43e3)
                    begin
                        unique case (plat0_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 1;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 1; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 1; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 1;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 1;
                                    brownplat64_on = 0;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

            else if(DrawX >= (platX1 - (plat_sizeX)) && DrawX <= (platX1 + (plat_sizeX)) && DrawY >= (platY1 - (plat_sizeY )) && DrawY <= (platY1 + (plat_sizeY )))
                begin
                    temp_platX = platX1; 
                    temp_platY = platY1; 
                    if(greenplat32_out != 24'hfe43e3)
                        begin
                        unique case (plat1_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 1;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 1; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 1; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 1;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 1;
                                    brownplat64_on = 0;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

            else if(DrawX >= (platX2 - (plat_sizeX)) && DrawX <= (platX2 + (plat_sizeX)) && DrawY >= (platY2 - (plat_sizeY )) && DrawY <= (platY2 + (plat_sizeY )))
                begin
                    temp_platX = platX2; 
                    temp_platY = platY2; 
                    if(greenplat32_out != 24'hfe43e3)
                    begin
                        unique case (plat2_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 1;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 1; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 1; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 1;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 1;
                                    brownplat64_on = 0;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

            else if(DrawX >= (platX3 - (plat_sizeX)) && DrawX <= (platX3 + (plat_sizeX)) && DrawY >= (platY3 - (plat_sizeY )) && DrawY <= (platY3 + (plat_sizeY )))
                begin
                    temp_platX = platX3; 
                    temp_platY = platY3; 
                    if(greenplat32_out != 24'hfe43e3)
                    begin
                        unique case (plat3_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 1;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 1; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 1; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 1;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 1;
                                    brownplat64_on = 0;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

            else if(DrawX >= (platX4 - (plat_sizeX)) && DrawX <= (platX4 + (plat_sizeX)) && DrawY >= (platY4 - (plat_sizeY )) && DrawY <= (platY4 + (plat_sizeY )))
                begin
                    temp_platX = platX4; 
                    temp_platY = platY4; 
                    if(greenplat32_out != 24'hfe43e3)
                    begin
                        unique case (plat4_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 1;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 1; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 1; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 1;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 1;
                                    brownplat64_on = 0;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

            else if(DrawX >= (platX5 - (plat_sizeX)) && DrawX <= (platX5 + (plat_sizeX)) && DrawY >= (platY5 - (plat_sizeY )) && DrawY <= (platY5 + (plat_sizeY )))
                begin
                    temp_platX = platX5; 
                    temp_platY = platY5; 
                    if(greenplat32_out != 24'hfe43e3)
                    begin
                        unique case (plat5_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 1;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 1; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 1; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 1;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 1;
                                    brownplat64_on = 0;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

            else if(DrawX >= (platX6 - (plat_sizeX)) && DrawX <= (platX6 + (plat_sizeX)) && DrawY >= (platY6 - (plat_sizeY )) && DrawY <= (platY6 + (plat_sizeY )))
                begin
                    temp_platX = platX6; 
                    temp_platY = platY6; 
                    if(greenplat32_out != 24'hfe43e3)
                    begin
                        unique case (plat6_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 1;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 1; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 1; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 1;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 1;
                                    brownplat64_on = 0;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

            else if(DrawX >= (platX7 - (plat_sizeX)) && DrawX <= (platX7 + (plat_sizeX)) && DrawY >= (platY7 - (plat_sizeY )) && DrawY <= (platY7 + (plat_sizeY )))
                begin
                    temp_platX = platX7; 
                    temp_platY = platY7; 
                    if(greenplat32_out != 24'hfe43e3)
                    begin
                        unique case (plat7_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 1;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 1; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 1; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 1;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 1;
                                    brownplat64_on = 0;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

                else if(DrawX >= (platX8 - (plat_sizeX)) && DrawX <= (platX8 + (plat_sizeX)) && DrawY >= (platY8 - (plat_sizeY )) && DrawY <= (platY8 + (plat_sizeY )))
                begin
                    temp_platX = platX8; 
                    temp_platY = platY8; 
                    if(greenplat32_out != 24'hfe43e3)
                    begin
                        unique case (plat8_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 1;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 1; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 1; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 1;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 1;
                                    brownplat64_on = 0;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

                else if(DrawX >= (platX9 - (plat_sizeX)) && DrawX <= (platX9 + (plat_sizeX)) && DrawY >= (platY9 - (plat_sizeY )) && DrawY <= (platY9 + (plat_sizeY )))
                begin
                    temp_platX = platX9; 
                    temp_platY = platY9; 
                    if(greenplat32_out != 24'hfe43e3)
                    begin
                        unique case (plat9_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 1;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 1; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 1; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 1;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 1;
                                    brownplat64_on = 0;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

                else if(DrawX >= (platX10 - (plat_sizeX)) && DrawX <= (platX10 + (plat_sizeX)) && DrawY >= (platY10 - (plat_sizeY )) && DrawY <= (platY10 + (plat_sizeY )))
                begin
                    temp_platX = platX10; 
                    temp_platY = platY10; 
                    if(greenplat32_out != 24'hfe43e3)
                    begin
                        unique case (plat1_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 1;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 1; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 1; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 1;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 1;
                                    brownplat64_on = 0;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

                else if(DrawX >= (platX11 - (plat_sizeX)) && DrawX <= (platX11 + (plat_sizeX)) && DrawY >= (platY11 - (plat_sizeY )) && DrawY <= (platY11 + (plat_sizeY )))
                begin
                    temp_platX = platX11; 
                    temp_platY = platY11; 
                    if(greenplat32_out != 24'hfe43e3)
                    begin
                        unique case (plat11_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 1;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 1; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 1; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 1;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 1;
                                    brownplat64_on = 0;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

                else if(DrawX >= (platX12 - (plat_sizeX)) && DrawX <= (platX12 + (plat_sizeX)) && DrawY >= (platY12 - (plat_sizeY )) && DrawY <= (platY12 + (plat_sizeY )))
                begin
                    temp_platX = platX12; 
                    temp_platY = platY12; 
                    if(greenplat32_out != 24'hfe43e3)
                    begin
                        unique case (plat12_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 1;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 1; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 1; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 1;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 1;
                                    brownplat64_on = 0;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end
                else if(DrawX >= (platX13 - (plat_sizeX)) && DrawX <= (platX13 + (plat_sizeX)) && DrawY >= (platY13 - (plat_sizeY )) && DrawY <= (platY13 + (plat_sizeY )))
                begin
                    temp_platX = platX13; 
                    temp_platY = platY13; 
                    if(greenplat32_out != 24'hfe43e3)
                    begin
                        unique case (plat13_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 1;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 1; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 1; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 1;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 1;
                                    brownplat64_on = 0;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

                else if(DrawX >= (platX14 - (plat_sizeX)) && DrawX <= (platX14 + (plat_sizeX)) && DrawY >= (platY14 - (plat_sizeY )) && DrawY <= (platY14 + (plat_sizeY )))
                begin
                    temp_platX = platX14; 
                    temp_platY = platY14; 
                    if(greenplat32_out != 24'hfe43e3)
                    begin
                        unique case (plat14_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 1;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 1; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 1; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 1;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 1;
                                    brownplat64_on = 0;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

                else if(DrawX >= (platX15 - (plat_sizeX)) && DrawX <= (platX15 + (plat_sizeX)) && DrawY >= (platY15 - (plat_sizeY )) && DrawY <= (platY15 + (plat_sizeY )))
                begin
                    temp_platX = platX15; 
                    temp_platY = platY15; 
                    if(greenplat32_out != 24'hfe43e3)
                    begin
                        unique case (plat15_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 1;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 1; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 1; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 1;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 1;
                                    brownplat64_on = 0;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

                else 
                    begin
                        temp_platX = platX1; 
                        temp_platY = platY; 
                        greenplat16_on = 0;
                        greenplat32_on = 0;
                        greenplat64_on = 0;
                        blueplat16_on = 0; 
                        blueplat32_on = 0; 
                        blueplat64_on = 0; 
                        yellowplat16_on = 0;
                        yellowplat32_on = 0;
                        yellowplat64_on = 0;
                        whiteplat16_on = 0; 
                        whiteplat32_on = 0; 
                        whiteplat64_on = 0; 
                        brownplat16_on = 0;
                        brownplat32_on = 0;
                        brownplat64_on = 0;
                    end
        end 

        else if (difficulty == 2'b00)
            begin
            if(DrawX >= (platX - (plat_sizeX)) && DrawX <= (platX + (plat_sizeX)) && DrawY >= (platY - (plat_sizeY )) && DrawY <= (platY + (plat_sizeY )))
                begin
                    temp_platX = platX;  
                    temp_platY = platY; 
                    if(greenplat64_out != 24'hfe43e3)
                        begin
                            unique case (plat0_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 1;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 1; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 1; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 1;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 1;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

            else if(DrawX >= (platX1 - (plat_sizeX)) && DrawX <= (platX1 + (plat_sizeX)) && DrawY >= (platY1 - (plat_sizeY )) && DrawY <= (platY1 + (plat_sizeY )))
                begin
                    temp_platX = platX1; 
                    temp_platY = platY1; 
                    if(greenplat64_out != 24'hfe43e3)
                        begin
                            unique case (plat1_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 1;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 1; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 1; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 1;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 1;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

            else if(DrawX >= (platX2 - (plat_sizeX)) && DrawX <= (platX2 + (plat_sizeX)) && DrawY >= (platY2 - (plat_sizeY )) && DrawY <= (platY2 + (plat_sizeY )))
                begin
                    temp_platX = platX2; 
                    temp_platY = platY2; 
                    if(greenplat64_out != 24'hfe43e3)
                        begin
                            unique case (plat2_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 1;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 1; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 1; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 1;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 1;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

            else if(DrawX >= (platX3 - (plat_sizeX)) && DrawX <= (platX3 + (plat_sizeX)) && DrawY >= (platY3 - (plat_sizeY )) && DrawY <= (platY3 + (plat_sizeY )))
                begin
                    temp_platX = platX3; 
                    temp_platY = platY3; 
                    if(greenplat64_out != 24'hfe43e3)
                        begin
                            unique case (plat3_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 1;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 1; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 1; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 1;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 1;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

            else if(DrawX >= (platX4 - (plat_sizeX)) && DrawX <= (platX4 + (plat_sizeX)) && DrawY >= (platY4 - (plat_sizeY )) && DrawY <= (platY4 + (plat_sizeY )))
                begin
                    temp_platX = platX4; 
                    temp_platY = platY4; 
                    if(greenplat64_out != 24'hfe43e3)
                        begin
                            unique case (plat4_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 1;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 1; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 1; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 1;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 1;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

            else if(DrawX >= (platX5 - (plat_sizeX)) && DrawX <= (platX5 + (plat_sizeX)) && DrawY >= (platY5 - (plat_sizeY )) && DrawY <= (platY5 + (plat_sizeY )))
                begin
                    temp_platX = platX5; 
                    temp_platY = platY5; 
                    if(greenplat64_out != 24'hfe43e3)
                        begin
                            unique case (plat5_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 1;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 1; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 1; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 1;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 1;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

            else if(DrawX >= (platX6 - (plat_sizeX)) && DrawX <= (platX6 + (plat_sizeX)) && DrawY >= (platY6 - (plat_sizeY )) && DrawY <= (platY6 + (plat_sizeY )))
                begin
                    temp_platX = platX6; 
                    temp_platY = platY6; 
                    if(greenplat64_out != 24'hfe43e3)
                        begin
                            unique case (plat6_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 1;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 1; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 1; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 1;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 1;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

            else if(DrawX >= (platX7 - (plat_sizeX)) && DrawX <= (platX7 + (plat_sizeX)) && DrawY >= (platY7 - (plat_sizeY )) && DrawY <= (platY7 + (plat_sizeY )))
                begin
                    temp_platX = platX7; 
                    temp_platY = platY7; 
                    if(greenplat64_out != 24'hfe43e3)
                        begin
                            unique case (plat7_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 1;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 1; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 1; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 1;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 1;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

                else if(DrawX >= (platX8 - (plat_sizeX)) && DrawX <= (platX8 + (plat_sizeX)) && DrawY >= (platY8 - (plat_sizeY )) && DrawY <= (platY8 + (plat_sizeY )))
                begin
                    temp_platX = platX8; 
                    temp_platY = platY8; 
                    if(greenplat64_out != 24'hfe43e3)
                        begin
                            unique case (plat8_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 1;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 1; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 1; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 1;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 1;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

                else if(DrawX >= (platX9 - (plat_sizeX)) && DrawX <= (platX9 + (plat_sizeX)) && DrawY >= (platY9 - (plat_sizeY )) && DrawY <= (platY9 + (plat_sizeY )))
                begin
                    temp_platX = platX9; 
                    temp_platY = platY9; 
                    if(greenplat64_out != 24'hfe43e3)
                        begin
                            unique case (plat9_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 1;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 1; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 1; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 1;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 1;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

                else if(DrawX >= (platX10 - (plat_sizeX)) && DrawX <= (platX10 + (plat_sizeX)) && DrawY >= (platY10 - (plat_sizeY )) && DrawY <= (platY10 + (plat_sizeY )))
                begin
                    temp_platX = platX10; 
                    temp_platY = platY10; 
                    if(greenplat64_out != 24'hfe43e3)
                        begin
                            unique case (plat10_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 1;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 1; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 1; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 1;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 1;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

                else if(DrawX >= (platX11 - (plat_sizeX)) && DrawX <= (platX11 + (plat_sizeX)) && DrawY >= (platY11 - (plat_sizeY )) && DrawY <= (platY11 + (plat_sizeY )))
                begin
                    temp_platX = platX11; 
                    temp_platY = platY11; 
                    if(greenplat64_out != 24'hfe43e3)
                        begin
                            unique case (plat11_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 1;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 1; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 1; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 1;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 1;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

                else if(DrawX >= (platX12 - (plat_sizeX)) && DrawX <= (platX12 + (plat_sizeX)) && DrawY >= (platY12 - (plat_sizeY )) && DrawY <= (platY12 + (plat_sizeY )))
                begin
                    temp_platX = platX12; 
                    temp_platY = platY12; 
                    if(greenplat64_out != 24'hfe43e3)
                        begin
                            unique case (plat12_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 1;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 1; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 1; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 1;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 1;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

                else if(DrawX >= (platX13 - (plat_sizeX)) && DrawX <= (platX13 + (plat_sizeX)) && DrawY >= (platY13 - (plat_sizeY )) && DrawY <= (platY13 + (plat_sizeY )))
                begin
                    temp_platX = platX13; 
                    temp_platY = platY13; 
                    if(greenplat64_out != 24'hfe43e3)
                        begin
                            unique case (plat13_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 1;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 1; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 1; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 1;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 1;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

                else if(DrawX >= (platX14 - (plat_sizeX)) && DrawX <= (platX14 + (plat_sizeX)) && DrawY >= (platY14 - (plat_sizeY )) && DrawY <= (platY14 + (plat_sizeY )))
                begin
                    temp_platX = platX14; 
                    temp_platY = platY14; 
                    if(greenplat64_out != 24'hfe43e3)
                        begin
                            unique case (plat14_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 1;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 1; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 1; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 1;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 1;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

                else if(DrawX >= (platX15 - (plat_sizeX)) && DrawX <= (platX15 + (plat_sizeX)) && DrawY >= (platY15 - (plat_sizeY )) && DrawY <= (platY15 + (plat_sizeY )))
                begin
                    temp_platX = platX15; 
                    temp_platY = platY15; 
                    if(greenplat64_out != 24'hfe43e3)
                        begin
                            unique case (plat15_color)
                                3'b000:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 1;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b001:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 1; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b010:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 1; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b011:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 1;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 0;
                                end 
                                3'b100:
                                begin  
                                    greenplat16_on = 0;
                                    greenplat32_on = 0;
                                    greenplat64_on = 0;
                                    blueplat16_on = 0; 
                                    blueplat32_on = 0; 
                                    blueplat64_on = 0; 
                                    yellowplat16_on = 0;
                                    yellowplat32_on = 0;
                                    yellowplat64_on = 0;
                                    whiteplat16_on = 0; 
                                    whiteplat32_on = 0; 
                                    whiteplat64_on = 0; 
                                    brownplat16_on = 0;
                                    brownplat32_on = 0;
                                    brownplat64_on = 1;
                                end 
                            endcase   
                        end
                    else
                        begin  
                            greenplat16_on = 0;
                            greenplat32_on = 0;
                            greenplat64_on = 0;
                            blueplat16_on = 0; 
                            blueplat32_on = 0; 
                            blueplat64_on = 0; 
                            yellowplat16_on = 0;
                            yellowplat32_on = 0;
                            yellowplat64_on = 0;
                            whiteplat16_on = 0; 
                            whiteplat32_on = 0; 
                            whiteplat64_on = 0; 
                            brownplat16_on = 0;
                            brownplat32_on = 0;
                            brownplat64_on = 0;
                        end 
                end

                else 
                    begin
                        temp_platX = platX1; 
                        temp_platY = platY; 
                        greenplat16_on = 0;
                        greenplat32_on = 0;
                        greenplat64_on = 0;
                        blueplat16_on = 0; 
                        blueplat32_on = 0; 
                        blueplat64_on = 0; 
                        yellowplat16_on = 0;
                        yellowplat32_on = 0;
                        yellowplat64_on = 0;
                        whiteplat16_on = 0; 
                        whiteplat32_on = 0; 
                        whiteplat64_on = 0; 
                        brownplat16_on = 0;
                        brownplat32_on = 0;
                        brownplat64_on = 0;
                    end
        end 

        else 
            begin
                temp_platX = platX1; 
                temp_platY = platY; 
                greenplat16_on = 0;
                greenplat32_on = 0;
                greenplat64_on = 0;
                blueplat16_on = 0; 
                blueplat32_on = 0; 
                blueplat64_on = 0; 
                yellowplat16_on = 0;
                yellowplat32_on = 0;
                yellowplat64_on = 0;
                whiteplat16_on = 0; 
                whiteplat32_on = 0; 
                whiteplat64_on = 0; 
                brownplat16_on = 0;
                brownplat32_on = 0;
                brownplat64_on = 0;
            end
    end


endmodule 