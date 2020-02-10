class c_91_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_91_1;
    c_91_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x0z0zz0100111x0101x1x1z011xz010zzzxzxzxxxxzzxxxxzzzxzxzzxzxzxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
