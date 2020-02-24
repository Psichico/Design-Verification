class my_sequence_item extends uvm_sequence_item; //sequence_item 

	rand bit [7:0] test_bit_a; //in
    rand bit [7:0] test_bit_b; //in
    
    rand bit pushin; //in
    bit stopout;
    rand bit [1:0] ctl; //in
    
    rand bit ci; //in
    bit pushout;
    bit cout;
    bit my_cout;
    bit [7:0] z;
    bit [7:0] my_z;
    rand bit stopin; //in
    
//    constraint my_constraints {	ctl == 2'b01;
    							//test_bit_a != test_bit_b;
//    							}

/*
    constraint my_constraints { test_bit_a[4] == 1; 
                                test_bit_b[4] == 1;
                                test_bit_a[5] == 0;
                                test_bit_b[5] == 0;
                                s_xor != s_add; }
*/
	`uvm_object_utils_begin(my_sequence_item)
		`uvm_field_int(test_bit_a, UVM_ALL_ON)
        `uvm_field_int(test_bit_b, UVM_ALL_ON)
        `uvm_field_int(pushin, UVM_ALL_ON)
        `uvm_field_int(stopout, UVM_ALL_ON)
        `uvm_field_int(ctl, UVM_ALL_ON)
        `uvm_field_int(ci, UVM_ALL_ON)
        `uvm_field_int(pushout, UVM_ALL_ON)
        `uvm_field_int(cout, UVM_ALL_ON)
        `uvm_field_int(my_cout, UVM_ALL_ON)
        `uvm_field_int(z, UVM_ALL_ON)
        `uvm_field_int(my_z, UVM_ALL_ON)
        `uvm_field_int(stopin, UVM_ALL_ON)
	`uvm_object_utils_end
	
	function new(string name = "my_sequence_item"); //constructor
		super.new(name);
	endfunction
	
endclass : my_sequence_item

