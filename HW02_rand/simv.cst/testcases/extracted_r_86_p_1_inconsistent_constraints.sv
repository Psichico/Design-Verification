class c_86_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_86_1;
    c_86_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xz1xz11zz100x1zx0x111z1z011xz101xxxzzxxzxxxzzxxxxzzzzzzzzxzzzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
