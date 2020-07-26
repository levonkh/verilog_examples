module alu_top_func;

    reg signed [15:0]x_reg,y_reg;
    reg zx_reg, nx_reg, zy_reg, ny_reg, f_reg, no_reg;

    wire signed [15:0]out_w;
    wire zr_w, ng_w;

    alu inst1 (.x(x_reg),.y(y_reg),.zx(zx_reg),.nx(nx_reg),.zy(zy_reg),.ny(ny_reg),.f(f_reg),.no(no_reg),.out(out_w),.zr(zr_w),.ng(ng_w));

    function void alu_model (   input signed [15:0] x,
                                input signed [15:0] y,
                                input zx,
                                input nx, 
                                input zy,
                                input ny,
                                input f, 
                                input no,

                                output signed [15:0] out,
                                output zr,
                                output ng);
    /*
    
    Function: 
    if zx then x = 0 // 16-bit zero constant
    if nx then x = !x // Bit-wise negation
    if zy then y = 0 // 16-bit zero constant
    if ny then y = !y // Bit-wise negation
    if f then out = x + y // Integer 2's complement addition
    else out = x & y // Bit-wise And
    if no then out = !out // Bit-wise negation
    if out=0 then zr = 1 else zr = 0 // 16-bit eq. comparison
    if out<0 then ng = 1 else ng = 0 // 16-bit neg. comparison
    
    */
        logic signed [15:0] x_local, y_local;
        x_local = x;
        y_local = y;

        if (zx == 1)
            x_local = 0;
        if (nx == 1)
            x_local = (~x_local);
        
        if (zy == 1)
            y_local = 0;
        if (ny == 1)
            y_local = (~y_local);

        if (f == 1)
            out = (x_local + y_local);
        else 
            out = (x_local & y_local); 

        if (no == 1)
            out = (~out);
        
        if (out == 0)
            zr = 1;
        else
            zr = 0;
        
        if (out < 0)
            ng = 1;
        else
            ng = 0;
    
    endfunction
    
    initial begin
  
        logic signed [15:0] out_func;
        logic zr_func;
        logic ng_func;

        for (int i = 0; i < 10000; i++) begin

            x_reg <= $random;  // 0  // 1 0 1 0 1 0
            y_reg <= $random;
            zx_reg <= $random;
            nx_reg <= $random;
            zy_reg <= $random;
            ny_reg <= $random;
            f_reg <= $random;
            no_reg <= $random;
            #10;    

            alu_model (x_reg, y_reg, zx_reg, nx_reg, zy_reg, ny_reg, f_reg, no_reg, out_func, zr_func, ng_func);
            if (out_w == out_func && zr_w == zr_func && ng_w == ng_func) begin
                $display ("INFO: (1) is correct. Expecting %d,%d,%d recieved %d, %d, %d",out_func, zr_func, ng_func, out_w, zr_w, ng_w);
            end
            
            else begin
                $display ("ERROR: %t is incorrect.Expecting %d,%d,%d recieved %d, %d, %d", $time, out_func, zr_func, ng_func, out_w, zr_w, ng_w);
                //$stop();
            end

        end
    end

endmodule
