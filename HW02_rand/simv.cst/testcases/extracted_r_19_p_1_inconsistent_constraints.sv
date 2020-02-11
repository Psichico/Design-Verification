class c_19_1;
    integer mx_opcode = 0; // ( mx.opcode = trand::icmd::E_reset ) 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:44)
    {
       (mx_opcode == 1 /* trand::icmd::E_push */);
    }
endclass

program p_19_1;
    c_19_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1101x0z000zx01zz11xzx001xx0zzxzzxxxzxzxzzzxxzxxxzxxxzxzxxzzxxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
