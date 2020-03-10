class my_monitor_out extends uvm_monitor;
    `uvm_component_utils(my_monitor_out)

	uvm_analysis_port #(my_sequence_item) monitor_port;
	virtual	alu_if intf;
	my_sequence_item seq_itm;
	
	function new (string name = "my_monitor_out", uvm_component parent = null);
		super.new(name, parent);
	endfunction
	
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		monitor_port = new("monitor_port", this);
		if (!uvm_config_db#(virtual alu_if)::get(this, "*", "my_interface", intf))
		begin
			`uvm_fatal("MONITOR_OUT", "Could not get V-Interface")
		end
	endfunction

	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("MONITOR_OUT","RUN PHASE", UVM_NONE);
		seq_itm = my_sequence_item::type_id::create("seq_itm",this);
        forever begin    
            @(posedge intf.clk);
			if(intf.pushout == 1)
			begin
				#1;
				seq_itm.z = intf.z;
				seq_itm.pushout = intf.pushout;
				seq_itm.cout = intf.cout;
				seq_itm.stopout = intf.stopout;
				//`uvm_info("MONITOR_OUT", $sformatf("z=%d",seq_itm.z), UVM_NONE)
				monitor_port.write(seq_itm);
			end
		end	
	endtask

endclass : my_monitor_out
