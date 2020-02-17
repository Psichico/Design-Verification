class c_209_1;
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

program p_209_1;
    c_209_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1z0z0x1z0001z1x10111z101z1zx0zxzzzxxxzzzzxzzzzxzzxzzxxzxxxxxxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
