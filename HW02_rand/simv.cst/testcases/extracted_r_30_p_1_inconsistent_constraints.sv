class c_30_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_30_1;
    c_30_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0xx10x11zzzz0x111zzzzx0000x1z00xxxxzzxzxxxxxxxxxzzzxxzxxxxzxzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
