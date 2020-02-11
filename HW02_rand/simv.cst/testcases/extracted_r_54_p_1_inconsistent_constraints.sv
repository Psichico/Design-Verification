class c_54_1;
    integer mx_opcode = 0; // ( mx.opcode = trand::icmd::E_reset ) 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:44)
    {
       (mx_opcode == 1 /* trand::icmd::E_push */);
    }
endclass

program p_54_1;
    c_54_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1xz01z11xz1z0x1zz00x001101zxzx10zzzzzzzzxzxxxxzzxzzxzxxxxxxxxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
