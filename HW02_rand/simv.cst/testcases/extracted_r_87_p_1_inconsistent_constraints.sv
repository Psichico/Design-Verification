class c_87_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_87_1;
    c_87_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "00x0x0zx0xz0zx00110x1x0zx1z0101xzxxxxzzxzzzzzxxxzxzzxzxzxxzxxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
