class my_agent extends uvm_agent;
	`uvm_component_utils(my_agent)
	
	function new (string name, uvm_component parent=null);
		super.new(name, parent);
	endfunction
	
	// create analysis port
	uvm_analysis_port #(my_sequence_item) agent_port;
	//Instantiate driver, sequencer, monitor
	my_driver drv;
	my_sequencer sqr;
	my_monitor_in mon;
//	uvm_sequencer #(my_sequence_item) sqr0; //default sequencer
	
	function void build_phase (uvm_phase phase);
		drv = my_driver::type_id::create("DRIVER",this);
		sqr = my_sequencer::type_id::create("SEQUENCER",this);
		mon = my_monitor_in::type_id::create("MONITOR",this);	
		agent_port = new("agent_port",this);
		//sqr0 = uvm_sequencer#(my_sequence_item)::type_id::create("sqr0",this); //default sequencer
	endfunction

	function void connect_phase(uvm_phase phase); //connect driver to sequencer
		drv.seq_item_port.connect(sqr.seq_item_export);
	endfunction

endclass : my_agent

