class my_sequence_item extends uvm_sequence_item; //sequence_item 

	rand bit [15:0] test_bit_a;
    rand bit [15:0] test_bit_b;
    rand bit s_xor;
    rand bit s_add;
    	 bit [31:0] out_to_monitor;

    constraint my_constraints { test_bit_a[4] == 1; 
                                test_bit_b[4] == 1;
                                test_bit_a[5] == 0;
                                test_bit_b[5] == 0;
                                s_xor != s_add; }

	`uvm_object_utils_begin(my_sequence_item)
		`uvm_field_int(test_bit_a, UVM_ALL_ON)
        `uvm_field_int(test_bit_b, UVM_ALL_ON)
	`uvm_object_utils_end
	
	function new(string name = "my_sequence_item"); //constructor
		super.new(name);
	endfunction
	
    //task body ()



endclass : my_sequence_item

