class c_24_1;
    integer mx_opcode = 0; // ( mx.opcode = trand::icmd::E_reset ) 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:44)
    {
       (mx_opcode == 1 /* trand::icmd::E_push */);
    }
endclass

program p_24_1;
    c_24_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "10zz10z00xz1x010110xx00zx110z1zzzzxzxzxzxxzzxxxxxxzzxxxxxzxxxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
