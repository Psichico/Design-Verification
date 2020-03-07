class my_test extends uvm_test;
	`uvm_component_utils(my_test)

	function new (string name = "my_test", uvm_component parent = null);
		super.new(name, parent);
	endfunction

    //instantiate Environment, interface, sequence
	my_environment env; 
	virtual vend_intf intf; 
	my_sequence seq;
	
	virtual function void build_phase (uvm_phase phase);
		super.build_phase (phase);
		env = my_environment::type_id::create("ENV", this);
		if (!uvm_config_db#(virtual vend_intf)::get(this, "*", "my_interface", intf))
			`uvm_fatal("TEST", "Could not get virtual interface")
	endfunction

	function void end_of_elaboration_phase(uvm_phase phase);
		uvm_top.print_topology();
	endfunction

	task run_phase(uvm_phase phase);
		phase.raise_objection(this);
	    seq = my_sequence::type_id::create("SEQUENCE",this);
		seq.start(env.agnt.sqr);
		//#50;
		phase.drop_objection(this);
	endtask

endclass : my_test

