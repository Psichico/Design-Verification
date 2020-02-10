class c_77_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_77_1;
    c_77_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0zzzz01x101x01z1z101010xz00xzz10zzxxxxxzxxxzxzxzzzxxxxzzzzzxxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
