class c_51_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_51_1;
    c_51_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "10110xx1x1zx0zxx1xz0xzxzx110z1x1zzxzxzxxzxzxzxzzzxzxxzzxxxzxzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
