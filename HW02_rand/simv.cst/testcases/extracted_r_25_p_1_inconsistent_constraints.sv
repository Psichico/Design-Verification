class c_25_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_25_1;
    c_25_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "00x0xz11x1z0x10xx1zx010z0zx0011zzzxzxzzzxzzzzzxxzxzxzzxzzxxxxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
