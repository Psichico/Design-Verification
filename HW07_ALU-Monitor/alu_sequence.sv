class my_sequence extends uvm_sequence;
	`uvm_object_utils(my_sequence)

	function new(string name = "my_sequence");
		super.new(name);
	endfunction
	
	my_sequence_item seq_itm;
	
	task body();
		`uvm_info("SEQUENCE","Body Task", UVM_MEDIUM);
		seq_itm = my_sequence_item::type_id::create("seq_itm"); 
		repeat(500)
		begin
			start_item(seq_itm);			
			seq_itm.randomize();
            #1; //change this delay and watch your code get hurt.
			finish_item(seq_itm);
		end
	endtask

endclass : my_sequence

