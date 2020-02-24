
class my_monitor extends uvm_monitor;

	`uvm_component_utils(my_monitor)

	function new (string name = "my_monitor", uvm_component parent = null);
		super.new(name, parent);
	endfunction

	uvm_analysis_port #(my_sequence_item) monitor_port;
	virtual	my_interface intf;
	my_sequence_item seq_itm;
	
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
		seq_itm = my_sequence_item::type_id::create("seq_itm",this);
	//	my_sequence_item seq_itm = new;
		`uvm_info("MONITOR","RUN PHASE", UVM_HIGH);
		forever begin
		@(posedge intf.clk);
		//if (!rst) begin
		//	@(intf.a, intf.b);
			//begin
				seq_itm.ctl = intf.ctl;
				seq_itm.test_bit_a = intf.a;
				seq_itm.test_bit_b = intf.b;
				seq_itm.pushin = intf.pushin;
				seq_itm.stopout = intf.stopout;
				seq_itm.pushout = intf.pushout;
				seq_itm.cout = intf.cout;
				seq_itm.z = intf.z;
				`uvm_info("MON", $psprintf("Z : %h", seq_itm.z), UVM_HIGH)
				//`uvm_info("MON", "HERE", UVM_HIGH)
				monitor_port.write(seq_itm);
				#1;
			//end
		end
		
	endtask

endclass
