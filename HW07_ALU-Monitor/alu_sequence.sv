class my_sequence extends uvm_sequence;
	`uvm_object_utils(my_sequence)

	function new(string name = "my_sequence");
		super.new(name);
	endfunction
	
	my_sequence_item seq_itm;
	
	task body();
		`uvm_info("SEQUENCE","Body Task", UVM_MEDIUM);
		seq_itm = my_sequence_item::type_id::create("seq_itm"); 
		repeat(50)
		begin
			start_item(seq_itm);			
			seq_itm.randomize();
		    `uvm_info("SEQUENCE","Repeat Task", UVM_MEDIUM);
            #10;
			finish_item(seq_itm);
		end
	endtask

endclass : my_sequence

