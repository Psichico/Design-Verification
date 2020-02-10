class c_95_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_95_1;
    c_95_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z1xx111x0100xx11x0z100xxx0zxz1zxxxxzzzzxxzxxzzxzzxxxzzzxzxzxzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
