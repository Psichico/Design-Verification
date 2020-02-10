class c_21_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_21_1;
    c_21_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1zxzxz011xz01xzxx00z01x01xz0z01zzxxzzxzxxzzzzzzzzxxzxzxxzxzxzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
