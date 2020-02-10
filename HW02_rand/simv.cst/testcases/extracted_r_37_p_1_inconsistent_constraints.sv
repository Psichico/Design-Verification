class c_37_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_37_1;
    c_37_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0zzz0001xzz11xxx0x01z10x001101xzzzxzzxzzzxzzxxzzxzzxzxxxzzxxxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
