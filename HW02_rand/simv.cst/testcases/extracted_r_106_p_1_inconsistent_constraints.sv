class c_106_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_106_1;
    c_106_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "011z00000z001x1zx0zz111x00010100xzxxzzzxzxzxzzxxxzzxxzxxxxxzzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
