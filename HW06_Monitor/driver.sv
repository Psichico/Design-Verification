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
//			assign_values(seq_itm);
			drive(seq_itm);
            //`uvm_info("DRIVER", $sformatf(" ", ), UVM_MEDIUM)	 	
            seq_item_port.item_done();
		end
	endtask : run_phase

        virtual task drive(my_sequence_item seq_itm);
            //drive all the inputs in your DUT
            intf.detect_5 = seq_itm.detect_5;
            intf.detect_10 = seq_itm.detect_10;
            intf.detect_25 = seq_itm.detect_25;
            intf.amount = seq_itm.amount;
            intf.buy = seq_itm.buy;
            intf.return_coins = seq_itm.return_coins;
            intf.empty_5 = seq_itm.empty_5;
            intf.empty_10 = seq_itm.empty_10;
            intf.empty_25 = seq_itm.empty_25;
            `uvm_info("DRIVER", $sformatf("Driving Sequence: %d %d  ", seq_itm.detect_5, seq_itm.detect_10), UVM_MEDIUM)
        endtask : drive


endclass : my_driver
