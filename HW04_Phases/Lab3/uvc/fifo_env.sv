// This is the top container class of Reusable UVCs(Universal Verification Component). 
// Env class Encapsulates multiple Agents, Scoreboards, Virtual Sequences, etc. 
// Most Verification Reuse occurs at Env level. 


// Please type all the phases here, as we have done in Agent Class.  
// We will also create an Agent class object in this class in build_phase.

class fifo_env extends uvm_env;
  
  `uvm_component_utils(fifo_env)

  // Declare Agent class handle here. 
  // Usage:  Agent_ClassName   Agent_HandleName; 

  function new(string name="fifo_env", uvm_component parent=null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // Create Object of Agent Class here. 
    `uvm_info("FIFO_ENV","This is Build Phase - fifo wr driver", UVM_LOW)
  endfunction

// Please TYPE rest of the code. 

// Please include all the phases that are present in Agent.

endclass : fifo_env 