class c_89_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_89_1;
    c_89_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1z1100010z100zx0000xx0xz001111z0zzzzxzxxzzxzxzxzxxzxzxzzxxxxzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
