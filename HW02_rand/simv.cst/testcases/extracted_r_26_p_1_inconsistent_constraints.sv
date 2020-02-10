class c_26_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_26_1;
    c_26_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "00xz1x10000z110000z0zzz0x101x0zxxxzxxzxzxxxxxxzxzzxxxxxxzxzzxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
