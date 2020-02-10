class c_23_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_23_1;
    c_23_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0zz1xxz01z11x1z000xzzzz1xx1011zzzxzzxxzzxxzxzzxzzzzzxzzzxxzzxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
