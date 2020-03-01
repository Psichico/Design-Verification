class my_driver extends uvm_driver #(my_sequence_item);
	`uvm_component_utils(my_driver)

	function new(string name = "my_driver", uvm_component parent = null);
		super.new(name, parent);
	endfunction

	// Instantiate interface, sequence item. 
	virtual vend_intf intf;	
    my_sequence_item seq_itm; 
	
	function void build_phase(uvm_phase phase);
		super.build_phase (phase);
		// VOID: uvm_config_db#(type T = int)::set(uvm_component cntxt, string inst_name, string field_name, T value);
		// BIT:  uvm_config_db#(type T = int)::get(uvm_component cntxt, string inst_name, string field_name, ref T value);
		if (!uvm_config_db#(virtual vend_intf)::get(this, "*", "my_interface", intf))
		begin	
			`uvm_fatal("DRIVER", "Could not get virtual interface") 
		end
	endfunction

	task run_phase (uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("DRIVER","RUN PHASE", UVM_MEDIUM);
		forever begin
	    @(posedge intf.clk);	
            seq_item_port.get_next_item(seq_itm);
			drive(seq_itm);
            //`uvm_info("DRIVER", $sformatf(" ", ), UVM_MEDIUM)	 	
            seq_item_port.item_done();
		end
	endtask : run_phase

        virtual task drive(my_sequence_item seq_itm);
            //drive all the inputs in your DUT
            `uvm_info("DRIVER", $sformatf("Driving Sequence"), UVM_MEDIUM)
        endtask : drive


endclass : my_driver
