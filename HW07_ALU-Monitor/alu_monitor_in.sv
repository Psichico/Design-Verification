class my_monitor_in extends uvm_monitor;
    `uvm_component_utils(my_monitor_in)

	uvm_analysis_port #(my_sequence_item) monitor_port;
	virtual	alu_if intf;
	my_sequence_item seq_itm;
	
	function new (string name = "my_monitor_in", uvm_component parent = null);
		super.new(name, parent);
	endfunction
	
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		monitor_port = new("monitor_port", this);
		if (!uvm_config_db#(virtual alu_if)::get(this, "", "alu_if", intf))
		begin
			`uvm_fatal("MONITOR_IN", "Could not get virtual interface")
		end
	endfunction

	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("MONITOR_IN","RUN PHASE", UVM_MEDIUM);
		seq_itm = my_sequence_item::type_id::create("seq_itm",this);
        forever begin
        @(posedge intf.clk);
			
		    if(intf.pushin == 1)
			begin
				#1;
				seq_itm.ctl = intf.ctl;
				seq_itm.test_bit_a = intf.a;
				seq_itm.test_bit_b = intf.b;
				seq_itm.ci = intf.ci;
				monitor_port.write(seq_itm);
			end
		end	
	endtask 

endclass : my_monitor_in
