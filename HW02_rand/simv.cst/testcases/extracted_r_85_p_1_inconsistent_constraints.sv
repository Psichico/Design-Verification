class c_85_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_85_1;
    c_85_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "100zxz110z0z00zx01x010100x11z1x0xzzzxxxxzzxzxzxzzxzxzzxzxzzxxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
