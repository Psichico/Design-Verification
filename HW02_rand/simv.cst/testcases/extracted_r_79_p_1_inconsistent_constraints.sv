class c_79_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_79_1;
    c_79_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "10xxz010zxz0z11x100zzx10zzxx1x00zxxzxzzxxzzxxxzzxxxxxxzzzzzzxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
