
class my_sequencer extends uvm_sequencer #(my_sequence_item);
	`uvm_component_utils(my_sequencer)

	function new(string name="my_sequencer", uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		`uvm_info("SEQUENCER","BUILD PHASE",UVM_MEDIUM);
	endfunction : build_phase
	
	task run_phase(uvm_phase phase);
		`uvm_info("SEQUENCER","packet sent",UVM_MEDIUM);
	endtask : run_phase

endclass

