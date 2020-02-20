// There are a few things that you try to understand some UVM macros. 
// 1. `uvm_info is a UVM Macro. Replace `uvm_info with uvm_report_info. 
//    Observe the difference between the simulation Outputs. Sample is given in build_phase, but its commented out. 
// 2. Replace UVM_LOW  with UVM_MEDIUM or UVM_HIGH at a couple of places. 
//    Observe the difference between the simulation outputs.
// 3. Also see how get_type_name or get_full_name is used. We can also use our own string, if that's convenient to use. 

class fifo_driver extends uvm_driver; 
  
  `uvm_component_utils(fifo_driver)

  function new(string name="fifo_driver", uvm_component parent=null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("FIFO_WR_DRIVER","This is Build Phase - fifo wr driver", UVM_LOW)
    // uvm_report_info(get_full_name(),"This is Build Phase", UVM_LOW);
  endfunction 
 
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("FIFO_WR_DRIVER","This is Connect Phase - fifo wr driver", UVM_LOW)
  endfunction
  
  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("FIFO_WR_DRIVER","This is End of elaboration Phase - fifo wr driver", UVM_LOW)
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
    `uvm_info("FIFO_WR_DRIVER","This is Run Phase - fifo wr driver", UVM_LOW)
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

  
endclass: fifo_driver