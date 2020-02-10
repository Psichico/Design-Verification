class c_100_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_100_1;
    c_100_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z1zx0001001x0x0z1xxx01101x011x10xzzxzxxzzxzxxxxzzxzzzzxzxxzzxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
