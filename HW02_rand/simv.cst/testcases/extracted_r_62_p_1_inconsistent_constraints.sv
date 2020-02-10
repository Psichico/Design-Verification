class c_62_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_62_1;
    c_62_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z1x101xxx00000xxzzx0xzx0z0z1zxz1xxxxzxzzzxzxzxzxxxxxxzxzzxxxzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
