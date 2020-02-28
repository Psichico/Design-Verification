class my_monitor_2 extends uvm_monitor;
    `uvm_component_utils(my_monitor_2)

	uvm_analysis_port #(my_sequence_item) monitor_port;
	virtual	my_interface intf;
	my_sequence_item seq_itm;
	
	function new (string name = "my_monitor_2", uvm_component parent = null);
		super.new(name, parent);
	endfunction
	
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		monitor_port = new("monitor_port", this);
		if (!uvm_config_db#(virtual my_interface)::get(this, "*", "my_interface", intf))
		begin
			`uvm_fatal("MON", "Could not get vif")
		end
	endfunction

	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("MONITOR_2","RUN PHASE", UVM_NONE);
		
        forever begin    
            @(posedge intf.clk);// or negedge intf.clk);
		    seq_itm = my_sequence_item::type_id::create("seq_itm",this);
			seq_itm.z = intf.z;
            monitor_port.write(seq_itm);
		end	
	endtask

endclass : my_monitor_2







