
package ALU_sequence; //user's package

import uvm_pkg::*; //necessary to include this package in user's package
`include "alu_interface.sv"
`include "alu_sequence_item.sv"
`include "alu_sequence.sv"
`include "alu_sequencer.sv"
`include "alu_driver.sv"
`include "alu_monitor.sv"
`include "alu_agent.sv"
`include "alu_environment.sv"
`include "alu_test.sv"

endpackage : ALU_sequence

import uvm_pkg::*;
import ALU_sequence::*;

module top();

	alu_interface intf();

	alu dut(.clk(intf.clk), .rst(intf.rst), .pushin(intf.pushin), .stopout(intf.stopout), .ctl(intf.ctl), .a(intf.a), .b(intf.b),
        	.ci(intf.ci), .pushout(intf.pushout), .cout(intf.cout), .z(intf.z), .stopin(intf.stopin));

	initial begin
		clk <= 0;
    	//uvm_config_db #(virtual alu_interface)::set(null, "uvm_test_top", "alu_interface", _intf);
		run_test("my_test");
	end

endmodule

