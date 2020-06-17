// There are 2 types of agents: Active & Passive. 
// In Active agent class,  we typically create its sub-components: 1: Driver(If agent is active)
//							   	   2. Sequencer(If agent is active)
// 							   	   3. Monitor  (We create it either way)
// In Passive agent class, we typically create its sub-components: 1. Monitor 

// We also Connect Driver and Sequencer here, in this class, but that is not the scope of this assignment.

// In this class, we do exactly what we did in Driver Class. 
// EXCEPT: we have to create Driver class object in this class & we do that in build_phase.
// So please TYPE all the phases that we have in Driver Class(PLEASE TYPE, THE INTENTION HERE IS TO 
// MAKE YOU LEARN PHASES. PLEASE DO NOT COPY PASTE TO SAVE TIME, THIS ASSIGNMENT IS FOR YOU!! :) 

class fifo_agent extends uvm_agent;

	`uvm_component_utils(fifo_agent)

	// Declare Driver class handle here. 
	// Usage:  Driver_ClassName   Driver_HandleName; 

	fifo_driver drv;

	function new(string name="fifo_agent", uvm_component parent=null);
		super.new(name, parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		// Create Object of Driver Class here. 
		// Usage: Driver_HandleName = Driver_ClassName::create::type_id("Driver_HandleName", this); 
		// 'this' represents current class name, and it means current class is the Driver's parent.
		drv = fifo_driver::type_id::create("drv", this);

		`uvm_info("FIFO_AGENT","This is Build Phase - fifo wr agent", UVM_LOW)
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info("FIFO_WR_AGENT","This is Connect Phase - fifo wr agent", UVM_LOW)
	endfunction

	function void end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
		`uvm_info("FIFO_WR_AGENT","This is End of elaboration Phase - fifo wr agent", UVM_LOW)
	endfunction : end_of_elaboration_phase

	function void start_of_simulation_phase(uvm_phase phase);
		super.start_of_simulation_phase(phase);
		`uvm_info(get_type_name(),{"start of simulation", get_full_name()},UVM_LOW)                   
	endfunction : start_of_simulation_phase


	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		#10 
		`uvm_info("FIFO_WR_AGENT","This is Run Phase - fifo wr agent", UVM_LOW)
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


endclass : fifo_agent 
