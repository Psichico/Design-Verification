class my_sequence_item extends uvm_sequence_item;  
//   `uvm_object_utils(my_sequence_item)
	    
    //constraint my_constraints { }
    
    rand reg detect_5;
    rand reg detect_10;
    rand reg detect_25;
    reg [7:0] amount;
    rand reg buy;
    rand reg return_coins;
    rand reg empty_5;
    rand reg empty_10;
    rand reg empty_25;
    reg ok;
    reg return_5;
    reg return_10;
    reg return_25;

    reg [19:0] drv_cnt;
/*
    reg _out_ok;
    reg _out_return_5;
    reg _out_return_10;
    reg _out_return_25;
    reg [8:0] acc,acc_d;
    reg [19:0] cnt,cnt_d;
    reg ret_5,ret_5_d;
    reg ret_10,ret_10_d;
    reg ret_25,ret_25_d;
    reg [3:0] sm_state_var,sm_state_var_d;
    reg [3:0] sm_return_var,sm_return_var_d;

    int i;
*/
	function new(string name = "my_sequence_item");
		super.new(name);
	endfunction
/*	
    constraint vend{
                    return_coins != buy;
                    detect_10 == 0;
                    detect_25 == 0;
                    return_coins == 0;
                    empty_5 == 0;
                    empty_10 == 0;
                    empty_25 == 0;
                  
                  }
 */   
    `uvm_object_utils_begin(my_sequence_item)
		`uvm_field_int(detect_5, UVM_ALL_ON)
		`uvm_field_int(detect_10, UVM_ALL_ON)
		`uvm_field_int(detect_25, UVM_ALL_ON)
        `uvm_field_int(amount, UVM_ALL_ON)
		`uvm_field_int(buy, UVM_ALL_ON)
		`uvm_field_int(return_coins, UVM_ALL_ON)
		`uvm_field_int(empty_5, UVM_ALL_ON)
		`uvm_field_int(empty_10, UVM_ALL_ON)
		`uvm_field_int(empty_25, UVM_ALL_ON)
	`uvm_object_utils_end

    function display();
        $display("det_5=%d, det_10=%d, det_25=%d, amt=%d, buy=%d, ret_coins=%d", detect_5, detect_10, detect_25, amount, buy, return_coins);
    endfunction: display

endclass : my_sequence_item
