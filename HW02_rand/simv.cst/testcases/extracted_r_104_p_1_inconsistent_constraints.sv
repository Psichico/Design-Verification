class c_104_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_104_1;
    c_104_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "01z111xxx1z1x1xzx1x01xxxz1z0110zxzxzxzxxxzzzzzxzxxzzzxzzzxxzzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
