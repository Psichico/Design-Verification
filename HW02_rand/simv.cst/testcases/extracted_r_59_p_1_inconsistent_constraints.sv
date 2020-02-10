class c_59_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_59_1;
    c_59_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "11xxxzxx1xxz1zz0x10x11xz1xxx0z01xxzxxxzzxzxzxzzxxxxxxxxxxxzxxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
