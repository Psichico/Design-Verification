`include "/ALU_DUTs/alu.sv"

package ALU_sequence; //user's package

import uvm_pkg::*; //necessary to include this package in user's package
//`include "alu_interface.sv"
`include "alu_sequence_item.sv"
`include "alu_sequence.sv"
`include "alu_sequencer.sv"
`include "alu_driver.sv"
`include "alu_monitor.sv"
`include "alu_agent.sv"
`include "alu_scoreboard.sv"
`include "alu_environment.sv"
`include "alu_test.sv"


endpackage : ALU_sequence

import uvm_pkg::*;
import ALU_sequence::*; //inside module or not??

	
`include "alu_interface.sv"


module top();
	reg clk;
	reg rst;
	
	my_interface intf(clk , rst);
	
	alu dut(.clk(intf.clk), .rst(intf.rst), .pushin(intf.pushin), .stopout(intf.stopout), .ctl(intf.ctl), .a(intf.a), 
			.b(intf.b), .ci(intf.ci), .pushout(intf.pushout), .cout(intf.cout), .z(intf.z), .stopin(intf.stopin));
	
	initial begin	
    	uvm_config_db #(virtual my_interface)::set(null, "*", "my_interface", intf);
		run_test("my_test");
	end
	
	initial begin
		repeat(100)
		begin
			#1 clk = 0;
			#1 clk = 1;
		end
	end
	
	initial begin
		rst = 0;
		#500 $finish;
	end
endmodule

