class my_monitor extends uvm_monitor;
    `uvm_component_utils(my_monitor)

	uvm_analysis_port #(my_packet) monitor_port;
	virtual	my_interface intf;
	my_packet pkt_itm;
	
	function new (string name = "my_monitor", uvm_component parent = null);
		super.new(name, parent);
	endfunction
	
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		monitor_port = new("monitor_port", this);
		if (!uvm_config_db#(virtual my_interface)::get(this, "", "my_interface", intf))
		begin
			`uvm_fatal("MON", "Could not get vif")
		end
	endfunction

	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("MONITOR","RUN PHASE", UVM_NONE);
		
        forever begin    
            @(posedge intf.clk);// or negedge intf.clk);
		    pkt_itm = my_sequence_item::type_id::create("pkt_itm",this);
			pkt_itm.ctl = intf.ctl;
			pkt_itm.test_bit_a = intf.a;
			pkt_itm.test_bit_b = intf.b;
            //@(posedge intf.clk);
            pkt_itm.z = intf.z;
            monitor_port.write(pkt_itm);
		end	
	endtask

endclass : my_monitor
