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

  function new(string name="fifo_agent", uvm_component parent=null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // Create Object of Driver Class here. 
    // Usage: Driver_HandleName = Driver_ClassName::create::type_id("Driver_HandleName", this); 
    // 'this' represents current class name, and it means current class is the Driver's parent. 
    `uvm_info("FIFO_AGENT","This is Build Phase - fifo wr driver", UVM_LOW)
  endfunction

// Please TYPE rest of the code. 

// Please include all the phases that are present in Driver.

endclass : fifo_agent 