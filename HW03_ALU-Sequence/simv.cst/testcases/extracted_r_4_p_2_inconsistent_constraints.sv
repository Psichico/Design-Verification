class c_4_2;
    rand bit[31:0] seq_itm_test_bit_a; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (alu_sequence.sv:16)
    {
       (seq_itm_test_bit_a == 32'h0);
       ((seq_itm_test_bit_a[5]) == 1'h1);
    }
endclass

program p_4_2;
    c_4_2 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z00xz1xxxx0z10zxxz0001010z0z0001zzxxzxzxxxzzxzzzzxzzxxxxxzxxzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
