class c_12_1;
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

program p_12_1;
    c_12_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "001z1xx1xzx11zxx00z1x1xx0z00z0x0zxxzzxzxxxzzxxzxxxzzxzzxxxzxzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
