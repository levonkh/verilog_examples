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
        
        //x_reg <= 0;  // 1 // 1 1 1 1 1 1
        //y_reg <= 0;
        zx_reg <= 1;
        nx_reg <= 1;
        zy_reg <= 1;
        ny_reg <= 1;
        f_reg <= 1;
        no_reg <= 1;
        #10; 

        //x_reg <= 0;  // -1 // 1 1 1 0 1 0
        //y_reg <= 0;
        zx_reg <= 1;
        nx_reg <= 1;
        zy_reg <= 1;
        ny_reg <= 0;
        f_reg <= 1;
        no_reg <= 0;
        #10;    
        
        //x_reg <= 0;  // x // 0 0 1 1 0 0
        //y_reg <= 0;
        zx_reg <= 0;
        nx_reg <= 0;
        zy_reg <= 1;
        ny_reg <= 1;
        f_reg <= 0;
        no_reg <= 0;
        #10; 

        //x_reg <= 0;  // y  // 1 1 0 0 0 0
        //y_reg <= 0;
        zx_reg <= 1;
        nx_reg <= 1;
        zy_reg <= 0;
        ny_reg <= 0;
        f_reg <= 0;
        no_reg <= 0;
        #10;    
        
        //x_reg <= 0;  // !x // 0 0 1 1 0 1
        //y_reg <= 0;
        zx_reg <= 0;
        nx_reg <= 0;
        zy_reg <= 1;
        ny_reg <= 1;
        f_reg <= 0;
        no_reg <= 1;
        #10; 

        //x_reg <= 0;  // !y // 1 1 0 0 0 1
        //y_reg <= 0;
        zx_reg <= 1;
        nx_reg <= 1;
        zy_reg <= 0;
        ny_reg <= 0;
        f_reg <= 0;
        no_reg <= 1;
        #10;    
        
        //x_reg <= 0;  // -x // 0 0 1 1 1 1
        //y_reg <= 0;
        zx_reg <= 0;
        nx_reg <= 0;
        zy_reg <= 1;
        ny_reg <= 1;
        f_reg <= 1;
        no_reg <= 1;
        #10; 
        
        //x_reg <= 0;  // -y // 1 1 0 0 1 1
        //y_reg <= 0;
        zx_reg <= 1;
        nx_reg <= 1;
        zy_reg <= 0;
        ny_reg <= 0;
        f_reg <= 1;
        no_reg <= 1;
        #10;    
        
        //x_reg <= 0;  // x+1 // 0 1 1 1 1 1
        //y_reg <= 0;
        zx_reg <= 0;
        nx_reg <= 1;
        zy_reg <= 1;
        ny_reg <= 1;
        f_reg <= 1;
        no_reg <= 1;
        #10; 

        //x_reg <= 0;  // y+1 // 1 1 0 1 1 1
        //y_reg <= 0;
        zx_reg <= 1;
        nx_reg <= 1;
        zy_reg <= 0;
        ny_reg <= 1;
        f_reg <= 1;
        no_reg <= 1;
        #10;    
        
        //x_reg <= 0;  // x-1 // 0 0 1 1 1 0
        //y_reg <= 0;
        zx_reg <= 0;
        nx_reg <= 0;
        zy_reg <= 1;
        ny_reg <= 1;
        f_reg <= 1;
        no_reg <= 0;
        #10; 

        //x_reg <= 0;  // y-1 // 1 1 0 0 1 0
        //y_reg <= 0;
        zx_reg <= 1;
        nx_reg <= 1;
        zy_reg <= 0;
        ny_reg <= 0;
        f_reg <= 1;
        no_reg <= 0;
        #10;    
        
        //x_reg <= 0;  // x+y // 0 0 0 0 1 0
        //y_reg <= 0;
        zx_reg <= 0;
        nx_reg <= 0;
        zy_reg <= 0;
        ny_reg <= 0;
        f_reg <= 1;
        no_reg <= 0;
        #10; 

        //x_reg <= 0;  // x-y // 0 1 0 0 1 1
        //y_reg <= 0;
        zx_reg <= 0;
        nx_reg <= 1;
        zy_reg <= 0;
        ny_reg <= 0;
        f_reg <= 1;
        no_reg <= 1;
        #10;    
        
        //x_reg <= 0;  // y-x // 0 0 0 1 1 1
        //y_reg <= 0;
        zx_reg <= 0;
        nx_reg <= 0;
        zy_reg <= 0;
        ny_reg <= 1;
        f_reg <= 1;
        no_reg <= 1;
        #10; 
      
        //x_reg <= 0;  // x and y // 0 0 0 0 0 0
        //y_reg <= 0;
        zx_reg <= 0;
        nx_reg <= 0;
        zy_reg <= 0;
        ny_reg <= 0;
        f_reg <= 0;
        no_reg <= 0;
        #10;    
        
        //x_reg <= 0;  // x or y // 0 1 0 1 0 1
        //y_reg <= 0;
        zx_reg <= 0;
        nx_reg <= 1;
        zy_reg <= 0;
        ny_reg <= 1;
        f_reg <= 0;
        no_reg <= 1;
        #10; 
    end
    
    initial begin
        $monitor("t=%3d x=%d y=%d out=%d \n",$time,x_reg,y_reg,out_w);
    
    end


endmodule
