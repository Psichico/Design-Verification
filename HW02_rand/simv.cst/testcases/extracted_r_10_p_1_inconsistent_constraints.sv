class c_10_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_10_1;
    c_10_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zxzxxxzxxx00111zxz1xx1zxxz100zz1zxxxzxzxzzxxxxzzxxzxxzxxzxzxxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
