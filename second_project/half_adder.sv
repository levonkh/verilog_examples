module half_adder (a,b,carry,sum);

    input  a,b;

    output carry;
    output sum;

    wire w1; 
    wire w2;
    wire w3; 
    wire w4;

    and (carry,a,b);

    not(w1,a);
    not(w2,b);

    and (w3,w1,b);

    and (w4,w2,a);
    
    or (sum,w3,w4);

endmodule

