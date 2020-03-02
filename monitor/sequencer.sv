class sequencer extends uvm_sequencer #(sequence_item);
	`uvm_sequencer_utils(sequencer)
	
	function new(string name="sequencer",uvm_component parent);
		super.new(name,parent);
	endfunction : new
	
	function void build_phase(uvm_phase phase);
		`uvm_info("sequencer","build phase",UVM_MEDIUM);
	endfunction : build_phase
	
	task run_phase(uvm_phase phase);
		`uvm_info("sequencer","packet sent",UVM_MEDIUM);
	endtask : run_phase
	
endclass : sequencer
