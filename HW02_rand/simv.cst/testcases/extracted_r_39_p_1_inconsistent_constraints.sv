class c_39_1;
    integer mx_opcode = 0; // ( mx.opcode = trand::icmd::E_reset ) 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:44)
    {
       (mx_opcode == 1 /* trand::icmd::E_push */);
    }
endclass

program p_39_1;
    c_39_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1z0z1xx111x1zxxz0x0xzxzxx11zzx0xzzxxzzzzzzxzxzxzzxzxxzxxxxzzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
