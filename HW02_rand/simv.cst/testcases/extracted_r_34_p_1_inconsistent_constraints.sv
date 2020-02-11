class c_34_1;
    integer mx_opcode = 0; // ( mx.opcode = trand::icmd::E_reset ) 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:44)
    {
       (mx_opcode == 1 /* trand::icmd::E_push */);
    }
endclass

program p_34_1;
    c_34_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z0x1x0x0zxz1zxx0zxxxzzz1xz1x010xxxzzxzzxzxzzzxzzxzxxxzzzxzzzxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
