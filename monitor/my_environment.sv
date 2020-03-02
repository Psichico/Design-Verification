class my_environment extends uvm_env;
	`uvm_component_utils(my_environment)
	
	agent agnt;
    scoreboard sbd;

	function new(string name="my_enviroment",uvm_component parent);
		super.new(name,parent);
	endfunction : new
	
	function void build_phase(uvm_phase phase);
		`uvm_info("my_environment","build phase",UVM_MEDIUM);
		sbd = scoreboard::type_id::create("scoreboard",this);
		agnt = agent::type_id::create("agent",this);		
	endfunction : build_phase
	
	function void connect_phase (uvm_phase phase);
        agnt.mtr.tp.connect(sbd.rp);
	endfunction : connect_phase
	
	
	task run_phase(uvm_phase phase);
      `uvm_info("my environment","run phase",UVM_MEDIUM);  
    endtask : run_phase
		
endclass : my_environment
