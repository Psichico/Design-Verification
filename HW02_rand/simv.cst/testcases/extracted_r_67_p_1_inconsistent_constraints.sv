class c_67_1;

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (s0.svh:83)
    {
       (3 /* trand::icmd::E_pushcomplete */ == 0);
    }
endclass

program p_67_1;
    c_67_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1001zxxz0zz1xzx101zxxx0xz0z11010xxzzxzzxxzzxzxxxzxzxxzzxzzxxzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
