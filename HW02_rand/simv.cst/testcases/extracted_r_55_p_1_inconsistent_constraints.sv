class c_55_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_55_1;
    c_55_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z0xx0xz1xzxzzzxzz00xx010z1z01z10xxzxzzxxzzzxxxzxxxxxzzxxzxxxzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
