class c_41_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_41_1;
    c_41_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zz100xxzx00zx10xx0zzz0000111xx0xzxzxxxxxzxxzzxzzxxzzzzxzzzzxxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
