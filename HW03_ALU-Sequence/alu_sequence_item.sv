class my_sequence_item extends uvm_sequence_item; //sequence_item 

	rand bit [3:0] test_bit;

	`uvm_object_utils_begin(my_sequence_item)
		`uvm_field_int(test_bit, UVM_ALL_ON)
	`uvm_object_utils_end
	
	function new(string name = "my_sequence_item"); //constructor
		super.new(name);
	endfunction

endclass : my_sequence_item

