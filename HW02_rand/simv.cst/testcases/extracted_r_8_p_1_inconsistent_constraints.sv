class c_8_1;
    integer mx_opcode = 0; // ( mx.opcode = trand::icmd::E_reset ) 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:40)
    {
       (mx_opcode == 3 /* trand::icmd::E_pushcomplete */);
    }
endclass

program p_8_1;
    c_8_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xz1x1z101x0zz101xz1011z01x010zzxzxzzzxxxxzxzzxxxxxxzxxxxzzzzxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
