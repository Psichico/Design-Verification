class c_49_1;
    integer mx_opcode = 0; // ( mx.opcode = trand::icmd::E_reset ) 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:44)
    {
       (mx_opcode == 1 /* trand::icmd::E_push */);
    }
endclass

program p_49_1;
    c_49_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zz1110z10110xz11x11z0z00xz1x01z1zzzzzxzxzxzzzxxzxxxzzxzzxzxzzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
