
class alu_monitor extends uvm_monitor;

	`uvm_component_utils(monitor)

	function new (string name = "monitor", uvm_component parent = null);
		super.new(name, parent);
	endfunction

	uvm_analysis_port #(my_sequence_item) monitor_port;

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		monitor_port = new("monitor_port", this);
		//connect interfface here
	endfunction

	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("MONITOR","RUN PHASE", UVM_MEDIUM);
		// add interface items here
	endtask

endclass
