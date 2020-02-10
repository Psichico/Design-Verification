class c_69_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_69_1;
    c_69_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z0zx1zx1xxz0x1x0z1x1x1zzz1z11z10zxxzzxxxzxxxxzzzzzzzzxxzzzxxxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
