class c_96_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_96_1;
    c_96_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z011z0x01zzx1x0110x0z110x11x1100xxzzzxxxzxzxzxxxxzxxzzzzxxxxxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
