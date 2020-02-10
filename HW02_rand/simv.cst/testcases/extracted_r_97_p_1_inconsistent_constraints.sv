class c_97_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_97_1;
    c_97_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z0x1zz00xzz000x01xz101zxz11zx1xzzzzzxzzzzxzxxzzxzxxxxxzzzxxzxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
