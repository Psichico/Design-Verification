class c_17_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_17_1;
    c_17_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0z1xz0xzzzzxz111x1zx0xxz10zz0zxxxzxzzxxxxxxzzzxzxzzzzxxzzxxxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
