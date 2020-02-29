class my_sequence_item extends uvm_sequence_item;  
   `uvm_object_utils(my_sequence_item)
	
    
    constraint my_constraints { }

	function new(string name = "my_sequence_item");
		super.new(name);
	endfunction
	
/*    
    `uvm_object_utils_begin(my_sequence_item)
		`uvm_field_int(test_bit_a, UVM_ALL_ON)
        `uvm_field_int(stopin, UVM_ALL_ON)
	`uvm_object_utils_end
*/
endclass : my_sequence_item