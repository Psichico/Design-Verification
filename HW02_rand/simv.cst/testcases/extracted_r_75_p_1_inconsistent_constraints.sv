class c_75_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_75_1;
    c_75_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z0z1zz10z1z0zzzzx1zzz0xx0z1zz1zxzzxxzxzxzxxxzxzzxxxzzzxzxxzxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
