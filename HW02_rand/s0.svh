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
    `uvm_info("doreset","seq_item",UVM_MEDIUM);
     donop(3);
     `uvm_info("donop","seq_item",UVM_MEDIUM);
// Put your stuff here...
    dopush;
    #5ns;
    `uvm_info("DO PUSH","MY TASK",UVM_MEDIUM);
    //`uvm_info("MY",$psprintf("....",mx),UVM_MEDIUM);
    dopushcomplete();
    #1ns;
    
    `uvm_do (mx);
//
   endtask : body
endclass : s0
