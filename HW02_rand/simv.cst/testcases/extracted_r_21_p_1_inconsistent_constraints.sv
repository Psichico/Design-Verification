class c_21_1;
    integer mx_opcode = 0; // ( mx.opcode = trand::icmd::E_reset ) 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:46)
    {
       (mx_opcode == 3 /* trand::icmd::E_pushcomplete */);
    }
endclass

program p_21_1;
    c_21_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1zxzxz011xz01xzxx00z01x01xz0z01zzxxzzxzxxzzzzzzzzxxzxzxxzxzxzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
