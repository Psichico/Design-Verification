class c_18_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_18_1;
    c_18_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xz10xz01z10zz1z0010100z001zzz010zxxxzxzxxzxxxzxxxxxzxzxzzxzxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
