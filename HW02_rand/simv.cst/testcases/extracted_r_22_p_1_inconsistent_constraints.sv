class c_22_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_22_1;
    c_22_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z0110zz00x1110zz11100x1z00xzz1x1zzzzxxxzxzzzxzxxzzzzxxzxzzxxxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
