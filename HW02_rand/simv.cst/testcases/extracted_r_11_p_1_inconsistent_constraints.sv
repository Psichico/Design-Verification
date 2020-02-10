class c_11_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_11_1;
    c_11_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zx1xx1010z0x111x11z10z110zxzz011xxxzxxzzzzxxxxxxzzzzzzzxzxzxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
