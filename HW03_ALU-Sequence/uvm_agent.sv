
class my_agent extends uvm_agent;
  `uvm_component_utils(my_agent)


  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction

    my_driver drv_alu;
    my_sequencer seqr_alu;

    function void build_phase (uvm_phase phase);
        drv_alu = my_driver::type_id::create("DRIVER",this);
        seqr_alu = my_sequencer::type_id::create("SEQUENCER",this);
    endfunction

    function void connect_phase(uvm_phase phase);

      drv_alu.seq_item_port.connect(seqr_alu.seq_item_export);

    endfunction

endclass

