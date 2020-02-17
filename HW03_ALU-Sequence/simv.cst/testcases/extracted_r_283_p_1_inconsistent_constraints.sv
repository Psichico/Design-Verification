class c_283_1;
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

program p_283_1;
    c_283_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1xxxzzzxz00xz1x011xx0110010xzx0zxxxzzzxzzxzzzzzxzzxzxzzzxxzzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
