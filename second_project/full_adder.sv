module full_adder (a,b,c,carry,sum);

    input  a,b,c;

    output carry;
    output sum;

    wire w1; // not a
    wire w2; // not b
    wire w3;
    wire w4; 
    wire w5; // XOR branch result
    wire w6; // not c
    wire w7; // carry branch
    wire w8; // sum branch
    wire w9; // a and b

    not(w1,a);
    not(w2,b);
    not(w6,c);

    and (w3,w1,b);
    and (w4,w2,a);
    or (w5,w4,w3);

    and (w7,w5,c);
    and (w8,w5,w6);

    and(w9,a,b);
    and(w10,w1,w2);
    or(w11,w10,w9);
    and(w12,w11,c);

    or (carry,w7,w9); //carry
    or (sum,w8,w12); // sum

endmodule
