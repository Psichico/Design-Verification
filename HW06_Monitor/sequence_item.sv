class my_sequence_item extends uvm_sequence_item;  
   `uvm_object_utils(my_sequence_item)
	    
    //constraint my_constraints { }
    
    bit detect_5;
    bit detect_10;
    bit detect_25;
    bit [9] amount;
    bit buy;
    bit return_coins;
    bit empty_5;
    bit empty_10;
    bit empty_25;
    bit ok;
    bit return_5;
    bit return_10;
    bit return_25;


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
