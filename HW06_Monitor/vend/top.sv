//
// A simple driver for the vending machine
//
`timescale 1us/1ns

`include "vend.sv"

`include "vend_intf.svh"



module top();

reg clk,rst;
vend_intf vendx(clk,rst);

initial begin
    clk=0;
    rst=0;
    #5;
    repeat(1000000) begin
        #5 clk=1;
        #5 clk=0;
    end
    $display("\n\n\nRan out of clocks\n\n\n");
    $finish;
end

initial begin
    uvm_config_db #(virtual vend_intf)::set(null, "*", "vif" , vendx);
    run_test("pathw");
end

vend v(vendx.clk,vendx.reset,vendx.detect_5 
    ,vendx.detect_10 ,vendx.detect_25 ,vendx.amount 
    ,vendx.buy ,vendx.return_coins 
    ,vendx.empty_5 ,vendx.empty_10 ,vendx.empty_25 
    ,vendx.ok ,vendx.return_5 
    ,vendx.return_10 ,vendx.return_25);

endmodule : top

