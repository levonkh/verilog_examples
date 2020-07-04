module Dmux (in,sel,a,b);

  input in;
  input sel;

  output a;
  output b;
  
  not (a,sel);

  and (b,sin,sel);

endmodule
