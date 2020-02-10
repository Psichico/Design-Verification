class c_57_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_57_1;
    c_57_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zz1xzxz100xx1x000xz1z11zx1001zxzzzzxxxzxxzxzxzxxzxzxzxzxzxxxxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
