class c_28_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_28_1;
    c_28_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0zx011z0xzxx01zz00zx01x1010x1zz1zxxxxxxzzzzzzzzzxzxxxzzxxxxzxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
