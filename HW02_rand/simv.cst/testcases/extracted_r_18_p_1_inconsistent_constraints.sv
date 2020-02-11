class c_18_1;
    integer mx_opcode = 0; // ( mx.opcode = trand::icmd::E_reset ) 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:40)
    {
       (mx_opcode == 3 /* trand::icmd::E_pushcomplete */);
    }
endclass

program p_18_1;
    c_18_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xz10xz01z10zz1z0010100z001zzz010zxxxzxzxxzxxxzxxxxxzxzxzzxzxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
