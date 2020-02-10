class c_36_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_36_1;
    c_36_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xzz00x1xx1100zx00x1x1x100xz10zx0zxxzzzzzxzzxzzxzzzzzzxxzzxxzzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
