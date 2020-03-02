class my_sequence extends uvm_sequence;
	`uvm_object_utils(my_sequence)
	
	function new(string name="my_sequence");
		super.new(name);
	endfunction : new
	
	task body();
	sequence_item seq_itm = sequence_item::type_id::create("seq_itm");

    for(int i=0; i<200; i++) begin		
		start_item(seq_itm);
		seq_itm.randomize();
        #10;
		finish_item(seq_itm);	
	end

    endtask : body
	
endclass : my_sequence
