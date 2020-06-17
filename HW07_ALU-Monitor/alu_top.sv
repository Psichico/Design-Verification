package ALU_sequence; //user's package

import uvm_pkg::*; //necessary to include this package in user's package
`include "alu_sequence_item.sv"
`include "alu_sequence.sv"
`include "alu_sequencer.sv"
`include "alu_driver.sv"
`include "alu_monitor_in.sv"
`include "alu_monitor_out.sv"
`include "alu_agent.sv"
`include "alu_scoreboard.sv"
`include "alu_environment.sv"
`include "alu_test.sv"


endpackage : ALU_sequence

import uvm_pkg::*;
import ALU_sequence::*; //inside module or not??

	
`include "./ALU_DUTs/if.sv"


module top();
	reg clk;
	reg rst;
	
	alu_if intf(.clk(clk), .rst(rst));
	
	alu dut(.clk(clk), .rst(rst), .pushin(intf.pushin), .stopout(intf.stopout), .ctl(intf.ctl), .a(intf.a), 
			.b(intf.b), .ci(intf.ci), .pushout(intf.pushout), .cout(intf.cout), .z(intf.z), .stopin(intf.stopin));
	
	initial begin	
    	uvm_config_db #(virtual alu_if)::set(null, "*", "alu_if", intf);
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
		rst = 0;
		#1;
		rst = 1;
		#10;
		rst = 0;
		#1000		$finish;
	end
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars();
	end
endmodule

