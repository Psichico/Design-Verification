class my_sequence_item extends uvm_sequence_item;  
   `uvm_object_utils(my_sequence_item)
	    
    //constraint my_constraints { }
    
    rand bit detect_5;
    rand bit detect_10;
    rand bit detect_25;
    rand bit [9] amount;
    rand bit buy;
    rand bit return_coins;
    rand bit empty_5;
    rand bit empty_10;
    rand bit empty_25;
    bit ok;
    bit return_5;
    bit return_10;
    bit return_25;

    bit _out_ok;
    bit _out_return_5;
    bit _out_return_10;
    bit _out_return_25;
    bit [8:0] acc,acc_d;
    bit [19:0] cnt,cnt_d;
    bit ret_5,ret_5_d;
    bit ret_10,ret_10_d;
    bit ret_25,ret_25_d;
    bit [3:0] sm_state_var,sm_state_var_d;
    bit [3:0] sm_return_var,sm_return_var_d;


	function new(string name = "my_sequence_item");
		super.new(name);
	endfunction
	
    constraint vend{
                    return_coins != buy;
                    detect_5 == 0;
                    detect_10 == 0;
                    detect_25 == 0;
                    amount == 0;
                    buy == 0;
                    return_coins == 0;
                    empty_5 == 0;
                    empty_10 == 0;
                    empty_25 == 0;
                  
                  }
/*    
    `uvm_object_utils_begin(my_sequence_item)
		`uvm_field_int(test_bit_a, UVM_ALL_ON)
        `uvm_field_int(stopin, UVM_ALL_ON)
	`uvm_object_utils_end
*/
endclass : my_sequence_item
