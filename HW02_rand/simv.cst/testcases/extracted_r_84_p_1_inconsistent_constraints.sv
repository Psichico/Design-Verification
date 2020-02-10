class c_84_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_84_1;
    c_84_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zzz0zxxz1z11z101x11xz1z00x00xz01zxxzxxxxzzzxxxzxzxzzxxzzxxxxxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
