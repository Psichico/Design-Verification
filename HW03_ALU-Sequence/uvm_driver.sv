class my_driver extends uvm_driver;
    `uvm_component_utils(my_driver)
    
    function new(string name = "my_driver", uvm_component parent = null)
      super.new(name, parent);
      seq_item_port = new("seq_item_port", this);
    endfunction
    
    function void build_phase (uvm_phase phase)
      super.build_phase (phase);
    endfunction

    task run_phase (uvm_phase phase);
/*
      my_sequence seq_item;

      forever begin
        
        seq_item_port.get_next_item(my_seq_item);
        seq_item_port.item_done();

        end
*/
    endtask


endclass : my_driver










/*
typedef class uvm_sequence_item;


class uvm_driver #(type REQ=uvm_sequence_item,
                   type RSP=REQ) extends uvm_component;


  // Port: seq_item_port
  //
  // Derived driver classes should use this port to request items from the
  // sequencer. They may also use it to send responses back.

  uvm_seq_item_pull_port #(REQ, RSP) seq_item_port;

  uvm_seq_item_pull_port #(REQ, RSP) seq_item_prod_if; // alias

  // Port: rsp_port
  //
  // This port provides an alternate way of sending responses back to the
  // originating sequencer. Which port to use depends on which export the
  // sequencer provides for connection.

  uvm_analysis_port #(RSP) rsp_port;

  REQ req;
  RSP rsp;

  // Function: new
  //
  // Creates and initializes an instance of this class using the normal
  // constructor arguments for <uvm_component>: ~name~ is the name of the
  // instance, and ~parent~ is the handle to the hierarchical parent, if any.

  function new (string name, uvm_component parent);
    super.new(name, parent);
    seq_item_port    = new("seq_item_port", this);
    rsp_port         = new("rsp_port", this);
    seq_item_prod_if = seq_item_port;
  endfunction // new

  const static string type_name = "uvm_driver #(REQ,RSP)";

  virtual function string get_type_name ();
    return type_name;
  endfunction

endclass
*/

