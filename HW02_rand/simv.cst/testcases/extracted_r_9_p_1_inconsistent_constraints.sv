class c_9_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_9_1;
    c_9_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "110xxxxzxz01zx0z11z0xx011z00x1z0zxzxxzxzxzxzzxzzxxxzzzxzzzzxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
