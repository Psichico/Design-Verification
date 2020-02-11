class c_33_1;
    integer mx_opcode = 0; // ( mx.opcode = trand::icmd::E_reset ) 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:40)
    {
       (mx_opcode == 3 /* trand::icmd::E_pushcomplete */);
    }
endclass

program p_33_1;
    c_33_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xz1z0zxx00x0z110zx0zxx00z11xz100zzxzzzzzzxxzxxxxzzxzxzzxzxxxxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
