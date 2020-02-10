class c_102_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_102_1;
    c_102_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z0x001xzxzz1x0zxzz10z0zxz0zz001zxzzzzxzxxzzxzzxxxzxzzxzzzxxxxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
