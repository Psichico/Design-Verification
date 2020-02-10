class c_24_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_24_1;
    c_24_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "10zz10z00xz1x010110xx00zx110z1zzzzxzxzxzxxzzxxxxxxzzxxxxxzxxxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
