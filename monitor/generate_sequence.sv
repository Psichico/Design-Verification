class sequence_item extends uvm_sequence_item;
	`uvm_object_utils(sequence_item)


/* //Not needed when using object_utils which is declared above
	`uvm_object_utils_begin(sequence_item)
	    `uvm_field_int(reset,UVM_ALL_ON)
	`uvm_object_utils_end
*/	
	function new(string name="sequence_item");
		super.new(name);
	endfunction : new


endclass : sequence_item
