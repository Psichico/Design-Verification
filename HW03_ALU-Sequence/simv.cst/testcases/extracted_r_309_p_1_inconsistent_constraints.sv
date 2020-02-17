class c_309_1;
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

program p_309_1;
    c_309_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z00z0zz11x001z00xzxx10x1z000zzzzxzxxzxxxzxzxzxxxzzzzzxzxxxxzxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
