module half_adder_top;

    reg a_reg,b_reg;

    wire carry_w;
    wire sum_w;

    half_adder inst1 (.a(a_reg),.b(b_reg),.carry(carry_w),.sum(sum_w));

    initial begin
        a_reg <= 0;
        b_reg <= 0;
        
        #10;
        a_reg <= 0;
        b_reg <= 1;

        #10; 
        a_reg <= 1;
        b_reg <= 0;

        #10; 
        a_reg <= 1;
        b_reg <= 1; 
        #10; 

    end

endmodule
