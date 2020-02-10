class c_38_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_38_1;
    c_38_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zzxxxzx001x1000x0x001x0z10xx01zxzxxxzzzzzxzxxxxzzzzxxxxxxzzxzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
