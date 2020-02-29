`include "package.sv"

import uvm_pkg::*;
import hw06_monitor::*; 

`include "interface.sv"

module top();

    //instantiate interface
	my_interface intf(clk , rst);
	
    //instantiate DUT
	alu dut(.clk(intf.clk), .rst(intf.rst), .pushin(intf.pushin), .stopout(intf.stopout), .ctl(intf.ctl), .a(intf.a), 
			.b(intf.b), .ci(intf.ci), .pushout(intf.pushout), .cout(intf.cout), .z(intf.z), .stopin(intf.stopin));
	
	initial begin	
    	uvm_config_db #(virtual my_interface)::set(null, "*", "my_interface", intf);
		run_test("my_test");
	end
	
	initial begin
		repeat(1000)
		begin
			#1 clk = 0;
			#1 clk = 1;
		end
	end
	
	initial begin
		#1000		$finish;
	end
	initial begin
		//$dumpfile("dump.vcd");
		//$dumpvars();
	end
endmodule

