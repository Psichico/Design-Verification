class c_32_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_32_1;
    c_32_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xx1zx1z0010xz0z011xz10000xzz01x0xzzxxxxzzxzxzxxxxxzxzxzxxzxzzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
