// class s0 template
class s0 extends uvm_sequence #(itm) ;
  `uvm_object_utils(s0)

itm mx;

   function new(string name="s0");
      super.new(name);
   endfunction : new

   task doreset(input int nr);
     repeat(nr) begin
       start_item(mx);
       mx.opcode=E_reset;
       mx.randomize();
       finish_item(mx);
     end
   endtask : doreset
   
   task donop(input int nr);
     repeat(nr) begin
       start_item(mx);
       mx.opcode=E_nop;
       mx.randomize();
       finish_item(mx);
     end
   endtask : donop
   
   task dopush();
     start_item(mx);
     mx.opcode=E_push;
     mx.randomize();
     finish_item(mx);
    endtask : dopush

    task dopushcomplete();
      start_item(mx);
      mx.opcode=E_pushcomplete;
      mx.randomize();
      finish_item(mx);
    endtask: dopushcomplete


// A sequence body template. put tests there
   task body;
     mx=itm::type_id::create("seq_item");
     doreset(3);
     donop(3);

// Put your stuff here...


//	start_item(mx);
/*	repeat(300)
	begin
		dopush();
		mx.opcode=E_push;
		assert(mx.randomize());
		//`uvm_send(mx);
	end
	mx.opcode=E_pushcomplete;
	assert(mx.randomize());
	//`uvm_send(mx);
	dopushcomplete();
//       finish_item(mx);
*/	
	//repeat(1000)
///	`uvm_do_with(mx.opcode = E_push, {E_push != 0; E_pushcomplete == 0;});			
	//`uvm_do(mx);

	//start_item(mx);
/*
	repeat(10000)
	begin
		start_item(mx);
		mx.opcode=E_push;
		assert(mx.randomize());		
		#10ns;
		finish_item(mx);
		assert(mx.randomize());
		#1ns;
		start_item(mx);
		mx.opcode=E_nop;
		assert(mx.randomize());
		#10ns;
		finish_item(mx);
		//mx.opcode=E_pushcomplete;
		assert(mx.randomize());
		#10ns;
	end
	//finish_item(mx);
*/
	repeat(50)
	begin
		start_item(mx);
		mx.opcode=E_reset;
		assert(mx.randomize());
		#2ns;		
		//mx.opcode=E_push;
		assert(mx.randomize());
		
		#100ns		
		mx.opcode=E_pushcomplete;
		assert(mx.randomize());
		//mx.opcode=E_nop;
		//assert(mx.randomize());
		//mx.opcode=E_reset;
		//assert(mx.randomize());		
		finish_item(mx);
	end
   endtask : body
endclass : s0
