class my_monitor extends uvm_monitor;
    `uvm_component_utils(my_monitor)

	//instantiate interface, sequence item, analysis port
	uvm_analysis_port #(my_sequence_item) monitor_port;
	virtual	my_interface intf;
	my_sequence_item seq_itm;
	
	function new (string name = "my_monitor", uvm_component parent = null);
		super.new(name, parent);
	endfunction
	
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		monitor_port = new("monitor_port", this);
		if (!uvm_config_db#(virtual my_interface)::get(this, "*", "my_interface", intf))
		begin
			`uvm_fatal("MONITOR", "Could not get virtual interface")
		end
	endfunction

	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("MONITOR","RUN PHASE", UVM_MEDIUM);
        forever begin
            @(posedge intf.clk);
		    seq_itm = my_sequence_item::type_id::create("seq_itm",this); //should I create this here??
            
			//`uvm_info("MONITOR_IN", $sformatf("a=%d, b= %d, ctl=%d",seq_itm.test_bit_a, seq_itm.test_bit_b, seq_itm.ctl), UVM_NONE)
            monitor_port.write(seq_itm);
		end	
	endtask

endclass : my_monitor_in
