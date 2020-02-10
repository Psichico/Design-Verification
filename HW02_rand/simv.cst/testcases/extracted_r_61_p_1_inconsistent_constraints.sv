class c_61_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_61_1;
    c_61_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x0000zxxz010x11z1zx00z0xxzzz1001zzzxxxzxzxzzzxxxxzxxzzxxzzzzxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
