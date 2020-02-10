class c_71_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_71_1;
    c_71_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "11zx0x1z00zz0zxxzx11zxzz0011x0xzxxzzzxzzzxxxxzzzxzxzxxzxxxzxzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
