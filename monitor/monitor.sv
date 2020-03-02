class monitor extends uvm_monitor;
    `uvm_component_utils(monitor)
   
    sequence_item seq_itm;
    virtual vend_intf itrfc;
	uvm_analysis_port #(sequence_item) tp;	

    function new(string name="monitor",uvm_component parent);
		super.new(name,parent);
	endfunction : new

	function void build_phase(uvm_phase phase);
	    `uvm_info("monitor","build phase",UVM_MEDIUM);
        uvm_config_db#(virtual vend_intf)::get(null,"*","virtual_interface",itrfc);
		tp =  new("define object tp of analysis port",this);
        //seq_itm = new("define object seq_itm of sequence item class",this);
    endfunction : build_phase
    
    task run_phase(uvm_phase phase);
        `uvm_info("monitor","run phase",UVM_MEDIUM);

        forever begin
        //(@posedge clk); //this is necessary, do not give hard delays
            seq_itm = sequence_item::type_id::create("seq_itm",this);
            
            //take inputs from interface
            tp.write(seq_itm);
            
            #1; //remove this
        end
    endtask : run_phase

endclass : monitor

