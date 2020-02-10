class c_48_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_48_1;
    c_48_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0zx00zz100000z0z1zxx10100zxzzx10xxxzxxzzxzxxxzxxzzzxxxzzxzzzzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
