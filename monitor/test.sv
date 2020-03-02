class test extends uvm_test;
    `uvm_component_utils(test)

    my_sequence test_seq;
    my_environment env_glbl;

    //uvm_phase phase;
    
    function new(string name="test",uvm_component parent);
        super.new(name,parent);
    endfunction : new

    function void build_phase(uvm_phase phase);
       env_glbl = my_environment::type_id::create("env_glbl",this);
		`uvm_info("my_environment","build phase",UVM_MEDIUM);
 
	endfunction : build_phase

    task run_phase(uvm_phase phase);
         phase.raise_objection(this);
		test_seq = my_sequence::type_id::create("test_seq",this);
        `uvm_info("my_environment","build phase",UVM_MEDIUM);
         test_seq.start(env_glbl.agnt.seq);		
		#100;
        phase.drop_objection(this);
    endtask : run_phase

endclass : test
