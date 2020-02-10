class c_81_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_81_1;
    c_81_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "111xzx1zx01xz10xxxx0x0xzx11z0z1xxxxzzxzzzzxxzzxzxxxzxzzxxxzxzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
