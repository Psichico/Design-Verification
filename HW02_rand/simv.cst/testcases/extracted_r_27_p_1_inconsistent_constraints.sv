class c_27_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_27_1;
    c_27_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zxx0xx00zzzz10z001z1xx0z1z0x01zzzxzxxzzzzxzxzzzxxzxxxzxzxzxzxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
