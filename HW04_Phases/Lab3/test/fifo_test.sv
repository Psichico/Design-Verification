// Testbench defines the verification environment Topology.
// A UVM test enables the configuration of the testbench and interface UVCs. It also defines the 
// default sequences for the testbench Sequencers to execute. 
// A test provides data and sequence generation and inline constraints. 
// Test has a global function called 'run_test()' Name of the test is provided as an argument to the run_test().

// 

// Please type all the phases here, as we have done in ENV Class.  
// We will also create an 'env' class object in this class in build_phase.

class fifo_test extends uvm_test; 
  
  `uvm_component_utils(fifo_test)

  // Declare Env/UVC class handle here. 

  function new(string name="fifo_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // Create Object of Env Class here. 
    `uvm_info("fifo_test","This is Build Phase - fifo_test", UVM_LOW)
  endfunction

// Please TYPE rest of the code. 

// Please include all the phases that are present in Agent.

// Note: In end_of_elaboration_phase add, "uvm_top.print_topology(); to see the hierarchy built"
				

endclass : fifo_test 