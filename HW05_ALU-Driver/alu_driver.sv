class my_driver extends uvm_driver #(my_sequence_item);
	
	`uvm_component_utils(my_driver)

	function new(string name = "my_driver", uvm_component parent = null);
		super.new(name, parent);
	endfunction

	virtual my_interface intf;	
	my_sequence_item seq_itm;
	
	function void build_phase(uvm_phase phase);
		super.build_phase (phase);
		if (!uvm_config_db#(virtual my_interface)::get(this, "", "my_interface", intf))
		begin	
			`uvm_fatal("DRV", "Could not get vif") 
		end
	endfunction

	task run_phase (uvm_phase phase);
		super.run_phase(phase);
		//forever begin
			//@(posedge clk);
			//if (!rst) begin
				
				seq_item_port.get_next_item(seq_itm);
				//seq_itm.print();
				intf.a <= seq_itm.test_bit_a ;
				intf.b <= seq_itm.test_bit_b ;
				intf.pushin <= seq_itm.pushin ;
				intf.ctl <= seq_itm.ctl ;
				intf.ci <= seq_itm.ci ;
				intf.stopin <= seq_itm.stopin ;
				`uvm_info("DRIVER", $sformatf("A = %h , B = %h", seq_itm.test_bit_a, seq_itm.test_bit_b), UVM_MEDIUM)	 	
				seq_item_port.item_done();
				//#5;
			//end
		//end
	endtask

endclass : my_driver
