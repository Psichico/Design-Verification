class c_7_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_7_1;
    c_7_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1z00011xx1x1xz1z010xxx11zz10x101xxzzxzzxzxxzxxzxxzzxxzxzzxzzzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
