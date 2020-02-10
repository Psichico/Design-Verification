class c_72_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_72_1;
    c_72_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1001xzxz01xxxx1zz1z0xxx1z011x1xxxzxzxzxxxzzxzzzxzxzxzxzzxzzzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
