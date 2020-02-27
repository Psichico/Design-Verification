class my_test extends uvm_test;

	`uvm_component_utils(my_test)

	function new (string name = "my_test", uvm_component parent = null);
		super.new(name, parent);
	endfunction

	my_environment env_alu; 
	virtual my_interface intf; 
	my_sequence seq_alu;
	
	virtual function void build_phase (uvm_phase phase);
		super.build_phase (phase);
		env_alu = my_environment::type_id::create("env_alu", this);
		if (!uvm_config_db#(virtual my_interface)::get(this, "", "my_interface", intf))
			`uvm_fatal("TEST", "Could not get vif")
		uvm_config_db#(virtual my_interface)::set(this, "*", "my_interface", intf);

	endfunction

	function void end_of_elaboration_phase(uvm_phase phase);
		uvm_top.print_topology();
	endfunction

	task run_phase(uvm_phase phase);
		phase.raise_objection(this);
	    seq_alu = my_sequence::type_id::create("seq_alu",this);
		seq_alu.start(env_alu.agnt_alu.sqr0);
		#300;
		phase.drop_objection(this);
	endtask

endclass : my_test

