always_comb
    begin 
        BKG_address = (639 * DrawY) + DrawX;
        BKG_address2 = (639 * DrawY) + DrawX;
        BKG_address3 = (639 * DrawY) + DrawX;
        BKG_on = 4'b1; 
        BKG_on2 = 4'b0;
        BKG_on3 = 4'b0;
        if(DrawY >= 0 && DrawY < shape_size_y && DrawX >= 0 && DrawX < shape_size_x) //Ball_x = 0
            begin
                if(Score >= 12'b001000000000)
                    if(DrawY >= (DoodleY + Doodle_size - doodle_shape_size_y) && DrawY < (DoodleY + Doodle_size) && DrawX >= (DoodleX - (doodle_shape_size_x /2) ) && DrawX < (DoodleX + (doodle_shape_size_x /2)))
                        begin
                            BKG_on3 = 4'b1;
                            BKG_on2 = 4'b0;
                            BKG_on  = 4'b0;
                        end
                    else
                        begin
                            BKG_on3 = 4'b0;
                            BKG_on = 4'b0;
                            BKG_on2 = 4'b1;
                        end

                else
                    if(DrawY >= (DoodleY + Doodle_size - doodle_shape_size_y) && DrawY < (DoodleY + Doodle_size) && DrawX >= (DoodleX - (doodle_shape_size_x /2) ) && DrawX < (DoodleX + (doodle_shape_size_x /2)))
                        begin
                            BKG_on3 = 4'b1;
                            BKG_on2 = 4'b0;
                            BKG_on  = 4'b0;
                        end
                    else
                        begin
                            BKG_on = 4'b1;
                            BKG_on2 = 4'b0;     
                            BKG_on3 = 4'b0;
                        end
               
            end
        else
            begin
            BKG_on = 4'b0; 
            BKG_on2 = 4'b0;
            BKG_on3 = 4'b0;
            end
    end
