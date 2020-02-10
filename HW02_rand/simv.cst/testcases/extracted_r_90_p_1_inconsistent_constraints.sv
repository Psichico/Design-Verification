class c_90_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_90_1;
    c_90_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1zx1z1z1xxz1z0xzx10001zxx1x0z11xxzzzxzxzzzzzzxzzzxxzxxxxxzzxzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
