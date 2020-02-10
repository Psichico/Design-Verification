class c_70_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_70_1;
    c_70_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "001z010zz1x11011zx100z1z1zxx0x0zxzxxxzzxxxzzxxxzzzzxzzzxxxzxxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
