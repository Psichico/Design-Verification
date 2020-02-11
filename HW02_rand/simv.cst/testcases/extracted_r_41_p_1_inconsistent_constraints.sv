class c_41_1;
    integer mx_opcode = 0; // ( mx.opcode = trand::icmd::E_reset ) 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:46)
    {
       (mx_opcode == 3 /* trand::icmd::E_pushcomplete */);
    }
endclass

program p_41_1;
    c_41_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zz100xxzx00zx10xx0zzz0000111xx0xzxzxxxxxzxxzzxzzxxzzzzxzzzzxxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
