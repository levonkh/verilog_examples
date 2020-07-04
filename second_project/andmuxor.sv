module andmuxor (a,b,sel,o1);

  input a;
  input b;
  input sel;

  output o1;
  
  wire w1;
  wire w2;
 
  and (w1,a,b);

  or (w2,a,b);

  mux_code instl (.a(w1),.b(w2),.sel(sel),.o1(o1));

endmodule
