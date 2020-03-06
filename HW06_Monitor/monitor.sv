class my_monitor extends uvm_monitor;
    `uvm_component_utils(my_monitor)

	//instantiate interface, sequence item, analysis port
	uvm_analysis_port #(my_sequence_item) monitor_port;
	virtual	vend_intf intf;
	my_sequence_item seq_itm;
	
	function new (string name = "my_monitor", uvm_component parent = null);
		super.new(name, parent);
	endfunction
	
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		monitor_port = new("monitor_port", this);
		if (!uvm_config_db#(virtual vend_intf)::get(this, "*", "my_interface", intf))
		begin
			`uvm_fatal("MONITOR", "Could not get virtual interface")
		end
	endfunction

	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("MONITOR","RUN PHASE", UVM_MEDIUM);
		    seq_itm = my_sequence_item::type_id::create("seq_itm",this); //should I create this here??           
        forever begin
        @(posedge intf.clk);
			//`uvm_info("MONITOR_IN", $sformatf("In run phase of monitor"), UVM_NONE)
			get_from_intf(seq_itm);
           @(posedge intf.clk);
            monitor_port.write(seq_itm);
                @(posedge intf.clk);
                seq_itm.buy = 0;
                monitor_port.write(seq_itm);
            //`uvm_info("MON", $sformatf("%d  %d  %d  %d", intf.return_5, intf.return_10, intf.return_25, intf.ok), UVM_MEDIUM)
		end	
	endtask

	virtual task get_from_intf(my_sequence_item seq_itm);
		 	seq_itm.detect_5 = intf.detect_5;
            seq_itm.detect_10 = intf.detect_10;
            seq_itm.detect_25 = intf.detect_25;
            seq_itm.amount = intf.amount;
            seq_itm.buy = intf.buy;
            seq_itm.return_coins = intf.return_coins ;
            seq_itm.empty_5 = intf.empty_5;
            seq_itm.empty_10 = intf.empty_10;
            seq_itm.empty_25 = intf.empty_25;
	endtask: get_from_intf

endclass : my_monitor
