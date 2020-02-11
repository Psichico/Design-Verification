class c_9_1;
    integer mx_opcode = 0; // ( mx.opcode = trand::icmd::E_reset ) 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:44)
    {
       (mx_opcode == 1 /* trand::icmd::E_push */);
    }
endclass

program p_9_1;
    c_9_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "110xxxxzxz01zx0z11z0xx011z00x1z0zxzxxzxzxzxzzxzzxxxzzzxzzzzxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
