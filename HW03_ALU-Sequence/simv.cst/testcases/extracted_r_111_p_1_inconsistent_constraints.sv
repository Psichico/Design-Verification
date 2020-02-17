class c_111_1;
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

program p_111_1;
    c_111_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "11xxz1z01110xx0z0111zzx0zxx0001xxxxzzxzzxzxzxxzxzzzxxzzzxzxxxxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
