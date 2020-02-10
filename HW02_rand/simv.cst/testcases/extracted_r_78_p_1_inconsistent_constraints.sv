class c_78_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_78_1;
    c_78_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xx0x110x0xzxzzxzx1zxzx01zxx10zxxxzxxzzzxzxzxxxxxxzzxzzxzzxzzzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
