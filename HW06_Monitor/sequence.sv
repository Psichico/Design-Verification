class my_sequence extends uvm_sequence;
	`uvm_object_utils(my_sequence)

	function new(string name = "my_sequence");
		super.new(name);
	endfunction
	
	my_sequence_item seq_itm;
	
	virtual task body();
      `uvm_info("SEQUENCE","TASK", UVM_MEDIUM);
	    seq_itm = my_sequence_item::type_id::create("seq_itm"); //inside the repeat loop or not?? 
		
        repeat(1)
		begin
		    $display("Starting Sequence: BUYING A PRODUCT NOW");
            
            start_item(seq_itm);
            seq_itm.randomize() with {detect_5 == 0; detect_10 == 0; detect_25==0; buy==0; return_coins==0; empty_25==0; empty_10==0; empty_5==0;};
            finish_item(seq_itm);
            
        end
	endtask


endclass : my_sequence

