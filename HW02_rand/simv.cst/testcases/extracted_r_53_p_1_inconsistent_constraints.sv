class c_53_1;
    integer mx_opcode = 0; // ( mx.opcode = trand::icmd::E_reset ) 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:40)
    {
       (mx_opcode == 3 /* trand::icmd::E_pushcomplete */);
    }
endclass

program p_53_1;
    c_53_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z00001x1z1zz0zxxz01zxzxz1xx0xxzxxzzzxzzzzxzzxzxxxzzxzxzxzxxzxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
