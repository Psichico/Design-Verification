class c_43_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_43_1;
    c_43_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "10zz01z1001xxxzz1001xxx1100xxzx1xzxzzxzzzzxxzxxxzxxzzzxzzzxzxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
