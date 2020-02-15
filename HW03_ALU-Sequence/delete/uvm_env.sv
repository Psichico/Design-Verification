
virtual class my_env extends uvm_env;
	`uvm_component_utils(my_env)

  function new (string name="my_env", uvm_component parent=null);
    super.new(name,parent);
  endfunction

	//my_scoreboard sb_alu;
   function void build_phase(uvm_phase phase)
	super.build_phase (phase);

	//sb_alu = sb_alu::type_id::create ("sb_alu", this);
    endfunction

    function void connect_phase(uvm_phase phase)
	
    endfunction

endclass


