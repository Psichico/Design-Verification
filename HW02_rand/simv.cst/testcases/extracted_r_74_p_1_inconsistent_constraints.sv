class c_74_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_74_1;
    c_74_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z1x11111x0x1010x11zxxxzxx1001x10xzzxzzzxxxzzzxxxxzxxxxxxxzxxzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
