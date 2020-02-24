
class alu_monitor extends uvm_monitor;

	`uvm_component_utils(monitor)

	function new (string name = "monitor", uvm_component parent = null);
		super.new(name, parent);
	endfunction

	uvm_analysis_port #(my_sequence_item) monitor_port;

	alu_interface intf();

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		monitor_port = new("monitor_port", this);
		//connect interfface here
	endfunction

	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("MONITOR","RUN PHASE", UVM_MEDIUM);
		// add interface items here
		forever begin
			@(posedge intf.clk);
			if (!rst) begin
				my_sequence_item seq_itm = new;
				seq_itm.stopout <= intf.stopout;
				seq_itm.pushout <= intf.pushout;
				seq_itm.cout <= intf.cout;
				seq_itm.z <= intf.z;
				monitor_port.write(item);
				`uvm_info("MON", $sformatf("ITEM: %s", seq_itm.convert2str()), UVM_HIGH))
			end  	
		
		end
	endtask

endclass
