class c_15_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_15_1;
    c_15_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0xxx10xzxzzxzz0111xxzxz1x0xz0zx1zzxzzzzxzzzzzzzxzxzxxxzzzxxxxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
