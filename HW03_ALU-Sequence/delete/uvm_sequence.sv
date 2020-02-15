class my_sequence extends uvm_sequence;
  `uvm_object_utils(my_sequence)

  function new(string name = "my_sequence");
    super.new(name);

    endfunction

    task body ();
      //create data and send
   
   //   `uvm_do (my_seq_item);
    endtask

endclass
