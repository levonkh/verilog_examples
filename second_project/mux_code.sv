module mux_code (a,b,sel,o1);

  input a;
  input b;
  input sel;

  output o1;
  
  wire w1;
  wire w2;
  wire w3;
 
  and (w1,a,b);

  and (w2,a,~b,~sel);

  and (w3,~a,b,sel);
 
  or (o1,w1,w2,w3);

endmodule
