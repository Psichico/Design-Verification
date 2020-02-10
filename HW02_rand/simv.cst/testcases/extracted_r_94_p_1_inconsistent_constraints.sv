class c_94_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_94_1;
    c_94_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "110z0xxzx10zx0xzz0x1x1x01xx0z0z0zxxxzxzzzxxzxzxzzxxzxzzxzxzxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
