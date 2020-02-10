class c_52_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_52_1;
    c_52_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "100z1x110x0zz100xz1zx1z11x10z1z0xzzzzxzxxzxzxzzzzzzzxzzxzxxxxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
