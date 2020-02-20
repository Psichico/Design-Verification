// This is the top container class of Reusable UVCs(Universal Verification Component). 
// Env class Encapsulates multiple Agents, Scoreboards, Virtual Sequences, etc. 
// Most Verification Reuse occurs at Env level. 


// Please type all the phases here, as we have done in Agent Class.  
// We will also create an Agent class object in this class in build_phase.

class fifo_env extends uvm_env;

	`uvm_component_utils(fifo_env)

	// Declare Agent class handle here. 
	// Usage:  Agent_ClassName   Agent_HandleName; 
	fifo_agent agnt;

	function new(string name="fifo_env", uvm_component parent=null);
		super.new(name, parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		// Create Object of Agent Class here. 
		agnt = fifo_agent::type_id::create("agnt",this);
		`uvm_info("FIFO_ENV","This is Build Phase - fifo wr env", UVM_LOW)
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info("FIFO_WR_ENV","This is Connect Phase - fifo wr env", UVM_LOW)
	endfunction

	function void end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
		`uvm_info("FIFO_WR_ENV","This is End of elaboration Phase - fifo wr env", UVM_LOW)
	endfunction : end_of_elaboration_phase

	function void start_of_simulation_phase(uvm_phase phase);
		super.start_of_simulation_phase(phase);
		`uvm_info(get_type_name(),{"start of simulation", get_full_name()},UVM_LOW)                   
	endfunction : start_of_simulation_phase


	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		#10 
		`uvm_info("FIFO_WR_ENV","This is Run Phase - fifo wr env", UVM_LOW)
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


endclass : fifo_env 
