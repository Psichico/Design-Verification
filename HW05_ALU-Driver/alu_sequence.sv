class my_sequence extends uvm_sequence;
	`uvm_object_utils(my_sequence)

	function new(string name = "my_sequence");
		super.new(name);
	endfunction
	
	my_sequence_item seq_itm;
	
	task body();
		`uvm_info("SEQUENCE","BODY task", UVM_MEDIUM);
		repeat(10)
		begin
			seq_itm = my_sequence_item::type_id::create("seq_itm"); //should declare "THIS" or not??
			start_item(seq_itm);			
			seq_itm.randomize(); // with { seq_itm.test_bit_a == 32'h0;};
			
		   //`uvm_info("SEQUENCE","Repeat loop", UVM_MEDIUM);
			finish_item(seq_itm);
            #5;
		end
	endtask

endclass : my_sequence

