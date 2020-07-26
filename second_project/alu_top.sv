module alu_top;

    reg signed [15:0]x_reg,y_reg;
    reg zx_reg, nx_reg, zy_reg, ny_reg, f_reg, no_reg;

    wire signed [15:0]out_w;
    wire zr_w, ng_w;

    alu inst1 (.x(x_reg),.y(y_reg),.zx(zx_reg),.nx(nx_reg),.zy(zy_reg),.ny(ny_reg),.f(f_reg),.no(no_reg),.out(out_w),.zr(zr_w),.ng(ng_w));

    initial begin
        x_reg <= 16'd5;  // 0  // 1 0 1 0 1 0
        y_reg <= 16'd6;
      
      
        zx_reg <= 1;
        nx_reg <= 0;
        zy_reg <= 1;
        ny_reg <= 0;
        f_reg <= 1;
        no_reg <= 0;
        #10;    
        if (out_w == 0 && zr_w == 1 && ng_w == 0) begin
            $display ("INFO: (1) is correct.");
        end else begin
            $display ("ERROR: (1) is incorrect.");
        end

        //x_reg <= 0;  // 1 // 1 1 1 1 1 1
        //y_reg <= 0;
        zx_reg <= 1;
        nx_reg <= 1;
        zy_reg <= 1;
        ny_reg <= 1;
        f_reg <= 1;
        no_reg <= 1;
        #10;
        if (out_w == 1 && zr_w == 0 && ng_w == 0) begin
            $display ("INFO: (2) is correct.");
        end else begin
            $display ("ERROR: (2) is incorrect. Expecting 1,0,0 recieved %d, %d, %d", out_w, zr_w, ng_w);
        end
  
        //x_reg <= 0;  // -1 // 1 1 1 0 1 0
        //y_reg <= 0;
        zx_reg <= 1;
        nx_reg <= 1;
        zy_reg <= 1;
        ny_reg <= 0;
        f_reg <= 1;
        no_reg <= 0;
        #10;
        if (out_w == (-1) && zr_w == 0 && ng_w == 1) begin
            $display ("INFO: (3) is correct.");
        end else begin
            $display ("ERROR: (3) is incorrect.Expecting -1,0,1 recieved %d, %d, %d", out_w, zr_w, ng_w);
        end
    
        
        //x_reg <= 0;  // x // 0 0 1 1 0 0
        //y_reg <= 0;
        zx_reg <= 0;
        nx_reg <= 0;
        zy_reg <= 1;
        ny_reg <= 1;
        f_reg <= 0;
        no_reg <= 0;
        #10;
        if (out_w == x_reg  && zr_w == 0 && ng_w == 0) begin
            $display ("INFO: (4) is correct.");
        end else begin
            $display ("ERROR: (4) is incorrect. Expecting 5,0,0 recieved %d, %d, %d", out_w, zr_w, ng_w);
        end

        
        //x_reg <= 0;  // y  // 1 1 0 0 0 0
        //y_reg <= 0;
        zx_reg <= 1;
        nx_reg <= 1;
        zy_reg <= 0;
        ny_reg <= 0;
        f_reg <= 0;
        no_reg <= 0;
        #10; 
        if (out_w == y_reg  && zr_w == 0 && ng_w == 0) begin
            $display ("INFO: (5) is correct.");
        end else begin
            $display ("ERROR: (5) is incorrect. Expecting 6,0,0 recieved %d, %d, %d", out_w, zr_w, ng_w);
        end
   
        
        //x_reg <= 0;  // !x // 0 0 1 1 0 1
        //y_reg <= 0;
        zx_reg <= 0;
        nx_reg <= 0;
        zy_reg <= 1;
        ny_reg <= 1;
        f_reg <= 0;
        no_reg <= 1;
        #10; 
        if (out_w == (~x_reg)  && zr_w == 0 && ng_w == 1) begin
            $display ("INFO: (6) is correct.");
        end else begin
            $display ("ERROR: (6) is incorrect.");
        end


        //x_reg <= 0;  // !y // 1 1 0 0 0 1
        //y_reg <= 0;
        zx_reg <= 1;
        nx_reg <= 1;
        zy_reg <= 0;
        ny_reg <= 0;
        f_reg <= 0;
        no_reg <= 1;
        #10; 
        if (out_w == (~y_reg)  && zr_w == 0 && ng_w == 1) begin
            $display ("INFO: (7) is correct.");
        end else begin
            $display ("ERROR: (7) is incorrect.");
        end
           
        
        //x_reg <= 0;  // -x // 0 0 1 1 1 1
        //y_reg <= 0;
        zx_reg <= 0;
        nx_reg <= 0;
        zy_reg <= 1;
        ny_reg <= 1;
        f_reg <= 1;
        no_reg <= 1;
        #10;
        if (out_w == (0-x_reg)  && zr_w == 0 && ng_w == 1) begin
            $display ("INFO: (8) is correct.");
        end else begin
            $display ("ERROR: (8) is incorrect.");
        end
         
        
        //x_reg <= 0;  // -y // 1 1 0 0 1 1
        //y_reg <= 0;
        zx_reg <= 1;
        nx_reg <= 1;
        zy_reg <= 0;
        ny_reg <= 0;
        f_reg <= 1;
        no_reg <= 1;
        #10;
        if (out_w == (0-y_reg)  && zr_w == 0 && ng_w == 1) begin
            $display ("INFO: (9) is correct.");
        end else begin
            $display ("ERROR: (9) is incorrect.");
        end
            
        
        //x_reg <= 0;  // x+1 // 0 1 1 1 1 1
        //y_reg <= 0;
        zx_reg <= 0;
        nx_reg <= 1;
        zy_reg <= 1;
        ny_reg <= 1;
        f_reg <= 1;
        no_reg <= 1;
        #10;
        if (out_w == (x_reg+1)  && zr_w == 0 && ng_w == 0) begin
            $display ("INFO: (10) is correct.");
        end else begin
            $display ("ERROR: (10) is incorrect.");
        end
         

        //x_reg <= 0;  // y+1 // 1 1 0 1 1 1
        //y_reg <= 0;
        zx_reg <= 1;
        nx_reg <= 1;
        zy_reg <= 0;
        ny_reg <= 1;
        f_reg <= 1;
        no_reg <= 1;
        #10;
        if (out_w == (y_reg+1)  && zr_w == 0 && ng_w == 0) begin
            $display ("INFO: (11) is correct.");
        end else begin
            $display ("ERROR: (11) is incorrect.");
        end
            
        
        //x_reg <= 0;  // x-1 // 0 0 1 1 1 0
        //y_reg <= 0;
        zx_reg <= 0;
        nx_reg <= 0;
        zy_reg <= 1;
        ny_reg <= 1;
        f_reg <= 1;
        no_reg <= 0;
        #10;
        if (out_w == (x_reg-1)  && zr_w == 0 && ng_w == 0) begin
            $display ("INFO: (12) is correct.");
        end else begin
            $display ("ERROR: (12) is incorrect.");
        end
         

        //x_reg <= 0;  // y-1 // 1 1 0 0 1 0
        //y_reg <= 0;
        zx_reg <= 1;
        nx_reg <= 1;
        zy_reg <= 0;
        ny_reg <= 0;
        f_reg <= 1;
        no_reg <= 0;
        #10;
        if (out_w == (y_reg-1)  && zr_w == 0 && ng_w == 0) begin
            $display ("INFO: (13) is correct.");
        end else begin
            $display ("ERROR: (13) is incorrect.");
        end
            
        
        //x_reg <= 0;  // x+y // 0 0 0 0 1 0
        //y_reg <= 0;
        zx_reg <= 0;
        nx_reg <= 0;
        zy_reg <= 0;
        ny_reg <= 0;
        f_reg <= 1;
        no_reg <= 0;
        #10;
        if (out_w == (x_reg+y_reg)  && zr_w == 0 && ng_w == 0) begin
            $display ("INFO: (14) is correct.");
        end else begin
            $display ("ERROR: (14) is incorrect.");
        end
         

        //x_reg <= 0;  // x-y // 0 1 0 0 1 1
        //y_reg <= 0;
        zx_reg <= 0;
        nx_reg <= 1;
        zy_reg <= 0;
        ny_reg <= 0;
        f_reg <= 1;
        no_reg <= 1;
        #10;
        if (out_w == (x_reg-y_reg)  && zr_w == 0 && ng_w == 1) begin
            $display ("INFO: (15) is correct.");
        end else begin
            $display ("ERROR: (15) is incorrect.");
        end
            
        
        //x_reg <= 0;  // y-x // 0 0 0 1 1 1
        //y_reg <= 0;
        zx_reg <= 0;
        nx_reg <= 0;
        zy_reg <= 0;
        ny_reg <= 1;
        f_reg <= 1;
        no_reg <= 1;
        #10;
        if (out_w == (y_reg-x_reg)  && zr_w == 0 && ng_w == 0) begin
            $display ("INFO: (16) is correct.");
        end else begin
            $display ("ERROR: (16) is incorrect.");
        end
         
      
        //x_reg <= 0;  // x and y // 0 0 0 0 0 0
        //y_reg <= 0;
        zx_reg <= 0;
        nx_reg <= 0;
        zy_reg <= 0;
        ny_reg <= 0;
        f_reg <= 0;
        no_reg <= 0;
        #10;
        if (out_w == (x_reg & y_reg)  && zr_w == 0 && ng_w == 0) begin
            $display ("INFO: (17) is correct.");
        end else begin
            $display ("ERROR: (17) is incorrect.");
        end
            
        
        //x_reg <= 0;  // x or y // 0 1 0 1 0 1
        //y_reg <= 0;
        zx_reg <= 0;
        nx_reg <= 1;
        zy_reg <= 0;
        ny_reg <= 1;
        f_reg <= 0;
        no_reg <= 1;
        #10;
        if (out_w == (x_reg | y_reg)  && zr_w == 0 && ng_w == 0) begin
            $display ("INFO: (18) is correct.");
        end else begin
            $display ("ERROR: (18) is incorrect.");
        end
         
    end
    
    initial begin
        $monitor("t=%3d x=%d y=%d out=%d zr=%d ng=%d \n",$time,x_reg,y_reg,out_w,zr_w,ng_w);
    
    end


endmodule
