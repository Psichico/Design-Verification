class c_17_1;
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

program p_17_1;
    c_17_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z0zx0x011z0z1xx1xz10x0xx10zz000xzxzzzzzxzzxxzxxxzxxxzxxxzxxxzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
