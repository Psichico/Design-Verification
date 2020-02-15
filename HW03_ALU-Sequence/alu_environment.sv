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

