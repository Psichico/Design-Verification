class c_44_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_44_1;
    c_44_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z00zzx1x1zxxxzx0x0x11zx101xzx1z1xzzzzzzzzxxzxxzzzxzxxzxzxxxzzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
