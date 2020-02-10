class c_60_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_60_1;
    c_60_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xx11xxz0zx10z1x11xzx11z1x11z00x1xzzxxxxxxzxxzzxxxxzzzxxzxxzzxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
