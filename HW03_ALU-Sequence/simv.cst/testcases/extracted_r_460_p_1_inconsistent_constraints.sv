class c_460_1;
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

program p_460_1;
    c_460_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1x011z1z100z1010z1xxz01x010xzx1zzxxzzxzxzxzzzxzxxzxzxxxzxxzxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
