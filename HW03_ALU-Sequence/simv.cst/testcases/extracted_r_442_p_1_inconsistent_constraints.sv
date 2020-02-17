class c_442_1;
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

program p_442_1;
    c_442_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0x00xxzxx1x0z0x0111x1zz11zzzzx0zzzzzzxzxxzzzxxzzxzzxzxxzzzxzzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
