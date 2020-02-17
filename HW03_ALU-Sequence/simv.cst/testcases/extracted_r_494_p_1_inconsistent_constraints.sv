class c_494_1;
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

program p_494_1;
    c_494_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z1z0xzzxz1zz01zxz0000xz000z10x10xxzzzxxzxxxxzzzxxzxzzxxxxzxxzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
