class c_101_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_101_1;
    c_101_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "10xx00z1101zx001x01z1xz10010111zzxxzzxzzxxzxzzxzzzzxzxzzxzzzzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
