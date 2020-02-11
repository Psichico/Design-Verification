class c_31_1;
    integer mx_opcode = 0; // ( mx.opcode = trand::icmd::E_reset ) 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:46)
    {
       (mx_opcode == 3 /* trand::icmd::E_pushcomplete */);
    }
endclass

program p_31_1;
    c_31_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xz101x1zzxxx000zz0100x0x1xzxz000xzzxxxxzzzxzzxzxxxxxzxxxzxzxzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
