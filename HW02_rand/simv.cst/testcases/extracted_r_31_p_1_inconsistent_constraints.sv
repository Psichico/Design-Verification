class c_31_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_31_1;
    c_31_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xz101x1zzxxx000zz0100x0x1xzxz000xzzxxxxzzzxzzxzxxxxxzxxxzxzxzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
