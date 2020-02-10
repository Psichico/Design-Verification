class c_58_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_58_1;
    c_58_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zz0z1z0zzx0zzz011xx0xzz1x001zz1zxzzxxzzzzxzxzzxzxxzzzzxxxzxzxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
