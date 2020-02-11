class c_29_1;
    integer mx_opcode = 0; // ( mx.opcode = trand::icmd::E_reset ) 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:44)
    {
       (mx_opcode == 1 /* trand::icmd::E_push */);
    }
endclass

program p_29_1;
    c_29_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "000zzx1zzz01x1x1xz1xz0xxzxzz1z0xxxzxxzxzzzxzzxzxzzxzzxxzxzzxxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
