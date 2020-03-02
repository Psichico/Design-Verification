//
// An interface for the vend problem
//
interface vend_intf(input reg clk,input reg reset);
    reg detect_5;
    reg detect_10;
    reg detect_25;
    reg [9] amount;
    reg buy;
    reg return_coins;
    reg empty_5;
    reg empty_10;
    reg empty_25;
    reg ok;
    reg return_5;
    reg return_10;
    reg return_25;
    
    modport vnd(input clk, input reset, input detect_5, input detect_10,
        input detect_25, input amount, input buy, input return_coins,
        input empty_5, input empty_10, input empty_25, output ok,
        output return_5, output return_10, output return_25);


endinterface : vend_intf








