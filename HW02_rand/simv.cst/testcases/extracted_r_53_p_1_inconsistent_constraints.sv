class c_53_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_53_1;
    c_53_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z00001x1z1zz0zxxz01zxzxz1xx0xxzxxzzzxzzzzxzzxzxxxzzxzxzxzxxzxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
