class c_92_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_92_1;
    c_92_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "11zz0zzx1z001zz0001zz1101x0x0x10xzzxzxxzzxzzzzxxxxxxxzzxzzzxxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
