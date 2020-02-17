class c_172_1;
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

program p_172_1;
    c_172_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "000x010zzz001x010zz1xx0x0x001000zxxzzxzxxxzzzzzzxxzxzzxzxxzxxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
