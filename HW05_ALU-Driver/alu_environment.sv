class my_environment extends uvm_env;
	`uvm_component_utils(my_environment)

	function new (string name="my_environment", uvm_component parent=null);
		super.new(name,parent);
	endfunction
	
	//instantiate scoreboard, agent(driver, sequencer, monitor) here.
	my_agent agnt_alu;
	my_scoreboard sb_alu;
	
	my_monitor_out mon_alu_2;
	
	//create agent and scoreboard
	virtual function void build_phase(uvm_phase phase);
		super.build_phase (phase);
		agnt_alu = my_agent::type_id::create("agnt_alu",this);
		sb_alu = my_scoreboard::type_id::create ("sb_alu", this);
		mon_alu_2 = my_monitor_out::type_id::create("mon_alu_2",this);
	endfunction

	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		//agnt_alu.agent_port.connect(sb_alu.scoreboard_port);
		agnt_alu.mon_alu.monitor_port.connect(sb_alu.scoreboard_port);
		mon_alu_2.monitor_port.connect(sb_alu.scoreboard_port_2);
	endfunction

	task run_phase (uvm_phase phase);
		`uvm_info("my_environment","run phase", UVM_MEDIUM);
	endtask : run_phase
	
endclass : my_environment

