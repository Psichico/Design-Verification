class my_agent extends uvm_agent;
	`uvm_component_utils(my_agent)
	
	function new (string name, uvm_component parent=null);
		super.new(name, parent);
	endfunction
	
	uvm_analysis_port #(my_sequence_item) agent_port;

	my_driver drv_alu;
	my_sequencer sqr0;
	my_monitor_in mon_alu;
	
	function void build_phase (uvm_phase phase);
		drv_alu = my_driver::type_id::create("DRIVER",this);
		sqr0 = my_sequencer::type_id::create("SEQUENCER",this);
		mon_alu = my_monitor_in::type_id::create("MONITOR_IN",this);	
		agent_port = new("agent_port",this);
		//sqr0 = uvm_sequencer#(my_sequence_item)::type_id::create("sqr0",this); //default sequencer
	endfunction

	function void connect_phase(uvm_phase phase); //connect driver to sequencer
		drv_alu.seq_item_port.connect(sqr0.seq_item_export);
		//mon_alu.monitor_port.connect(agent_port);
	endfunction

endclass : my_agent

