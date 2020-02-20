// Testbench defines the verification environment Topology.
// A UVM test enables the configuration of the testbench and interface UVCs. It also defines the 
// default sequences for the testbench Sequencers to execute. 
// A test provides data and sequence generation and inline constraints. 
// Test has a global function called 'run_test()' Name of the test is provided as an argument to the run_test().

// Please type all the phases here, as we have done in ENV Class.  
// We will also create an 'env' class object in this class in build_phase.

class fifo_test extends uvm_test; 

	`uvm_component_utils(fifo_test)

	// Declare Env/UVC class handle here. 
	fifo_env env;

	function new(string name="fifo_test", uvm_component parent=null);
		super.new(name, parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		// Create Object of Env Class here. 
		env = fifo_env::type_id::create("env",this);
		`uvm_info("fifo_test","This is Build Phase - fifo_test", UVM_LOW)
	endfunction

	// Please TYPE rest of the code. 

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info("FIFO_WR_TEST","This is Connect Phase - fifo wr test", UVM_LOW)
	endfunction


	function void end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
		uvm_top.print_topology();
		`uvm_info("FIFO_WR_TEST","This is End of elaboration Phase - fifo wr test", UVM_LOW)
	endfunction : end_of_elaboration_phase

	function void start_of_simulation_phase(uvm_phase phase);
		super.start_of_simulation_phase(phase);
		`uvm_info(get_type_name(),{"start of simulation", get_full_name()},UVM_LOW)                   
	endfunction : start_of_simulation_phase

	// This is the only phase that can take delay or clock cyles.  
	// Key to remember this, run_phase is a task. 
	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		#10 
		`uvm_info("FIFO_WR_TEST","This is Run Phase - fifo wr test", UVM_LOW)
	endtask : run_phase

	function void extract_phase(uvm_phase phase);
		super.extract_phase(phase);
		`uvm_info(get_type_name(),{"Extract Phase", get_full_name()},UVM_LOW)                   
	endfunction : extract_phase

	function void check_phase(uvm_phase phase);
		super.check_phase(phase);
		`uvm_info(get_type_name(),{"start of Check Phase", get_full_name()},UVM_LOW)                   
	endfunction

	function void report_phase(uvm_phase phase);
		super.report_phase(phase);
		`uvm_info(get_type_name(),{"start of Report Phase", get_full_name()},UVM_LOW)                   
	endfunction

	function void final_phase(uvm_phase phase);
		super.final_phase(phase);
		`uvm_info(get_type_name(),{"start of Final Phase", get_full_name()},UVM_LOW)
	endfunction


endclass : fifo_test 
