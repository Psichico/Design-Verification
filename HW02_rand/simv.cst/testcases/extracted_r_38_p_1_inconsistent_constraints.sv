class c_38_1;
    integer mx_opcode = 0; // ( mx.opcode = trand::icmd::E_reset ) 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:40)
    {
       (mx_opcode == 3 /* trand::icmd::E_pushcomplete */);
    }
endclass

program p_38_1;
    c_38_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zzxxxzx001x1000x0x001x0z10xx01zxzxxxzzzzzxzxxxxzzzzxxxxxxzzxzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
