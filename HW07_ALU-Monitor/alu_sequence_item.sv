class my_sequence_item extends uvm_sequence_item;  
   `uvm_object_utils(my_sequence_item)
	
    rand bit [7:0] test_bit_a; //in
    rand bit [7:0] test_bit_b; //in
    rand bit pushin; //in
    rand bit [1:0] ctl; //in
    rand bit ci; //in
    rand bit stopin; //in
    
    bit stopout;
    bit pushout;
    bit cout;
    bit my_cout;
    bit [7:0] z;
    
    constraint my_constraints { 
                                test_bit_a[7] == 0;
                                test_bit_b[7] == 0;
                                test_bit_a >= test_bit_b;
                                ci == 0;
                                stopin == 0;
                                //ctl == 2'b01;
                                pushin == 1;
                              }

	function new(string name = "my_sequence_item");
		super.new(name);
	endfunction
  
endclass : my_sequence_item
