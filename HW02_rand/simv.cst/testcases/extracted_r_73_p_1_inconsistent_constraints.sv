class c_73_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_73_1;
    c_73_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0z0zz0z0z1100x0xz0z11zz11z10z100zzxxxzxxxzxxzxxxzxzzzzxxxzzzzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
