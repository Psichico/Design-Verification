class driver extends uvm_driver #(sequence_item);
	`uvm_component_utils(driver)
	
    sequence_item seq_itm;
    virtual my_interface itrfc;

    function new(string name="driver",uvm_component parent);
	    super.new(name,parent);
  	endfunction : new

	function void build_phase(uvm_phase phase);
	    `uvm_info("driver","build phase",UVM_MEDIUM);
        seq_itm = sequence_item::type_id::create("sequence_item",this); 
        uvm_config_db#(virtual my_interface)::get(null,"*","virtual_interface",itrfc);
    endfunction : build_phase

    virtual task run_phase(uvm_phase phase);
		forever begin
      seq_item_port.get_next_item(seq_itm);
      // drive interface items here

      seq_item_port.item_done();
	 	end
	endtask : run_phase
	
endclass : driver
