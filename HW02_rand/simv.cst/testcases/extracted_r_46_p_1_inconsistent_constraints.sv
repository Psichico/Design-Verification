class c_46_1;
    integer mx_opcode = 0; // ( mx.opcode = trand::icmd::E_reset ) 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:46)
    {
       (mx_opcode == 3 /* trand::icmd::E_pushcomplete */);
    }
endclass

program p_46_1;
    c_46_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "01011x1z01zzz1110zx0xxz000x10011zzxzzzzxxxxzxzxxzxxxxxzzzxzzzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
