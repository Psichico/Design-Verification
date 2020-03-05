class my_sequence extends uvm_sequence;
	`uvm_object_utils(my_sequence)

	function new(string name = "my_sequence");
		super.new(name);
	endfunction
	
	my_sequence_item seq_itm;
	
	virtual task body();
      `uvm_info("SEQUENCE","TASK", UVM_MEDIUM);
		repeat(5)
		begin
			seq_itm = my_sequence_item::type_id::create("seq_itm"); //inside the repeat loop or not?? 
		   $display("BUYING A PRODUCT NOW");
            sequence_buy(seq_itm); //sequence 1: to buy a product
        end
	endtask

    task sequence_buy(my_sequence_item seq_itm);
        detect_coins(seq_itm);
        buy_product(seq_itm);
    endtask: sequence_buy

    task detect_coins(my_sequence_item seq_itm);
      //just giving a pulse of detect_5 coin.
        repeat(10)
        begin 
            start_item(seq_itm);
            seq_itm.randomize() with {detect_5 == 1; detect_10 == 0; detect_25==0; buy==0; return_coins==0; empty_25==0; empty_10==0; empty_5==0;};
            finish_item(seq_itm);

            start_item(seq_itm);
            seq_itm.randomize() with {detect_5 == 0; detect_10 == 0; detect_25==0; buy==0; return_coins==0; empty_25==0; empty_10==0; empty_5==0;};
            finish_item(seq_itm);
        end
    endtask: detect_coins


    task buy_product(my_sequence_item seq_itm);
        
        start_item(seq_itm);
        seq_itm.randomize() with {detect_5 == 0; detect_10 == 0; detect_25==0; buy==1; return_coins==0; empty_25==0; empty_10==0; empty_5==0;};
        finish_item(seq_itm);

        start_item(seq_itm);
        seq_itm.randomize() with {detect_5 == 0; detect_10 == 0; detect_25==0; buy==1; return_coins==0; empty_25==0; empty_10==0; empty_5==0;};
        finish_item(seq_itm);
        
        start_item(seq_itm);
        seq_itm.randomize() with {detect_5 == 0; detect_10 == 0; detect_25==0; buy==0; return_coins==0; empty_25==0; empty_10==0; empty_5==0;};
        finish_item(seq_itm);

    endtask: buy_product


endclass : my_sequence

