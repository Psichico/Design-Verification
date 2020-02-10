class c_20_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_20_1;
    c_20_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1xzz0zxz0z00z000x10xxzzx0x0xzx1xxxxxzxxzzxzxxxxzxzxzxzxxzzxzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
