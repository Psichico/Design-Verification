class c_82_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_82_1;
    c_82_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1x11101z1z11zxzzzx0xxxz1x1xz0zxxzxxzxzxxzxzxxzzxzxxxxzxzzzzzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
