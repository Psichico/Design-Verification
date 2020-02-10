class c_40_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_40_1;
    c_40_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0xzx01110xzzxx1zzzx11xxx11x010zzxxxzzxzxxzzxzxzxzzzxxxzzxxxxxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
