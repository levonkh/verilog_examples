module mux_4_way_16_bit (a,b,c,d,sel,out);

    input [15:0] a,b,c,d;

    input [1:0] sel;

    output [15:0] out;

    wire [15:0] w1;
    wire [15:0] w2; 

    mux_code instl [15:0] (a,b,{16{sel[0]}},w1);
    mux_code inst2 [15:0] (c,d,{16{sel[0]}},w2);
    mux_code inst3 [15:0] (w1,w2,{16{sel[1]}},out);

 
endmodule