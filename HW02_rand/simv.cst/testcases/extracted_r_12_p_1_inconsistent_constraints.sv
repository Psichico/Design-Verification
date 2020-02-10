class c_12_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_12_1;
    c_12_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "11xz011zx1x11x0zx1x0z0zzzz0xxxz1zzxxzxzxzxxzxzzxzxxxzxxxxxzxxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
