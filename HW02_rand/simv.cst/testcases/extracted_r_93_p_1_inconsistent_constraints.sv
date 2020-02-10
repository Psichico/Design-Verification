class c_93_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_93_1;
    c_93_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1xxxzxz1z111x0xxz1xxz0x1zx1z0zx1xxzzxzzzzxxxzxxxzxxzxxzzxxxzxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
