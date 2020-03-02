class agent extends uvm_agent;
	`uvm_component_utils(agent)
	
	function new (string name, uvm_component parent=null);
		super.new(name, parent);
	endfunction
	
	// create analysis port
	uvm_analysis_port #(sequence_item) port_agnt;

	//Instantiate driver, sequencer, monitor
	driver drv;
	sequencer seq;
	monitor mtr;
//	uvm_sequencer #(my_sequence_item) sqr0; //default sequencer
	
	function void build_phase (uvm_phase phase);
		seq = sequencer::type_id::create("sequencer",this);
		drv = driver::type_id::create("driver",this);
		mtr = monitor::type_id::create("monitor",this);
		port_agnt = new("port_agnt",this);
	endfunction

	function void connect_phase(uvm_phase phase); //connect driver to sequencer
        drv.seq_item_port.connect(seq.seq_item_export);
	endfunction

endclass : agent

