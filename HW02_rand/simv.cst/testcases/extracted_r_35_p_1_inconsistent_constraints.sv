class c_35_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_35_1;
    c_35_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x110z10xz111z01111x01101xzz11x0xzxzxxxxzzxxxzzzzxxzxzzzxzzzzzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
