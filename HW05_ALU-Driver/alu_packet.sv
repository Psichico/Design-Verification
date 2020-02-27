class my_packet extends uvm_sequence_item; //sequence_item 

	bit [7:0] test_bit_a; //in
    bit [7:0] test_bit_b; //in
    
    bit [1:0] ctl; //in
    bit cout;
    bit [7:0] z;
    bit [7:0] my_z;
    
	
	function new(string name = "my_packet"); //constructor
		super.new(name);
	endfunction
	
endclass : my_packet

