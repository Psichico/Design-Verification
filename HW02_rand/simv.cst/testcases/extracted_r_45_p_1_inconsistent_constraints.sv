class c_45_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_45_1;
    c_45_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x0xzxzzzz00z1100110zz11zxz1xx1zxzzzzxzxzxzzxxzzzxzzzzzzzzzxzxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
