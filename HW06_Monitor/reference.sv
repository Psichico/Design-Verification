class ref_model extends uvm_monitor;
    `uvm_component_utils(ref_model)

	//instantiate interface, sequence item, analysis port
	uvm_analysis_port #(my_sequence_item) ref_port;
	virtual	vend_intf intf;
	my_sequence_item seq_itm;
	
	function new (string name = "ref_model", uvm_component parent = null);
		super.new(name, parent);
	endfunction
	
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		ref_port = new("ref_port", this);
		if (!uvm_config_db#(virtual vend_intf)::get(this, "*", "my_interface", intf))
		begin
			`uvm_fatal("REF_MODEL", "Could not get virtual interface")
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
            //@(posedge intf.clk);
            ref_port.write(seq_itm);
		   	//`uvm_info("Ref", $sformatf("%d  %d  %d  %d", intf.return_5, intf.return_10, intf.return_25, intf.ok), UVM_MEDIUM)
		end	
	endtask

	virtual task get_from_intf(my_sequence_item seq_itm);
        seq_itm.ok = intf.ok;
        seq_itm.return_5 = intf.return_5;
        seq_itm.return_10 = intf.return_10;
        seq_itm.return_25 = intf.return_25;
	endtask: get_from_intf

endclass : ref_model
