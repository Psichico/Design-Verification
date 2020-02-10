class c_29_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_29_1;
    c_29_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "000zzx1zzz01x1x1xz1xz0xxzxzz1z0xxxzxxzxzzzxzzxzxzzxzzxxzxzzxxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
