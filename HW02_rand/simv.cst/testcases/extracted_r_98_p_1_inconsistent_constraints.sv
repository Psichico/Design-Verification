class c_98_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_98_1;
    c_98_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zx1zz10zx1z1x1x1x11xx1x01zxx00z0zxzzzzzxxxxxzxzxzzzxzzxxxzxxxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
