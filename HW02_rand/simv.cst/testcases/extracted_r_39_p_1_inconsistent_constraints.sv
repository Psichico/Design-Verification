class c_39_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_39_1;
    c_39_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1z0z1xx111x1zxxz0x0xzxzxx11zzx0xzzxxzzzzzzxzxzxzzxzxxzxxxxzzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
