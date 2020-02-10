class c_56_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_56_1;
    c_56_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xx001xx1zz1x1100xx0zx00x1000xx0xxzxxxxxxxxzzxzzzzzxxzxzzxzxxzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
