class c_23_1;
    integer mx_opcode = 0; // ( mx.opcode = trand::icmd::E_reset ) 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:40)
    {
       (mx_opcode == 3 /* trand::icmd::E_pushcomplete */);
    }
endclass

program p_23_1;
    c_23_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0zz1xxz01z11x1z000xzzzz1xx1011zzzxzzxxzzxxzxzzxzzzzzxzzzxxzzxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
