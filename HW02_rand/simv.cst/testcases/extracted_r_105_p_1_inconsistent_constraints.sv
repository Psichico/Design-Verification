class c_105_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_105_1;
    c_105_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x0z1z0x010xzxz10z101000zz100zzz1zxzzzxzxzxxzzzxxxzzxxxxxxzzzzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
