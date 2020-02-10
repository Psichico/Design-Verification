class c_19_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_19_1;
    c_19_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1101x0z000zx01zz11xzx001xx0zzxzzxxxzxzxzzzxxzxxxzxxxzxzxxzzxxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
