class c_14_1;
    integer mx_opcode = 0; // ( mx.opcode = trand::icmd::E_reset ) 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:44)
    {
       (mx_opcode == 1 /* trand::icmd::E_push */);
    }
endclass

program p_14_1;
    c_14_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z1xz01z1z11zz00xxz10x0z1zz010x00xzzzzzzxxzxxxzxzzzxxzzxzzzxzxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
