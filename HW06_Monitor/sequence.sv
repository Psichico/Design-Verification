class my_sequence extends uvm_sequence;
	`uvm_object_utils(my_sequence)

	function new(string name = "my_sequence");
		super.new(name);
	endfunction
	
	my_sequence_item seq_itm;
	
	task body();
		`uvm_info("SEQUENCE","TASK", UVM_MEDIUM);
		repeat(10)
		begin
			seq_itm = my_sequence_item::type_id::create("seq_itm"); 
			start_item(seq_itm);			
			seq_itm.randomize();
            #10;
			finish_item(seq_itm);
		end
	endtask

endclass : my_sequence

