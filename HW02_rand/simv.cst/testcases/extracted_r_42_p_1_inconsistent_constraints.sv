class c_42_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_42_1;
    c_42_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0x11zx0z1z111z00x0x00x0zxzz101z1xzxzxxzzxzxxzxzzxzxxxxzzzxzzzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
