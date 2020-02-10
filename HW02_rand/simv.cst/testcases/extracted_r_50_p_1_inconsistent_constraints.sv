class c_50_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_50_1;
    c_50_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "011x0xz011x0xzz10zz0zzxzz0zzzxxxxzxzxzxxzzxzxzxxxzxzxzxxxzzzxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
