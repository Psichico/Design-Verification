class c_49_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_49_1;
    c_49_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zz1110z10110xz11x11z0z00xz1x01z1zzzzzxzxzxzzzxxzxxxzzxzzxzxzzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
