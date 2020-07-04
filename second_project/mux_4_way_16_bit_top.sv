module mux_4_way_16_bit_top;


    reg [15:0] a,b,c,d;

    reg [1:0] sel;

    wire [15:0] out;


    mux_4_way_16_bit inst1 (.*);

    initial begin
        a = 16'd12;
        b = 16'd15;
        c = 16'd10;
        d = 16'd8;
        #10;
        sel = 2'b00;

        #10; 
        sel = 2'b01;

        #10; 
        sel = 2'b10; 

        #10; 
        sel = 2'b11;
    
        #10; 

    end



endmodule