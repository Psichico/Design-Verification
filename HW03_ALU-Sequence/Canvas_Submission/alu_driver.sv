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
		
		forever begin
			my_sequence_item seq_itm;
			seq_item_port.get_next_item(seq_itm);
		    //seq_itm.print();
            `uvm_info("DRIVER", $sformatf("A = %b , B = %b", seq_itm.test_bit_a, seq_itm.test_bit_b ), UVM_MEDIUM)
			seq_item_port.item_done();
		end
	endtask

endclass : my_driver


