class c_64_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_64_1;
    c_64_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "10z0x00zxxxxxxzx00x01z10z0xz1x01xxxzxxzzxxxzxxzxzxxxzzxzxxzzzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
