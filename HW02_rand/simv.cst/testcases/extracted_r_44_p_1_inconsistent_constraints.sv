class c_44_1;
    integer mx_opcode = 0; // ( mx.opcode = trand::icmd::E_reset ) 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:44)
    {
       (mx_opcode == 1 /* trand::icmd::E_push */);
    }
endclass

program p_44_1;
    c_44_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z00zzx1x1zxxxzx0x0x11zx101xzx1z1xzzzzzzzzxxzxxzzzxzxxzxzxxxzzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
