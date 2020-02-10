class c_65_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_65_1;
    c_65_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "00x0001zz1xx10z11001x1xx0x1xxxz1xzzxxzzzxxzxzzxzxxxxzxxzxzzxxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
