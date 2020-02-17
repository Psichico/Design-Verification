class c_216_1;
    rand bit[31:0] test_bit_a; // rand_mode = ON 

    constraint my_constraints_this    // (constraint_mode = ON) (alu_sequence_item.sv:6)
    {
       ((test_bit_a[0]) == 1'h1);
    }
    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (alu_sequence.sv:14)
    {
       (test_bit_a == (test_bit_a << 1));
    }
endclass

program p_216_1;
    c_216_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1xx1xx0zx10zx110x1x10z1zz0z1x10zzzxxzxzzxzzxzxzzzxxzzzzxzxzzzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
