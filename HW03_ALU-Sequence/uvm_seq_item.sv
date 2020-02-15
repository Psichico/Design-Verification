class my_sequence_item extends uvm_sequence_item;

  rand bit [3:0] jaimil;

  `uvm_field_int(jaimil, UVM_ALL_ON)

  function new(string name = "my_seq_item");
    super.new(name);
    
  endfunction

endclass
