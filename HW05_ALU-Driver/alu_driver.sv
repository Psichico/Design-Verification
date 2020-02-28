class my_driver extends uvm_driver #(my_sequence_item);
	`uvm_component_utils(my_driver)

	function new(string name = "my_driver", uvm_component parent = null);
		super.new(name, parent);
	endfunction

	virtual my_interface intf;	
    my_sequence_item seq_itm; //why here and not in body loop??
	
	function void build_phase(uvm_phase phase);
		super.build_phase (phase);
//		seq_itm = my_sequence_item::type_id::create("seq_itm",this); //why not create the sequence???
		if (!uvm_config_db#(virtual my_interface)::get(this, "", "my_interface", intf))
		begin	
			`uvm_fatal("DRV", "Could not get intf") 
		end
	endfunction

	task run_phase (uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("DRIVER","RUN PHASE", UVM_MEDIUM);
		forever begin
	    @(posedge intf.clk);	
		//	seq_itm = my_sequence_item::type_id::create("seq_itm",this);
            seq_item_port.get_next_item(seq_itm);
			if(seq_itm.stopin == 0)
            begin
			    drive(seq_itm);
                `uvm_info("DRIVER", $psprintf("IF A = %d , B = %d, ctl=%d, pi=%d, stpin=%d", seq_itm.test_bit_a, seq_itm.test_bit_b, seq_itm.ctl, seq_itm.pushin, seq_itm.stopin), UVM_MEDIUM)	 	
			    seq_item_port.item_done();
            end
            else
            begin
               // seq_item_port.get_next_item(seq_itm);
			   // drive(seq_itm);
                `uvm_info("DRIVER", $psprintf("ELSE "), UVM_MEDIUM)	 	
			    seq_item_port.item_done();
            end
		end
	endtask

        virtual task drive(my_sequence_item seq_itm);
            //drive all the inputs in your DUT
            intf.a <= seq_itm.test_bit_a ;
            intf.b <= seq_itm.test_bit_b ;
            intf.pushin <= seq_itm.pushin ;
            intf.ctl <= seq_itm.ctl ;
            intf.ci <= seq_itm.ci ;
            intf.stopin <= seq_itm.stopin ;
        endtask : drive

endclass : my_driver
