class c_436_1;
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

program p_436_1;
    c_436_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x11101zx11z0x0z101x011xzz0zxx1z0zzzxzzzxxxxxzxzxzzxxzxxzzzxxzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
