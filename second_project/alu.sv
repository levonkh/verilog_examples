module alu (x, y, zx, nx, zy, ny, f, no, out, zr, ng);

  input signed [15:0] x;
  input signed [15:0] y;
  input zx; 
  input nx;
  input zy;
  input ny;
  input f;
  input no;


  output signed [15:0] out;
  output zr;
  output ng;
  
  wire signed [15:0] w1;
  wire signed [15:0] w2;
  wire signed [15:0] w3;
  wire signed [15:0] w4;
  wire signed [15:0] w5;

  assign w1 = (zx==1) ? 16'h0 : x; // zx
  assign w2 = (nx==1) ? ~w1 : w1; // nx

  assign w3 = (zy==1) ? 16'h0 : y; // zy
  assign w4 = (ny==1) ? ~w3 : w3; // ny

  assign w5 = (f==1) ? w2 + w4 : w2 & w4; // function f

  assign out =(no==1) ? ~w5 : w5; // ng

  //if out=0 then zr = 1 else zr = 0 // 16-bit eq. comparison
  
  assign zr = (out==0) ? 1 : 0 ; // ng

  // if out<0 then ng = 1 else ng = 0 // 16-bit neg. comparison
  
  assign ng = (out<0) ? 1 : 0; // zr


endmodule
