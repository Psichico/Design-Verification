
package jems;

import uvm_pkg::*;

class my_sequence_item extends uvm_sequence_item;

	rand bit [3:0] test_bit;

	`uvm_object_utils_begin(my_sequence_item)
		`uvm_field_int(test_bit, UVM_ALL_ON)
	`uvm_object_utils_end
	
	function new(string name = "my_sequence_item");
		super.new(name);
	endfunction

endclass : my_sequence_item

/////////////////////////////////////////////////////////////////////////////////////////

class my_sequence extends uvm_sequence;
	
	`uvm_object_utils(my_sequence)

	function new(string name = "my_sequence");
		super.new(name);
	endfunction

	task body ();
		//create data and send
		my_sequence_item seq_itm = my_sequence_item::type_id::create("seq_itm");
		start_item(seq_itm);
		seq_itm.randomize();
		seq_itm.print();
		finish_item(seq_itm);	
	endtask

endclass : my_sequence

/////////////////////////////////////////////////////////////////////////////////////////
/*
class my_sequencer extends uvm_sequencer; // #(my_seq_item);
	`uvm_component_utils(my_sequencer)

	function new(string name="my_sequencer", uvm_component parent);
		super.new(name,parent);
	endfunction

endclass
*/
/////////////////////////////////////////////////////////////////////////////////////////

class my_driver extends uvm_driver #(my_sequence_item);
	
	`uvm_component_utils(my_driver)

	function new(string name = "my_driver", uvm_component parent = null);
		super.new(name, parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase (phase);
	endfunction

	task run_phase (uvm_phase phase);
		super.run_phase(phase);
		
		forever begin
			my_sequence_item seq_itm;
			seq_item_port.get_next_item(seq_itm);
			
			seq_item_port.item_done();
		end
	endtask

endclass : my_driver

/////////////////////////////////////////////////////////////////////////////////////////

class my_agent extends uvm_agent;
	`uvm_component_utils(my_agent)

	function new (string name, uvm_component parent=null);
		super.new(name, parent);
	endfunction

	my_driver drv_alu;
//	my_sequencer seqr_alu;
	uvm_sequencer #(my_sequence_item) sqr0;
	
	function void build_phase (uvm_phase phase);
		drv_alu = my_driver::type_id::create("DRIVER",this);
		//seqr_alu = my_sequencer::type_id::create("SEQUENCER",this);
		sqr0 = uvm_sequencer#(my_sequence_item)::type_id::create("sqr0",this);
	endfunction

	function void connect_phase(uvm_phase phase);
		drv_alu.seq_item_port.connect(sqr0.seq_item_export);
	endfunction

endclass : my_agent

/////////////////////////////////////////////////////////////////////////////////////////

class my_environment extends uvm_env;
	`uvm_component_utils(my_environment)

	function new (string name="my_environment", uvm_component parent=null);
		super.new(name,parent);
	endfunction
	
	my_agent agnt_alu;
	
	//my_scoreboard sb_alu;
	virtual function void build_phase(uvm_phase phase);
		super.build_phase (phase);
		agnt_alu = my_agent::type_id::create("agnt_alu",this);
		//sb_alu = sb_alu::type_id::create ("sb_alu", this);
	endfunction

	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		//
	endfunction

endclass : my_environment

/////////////////////////////////////////////////////////////////////////////////////////

class my_test extends uvm_test;

	`uvm_component_utils(my_test)

	function new (string name = "my_test", uvm_component parent = null);
		super.new(name, parent);
	endfunction

	my_environment env_alu;

	virtual function void build_phase (uvm_phase phase);
		super.build_phase (phase);
		env_alu = my_environment::type_id::create("ENV_ALU", this);
	endfunction

	function void end_of_elaboration_phase(uvm_phase phase);
		uvm_top.print_topology();
	endfunction

	task run_phase(uvm_phase phase);
		my_sequence seq_alu = my_sequence::type_id::create("seq_alu",this);
		phase.raise_objection(this);
		seq_alu.start(env_alu.agnt_alu.sqr0);
		phase.drop_objection(this);
	endtask

endclass : my_test

endpackage : jems

import uvm_pkg::*;
import jems::*;

module top();
	initial begin
		run_test("my_test");
	end
endmodule

