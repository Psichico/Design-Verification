`include "/home/morris/uvm-1.2/src/uvm_macros.svh"
`include "/home/014512836/pal/273/monitor/package.sv"

module top();

import uvm_pkg::*;

    initial begin
        run_test("test");
    end

    initial begin
        #200;
        $finish;
    end

endmodule
