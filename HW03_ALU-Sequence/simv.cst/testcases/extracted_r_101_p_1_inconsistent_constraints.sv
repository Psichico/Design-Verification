class c_101_1;
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

program p_101_1;
    c_101_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z1z01101z10xxzx11xxz10xx1zxx001zzxzzxzzzxzzxzxxzzzxzzzxzzxxzxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
