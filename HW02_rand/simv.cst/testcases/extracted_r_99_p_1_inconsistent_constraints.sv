class c_99_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_99_1;
    c_99_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xzx0xx0101x01110xz01z0x0zzz11zz1zzxzzxzxxzzxzxxzzxxzzzxxxxxzzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
