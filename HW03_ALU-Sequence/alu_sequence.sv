class my_sequence extends uvm_sequence;
	
	`uvm_object_utils(my_sequence)

	function new(string name = "my_sequence");
		super.new(name);
	endfunction
	
	task body ();
		my_sequence_item seq_itm = my_sequence_item::type_id::create("seq_itm");
		
		repeat(500)
		begin
			start_item(seq_itm);
			seq_itm.randomize();// with { seq_itm.test_bit_a == 32'h0;};
			
			//seq_itm.print();
			finish_item(seq_itm);
		end
/*
	task body ();
		my_sequence_item seq_itm = my_sequence_item::type_id::create("seq_itm");
		bit [31:0] i = 4;
		repeat(50)//(500)
		begin

//			int [31;0] j = 0;
			start_item(seq_itm);
			seq_itm.randomize() with { seq_itm.test_bit_a == 32'h0;};
			seq_itm.test_bit_a[i] = 1;
			//seq_itm.print();
			i = i - 1;
//			j = j + 1;
			finish_item(seq_itm);
		end
*/
	endtask

endclass : my_sequence

