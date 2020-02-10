class c_76_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_76_1;
    c_76_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0xx01zz11100x0x0x1xz10xzz01xzz00xxzzxxxzzzxzxxzxzzzzxzxxxxzxxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
