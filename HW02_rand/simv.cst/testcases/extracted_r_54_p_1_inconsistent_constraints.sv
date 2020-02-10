class c_54_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_54_1;
    c_54_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1xz01z11xz1z0x1zz00x001101zxzx10zzzzzzzzxzxxxxzzxzzxzxxxxxxxxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
