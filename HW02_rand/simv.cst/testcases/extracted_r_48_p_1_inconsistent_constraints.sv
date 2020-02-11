class c_48_1;
    integer mx_opcode = 0; // ( mx.opcode = trand::icmd::E_reset ) 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:40)
    {
       (mx_opcode == 3 /* trand::icmd::E_pushcomplete */);
    }
endclass

program p_48_1;
    c_48_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0zx00zz100000z0z1zxx10100zxzzx10xxxzxxzzxzxxxzxxzzzxxxzzxzzzzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
