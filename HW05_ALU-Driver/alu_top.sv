
package ALU_sequence; //user's package

import uvm_pkg::*; //necessary to include this package in user's package

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
	initial begin
		run_test("my_test");
	end
endmodule

