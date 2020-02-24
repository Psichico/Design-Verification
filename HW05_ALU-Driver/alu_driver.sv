class my_driver extends uvm_driver #(my_sequence_item);
	
	`uvm_component_utils(my_driver)

	function new(string name = "my_driver", uvm_component parent = null);
		super.new(name, parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase (phase);
	endfunction

	task run_phase (uvm_phase phase);
		super.run_phase(phase);
		alu_interface intf();
		//bit [31:0] out_to_monitor;
		
		forever begin
			@(posedge intf.clk);
			if (!rst) begin
				my_sequence_item seq_itm;
				seq_item_port.get_next_item(seq_itm);
				//seq_itm.print();
				intf.a <= seq_itm.test_bit_a ;
				intf.b <= seq_itm.test_bit_b ;
				intf.pushin <= seq_itm.pushin ;
				intf.ctl <= seq_itm.ctl ;
				intf.ci <= seq_itm.ci ;
				intf.stopin <= seq_itm.stopin ;
	/*
				if(seq_itm.s_add == 1)
					seq_itm.out_to_monitor = seq_itm.test_bit_a + seq_itm.test_bit_b;
				else if (seq_itm.s_xor == 1)
					seq_itm.out_to_monitor = seq_itm.test_bit_a ^ seq_itm.test_bit_b;
	*/
				`uvm_info("DRIVER", $sformatf("A = %h , B = %h , output = %h", seq_itm.test_bit_a, seq_itm.test_bit_b, seq_itm.out_to_monitor), UVM_MEDIUM)			 			
				seq_item_port.item_done();
			end
		end
	endtask

endclass : my_driver
