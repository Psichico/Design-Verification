class my_environment extends uvm_env;
	`uvm_component_utils(my_environment)

	function new (string name="my_environment", uvm_component parent=null);
		super.new(name,parent);
	endfunction
	
	//instantiate scoreboard, agent(driver, sequencer, monitor) here.
	my_agent agnt;
	my_scoreboard sb;
	ref_model ref_mon;
	
	virtual function void build_phase(uvm_phase phase);
		super.build_phase (phase);
		agnt = my_agent::type_id::create("AGENT",this);
		sb = my_scoreboard::type_id::create ("SCOREBOARD", this);
		ref_mon = ref_model::type_id::create("REFERENCE MONITOR",this);
	endfunction

	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		agnt.mon.monitor_port.connect(sb.in_port);
		ref_mon.ref_port.connect(sb.out_port);
	endfunction

	task run_phase (uvm_phase phase);
		`uvm_info("ENV","RUN PHASE", UVM_MEDIUM);
	endtask : run_phase
	
endclass : my_environment

