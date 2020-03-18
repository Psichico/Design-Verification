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
	    //every signal must be driven atleast for #10.
        // Design bug: You cannot add 2 before buying.
        forever begin
	    @(posedge intf.clk);	
            
            seq_item_port.get_next_item(seq_itm);
                
            #20     drive_reset(seq_itm);
            #20     intf.amount     = 8'd0; //driving amount 
            #20     intf.detect_5   = 1; // entering 50 = 25*2;
            #20     intf.detect_5   = 0;
            #300    intf.detect_25  = 1; // entering 50 = 25*2;
            #20     intf.detect_25  = 0;
            #300    intf.detect_10  = 1;
            #20     intf.detect_10  = 0;
            #20     intf.empty_25   = 0; //change to 1: experiment
                    intf.empty_10   = 0;
            #20     intf.buy        = 1;
            #2020   intf.buy        = 0;
            
            #380000;
            #380000;
            
            seq_item_port.item_done();

		end
	endtask : run_phase

        
        virtual task drive_reset(my_sequence_item seq_itm);
            intf.detect_5 = 0;
            intf.detect_10 = 0;
            intf.detect_25 = 0;
            intf.buy = 0;
            intf.empty_5 = 0;
            intf.empty_10 = 0;
            intf.empty_25 = 0;
            intf.return_coins = 0;
        endtask: drive_reset

endclass : my_driver
