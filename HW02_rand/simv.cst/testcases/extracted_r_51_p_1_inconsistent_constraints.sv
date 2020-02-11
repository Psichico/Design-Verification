class c_51_1;
    integer mx_opcode = 0; // ( mx.opcode = trand::icmd::E_reset ) 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:46)
    {
       (mx_opcode == 3 /* trand::icmd::E_pushcomplete */);
    }
endclass

program p_51_1;
    c_51_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "10110xx1x1zx0zxx1xz0xzxzx110z1x1zzxzxzxxzxzxzxzzzxzxxzzxxxzxzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
