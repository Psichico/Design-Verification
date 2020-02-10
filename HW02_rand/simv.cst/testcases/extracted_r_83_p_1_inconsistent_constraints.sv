class c_83_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_83_1;
    c_83_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zx111xxxz010x1zzxxzz0z11z010zz1xzzzzxxxzxxxzzzxxxxzzxzzxxzzxzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
