class c_63_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_63_1;
    c_63_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "01x1z0xxxz0110x1011xzzzz1xxzxzx0zzzxxzxxzzxxxzxxxzzxzzxzxxzxxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
