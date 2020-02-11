class c_36_1;
    integer mx_opcode = 0; // ( mx.opcode = trand::icmd::E_reset ) 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:46)
    {
       (mx_opcode == 3 /* trand::icmd::E_pushcomplete */);
    }
endclass

program p_36_1;
    c_36_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xzz00x1xx1100zx00x1x1x100xz10zx0zxxzzzzzxzzxzzxzzzzzzxxzzxxzzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
