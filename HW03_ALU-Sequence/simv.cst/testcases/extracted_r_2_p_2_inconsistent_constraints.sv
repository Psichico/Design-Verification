class c_2_2;
    rand bit[31:0] seq_itm_test_bit_a; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (alu_sequence.sv:16)
    {
       (seq_itm_test_bit_a == 32'h0);
       ((seq_itm_test_bit_a[5]) == 1'h1);
    }
endclass

program p_2_2;
    c_2_2 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0xz000xzz01xxzxx0z111x0zzxx1x01xxzxxxxxxzxzzxxxzzxxzzxzxxxzzzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
