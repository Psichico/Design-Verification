class c_80_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_80_1;
    c_80_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xz101xx1z1z0001xx0zx001zz00zx011xxzxzxxzzxzzzzxxzxzxzxxzzzzxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
