class c_28_1;
    integer mx_opcode = 0; // ( mx.opcode = trand::icmd::E_reset ) 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:40)
    {
       (mx_opcode == 3 /* trand::icmd::E_pushcomplete */);
    }
endclass

program p_28_1;
    c_28_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0zx011z0xzxx01zz00zx01x1010x1zz1zxxxxxxzzzzzzzzzxzxxxzzxxxxzxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
