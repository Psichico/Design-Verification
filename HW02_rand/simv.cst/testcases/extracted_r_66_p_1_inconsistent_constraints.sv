class c_66_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_66_1;
    c_66_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0xx11xx0z0z111z0xz010z1011xz1zx0xzzzzzzzxzxxzxzzxxzzxxzxzzxxxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
