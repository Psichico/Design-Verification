class c_47_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_47_1;
    c_47_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xxx10zzz01z011z0zxz1111x001z10xzxzzxzxxzzxzxzzxxzxxzxxzzxxzxzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
