class c_16_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_16_1;
    c_16_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z01x1zxx00001011zx0xz0z1z10zx0x0xxxxzxzzxzzxzxxzxzzxzxzxxxxxzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
