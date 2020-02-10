class c_88_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_88_1;
    c_88_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1xx1011z0zz01xzxxz01xx10z1z0z11xzxxzxzxxzxxzzxxzxxxzxxzzxzxxzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
