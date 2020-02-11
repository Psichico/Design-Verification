class c_13_1;
    integer mx_opcode = 0; // ( mx.opcode = trand::icmd::E_reset ) 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:40)
    {
       (mx_opcode == 3 /* trand::icmd::E_pushcomplete */);
    }
endclass

program p_13_1;
    c_13_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "10xxx10z001xxx011z001xxx110zzzx1zzzxzzzxxxxxxxzxxxxzxxzzxzzzxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
