
//------------------------------------------------------------------------------
//
// CLASS: uvm_scoreboard
//
// The uvm_scoreboard virtual class should be used as the base class for 
// user-defined scoreboards.
//
// Deriving from uvm_scoreboard will allow you to distinguish scoreboards from
// other component types inheriting directly from uvm_component. Such 
// scoreboards will automatically inherit and benefit from features that may be
// added to uvm_scoreboard in the future.
//------------------------------------------------------------------------------

virtual class uvm_scoreboard extends uvm_component;

  // Function: new
  //
  // Creates and initializes an instance of this class using the normal
  // constructor arguments for <uvm_component>: ~name~ is the name of the
  // instance, and ~parent~ is the handle to the hierarchical parent, if any.

  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  const static string type_name = "uvm_scoreboard";

  virtual function string get_type_name ();
    return type_name;
  endfunction

endclass

