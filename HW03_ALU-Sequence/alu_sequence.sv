class my_sequence extends uvm_sequence;
	
	`uvm_object_utils(my_sequence)

	function new(string name = "my_sequence");
		super.new(name);
	endfunction

	task body ();
		//create data and send
        //my_sequence_item::test_bit test_bit0;
		my_sequence_item seq_itm = my_sequence_item::type_id::create("seq_itm");
		start_item(seq_itm);
		seq_itm.randomize();// with { seq_itm.test_bit == test_bit0;};
		seq_itm.print();
		finish_item(seq_itm);
		
	endtask

endclass : my_sequence

