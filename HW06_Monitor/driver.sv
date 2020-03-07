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
            seq_itm.display();
            seq_itm.amount = 8'd5;
            #20;
			drive_amount(seq_itm);
            drive_detect(seq_itm);
            #30;
            drive_detect(seq_itm);
            #30;
            drive_detect(seq_itm);
            #30;
            drive_empty(seq_itm);
            //intf.buy = 1;
            drive_buy(seq_itm);
            #2000;
            //intf.buy = 0;
            //drive_retcoins(seq_itm);
            //drive_reset(seq_itm);
            #39000;
            seq_item_port.item_done();
		end
	endtask : run_phase

        virtual task drive_amount(my_sequence_item seq_itm);
            intf.amount = seq_itm.amount;
        endtask: drive_amount
        
        virtual task drive_reset(my_sequence_item seq_itm);
            intf.detect_5 = 0;//seq_itm.detect_5;
            intf.detect_10 = 0;//seq_itm.detect_10;
            intf.detect_25 = 0;//seq_itm.detect_25;
            intf.buy = 0;//seq_itm.buy;
            intf.empty_5 = 0;//seq_itm.empty_5;
            intf.empty_10 = 0;//seq_itm.empty_10;
            intf.empty_25 = 0;//seq_itm.empty_25;
            intf.return_coins = 0;//seq_itm.return_coins;
        endtask: drive_reset

        virtual task drive_detect(my_sequence_item seq_itm);
            intf.detect_5 = seq_itm.detect_5;
            intf.detect_10 = seq_itm.detect_10;
            intf.detect_25 = seq_itm.detect_25;
        endtask : drive_detect

        virtual task drive_buy(my_sequence_item seq_itm);
            intf.buy = seq_itm.buy;
        endtask : drive_buy
            
        virtual task drive_empty(my_sequence_item seq_itm);
            intf.empty_5 = seq_itm.empty_5;
            intf.empty_10 = seq_itm.empty_10;
            intf.empty_25 = seq_itm.empty_25;
        endtask : drive_empty
        
        virtual task drive_retcoins(my_sequence_item seq_itm);
            intf.return_coins = seq_itm.return_coins;
        endtask : drive_retcoins

endclass : my_driver
