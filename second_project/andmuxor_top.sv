module andmuxor_top ;

  reg a_r;
  reg b_r;
  reg sel_r;

  wire o1w;

  andmuxor inst1 (.a(a_r),.b(b_r),.sel(sel_r),.o1(o1w));

  initial begin
    a_r <= 0;
    b_r <= 0;
    sel_r <= 0;
 
    #10; 
    a_r <= 0;
    b_r <= 1;
    sel_r <= 0; 

    #10; 
    a_r <= 1;
    b_r <= 0;
    sel_r <= 0;

    #10; 
    a_r <= 1;
    b_r <= 1;
    sel_r <= 0; 
  
///////////////
    
    #10;
    a_r <= 0;
    b_r <= 0;
    sel_r <= 1;

    #10;
    a_r <= 0;
    b_r <= 1;
    sel_r <= 1;
 
    #10; 
    a_r <= 1;
    b_r <= 0;
    sel_r <= 1; 

    #10; 
    a_r <= 1;
    b_r <= 1;
    sel_r <= 1; 
  
    #10;

   //$finish();
  end

endmodule 