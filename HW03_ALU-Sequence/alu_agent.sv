class my_agent extends uvm_agent;
	`uvm_component_utils(my_agent)

	function new (string name, uvm_component parent=null);
		super.new(name, parent);
	endfunction

	my_driver drv_alu;
	my_sequencer sqr0;
//	uvm_sequencer #(my_sequence_item) sqr0;
	
	function void build_phase (uvm_phase phase);
		drv_alu = my_driver::type_id::create("DRIVER",this);
		sqr0 = my_sequencer::type_id::create("SEQUENCER",this);
		//sqr0 = uvm_sequencer#(my_sequence_item)::type_id::create("sqr0",this);
	endfunction

	function void connect_phase(uvm_phase phase);
		drv_alu.seq_item_port.connect(sqr0.seq_item_export);
	endfunction

endclass : my_agent

