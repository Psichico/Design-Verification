class c_11_1;
    integer mx_opcode = 0; // ( mx.opcode = trand::icmd::E_reset ) 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:46)
    {
       (mx_opcode == 3 /* trand::icmd::E_pushcomplete */);
    }
endclass

program p_11_1;
    c_11_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zx1xx1010z0x111x11z10z110zxzz011xxxzxxzzzzxxxxxxzzzzzzzxzxzxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
