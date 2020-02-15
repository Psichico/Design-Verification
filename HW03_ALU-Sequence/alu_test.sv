class my_test extends uvm_test;

	`uvm_component_utils(my_test)

	function new (string name = "my_test", uvm_component parent = null);
		super.new(name, parent);
	endfunction

	my_environment env_alu;

	virtual function void build_phase (uvm_phase phase);
		super.build_phase (phase);
		env_alu = my_environment::type_id::create("ENV_ALU", this);
	endfunction

	function void end_of_elaboration_phase(uvm_phase phase);
		uvm_top.print_topology();
	endfunction

	task run_phase(uvm_phase phase);
		my_sequence seq_alu = my_sequence::type_id::create("seq_alu",this);
		phase.raise_objection(this);
		seq_alu.start(env_alu.agnt_alu.sqr0);
		phase.drop_objection(this);
	endtask

endclass : my_test

