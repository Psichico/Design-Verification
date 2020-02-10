class c_103_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_103_1;
    c_103_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zzz1xzxxxz000x0x0z0zxzxx11z0xz00zzzzzxxzzxxxxzzzxxzxzxxzxxxzzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
