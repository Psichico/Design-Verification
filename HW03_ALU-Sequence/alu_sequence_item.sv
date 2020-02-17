class my_sequence_item extends uvm_sequence_item; //sequence_item 

	rand bit [7:0] test_bit_a;
    rand bit [7:0] test_bit_b;

    constraint my_constraints { test_bit_a[4] == 1; 
                                test_bit_b[4] == 1;
                                test_bit_a[5] == 0;
                                test_bit_b[5] == 0; }

	`uvm_object_utils_begin(my_sequence_item)
		`uvm_field_int(test_bit_a, UVM_ALL_ON)
        `uvm_field_int(test_bit_b, UVM_ALL_ON)
	`uvm_object_utils_end
	
	function new(string name = "my_sequence_item"); //constructor
		super.new(name);
	endfunction
	
    //task body ()



endclass : my_sequence_item

