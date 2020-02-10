class c_68_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_68_1;
    c_68_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0z11xx1xx0xz11zz01x10z0x000100z1zxxzxxxxzxxxzzzxzzxzxxzzzxzxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
