class c_34_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_34_1;
    c_34_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z0x1x0x0zxz1zxx0zxxxzzz1xz1x010xxxzzxzzxzxzzzxzzxzxxxzzzxzzzxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
