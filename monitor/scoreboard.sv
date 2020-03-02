
class scoreboard extends uvm_scoreboard;
	`uvm_component_utils(scoreboard)

    sequence_item seq_itm;
    sequence_item new_itm_rx;
    sequence_item qrx [$];
    virtual vend_intf itrfc; 

	uvm_analysis_imp#(sequence_item,scoreboard) rp;	
 
	
    function new(string name="scoreboard",uvm_component parent);
		super.new(name,parent);
        new_itm_rx = new();
	endfunction : new

	function void build_phase(uvm_phase phase);
		`uvm_info("scoreboard","build phase",UVM_MEDIUM);
        rp = new("define object rp of imp port",this);
        uvm_config_db#(virtual vend_intf)::get(null,"*","virtual_interface",itrfc);
	endfunction : build_phase


	task run_phase(uvm_phase phase);

    `uvm_info("SB","run phase",UVM_MEDIUM);
    forever begin
        #2;
        seq_itm = sequence_item::type_id::create("seq_itm",this);
        new_itm_rx = sequence_item::type_id::create("new_itm_rx",this); //not sure if it should be here or in build phase
        if(qrx.size()!=0) begin
            new_itm_rx = qrx.pop_front(); 
        end  
    end
    endtask : run_phase

    function void write(sequence_item seq_itm);
       qrx.push_back(seq_itm);
    endfunction : write

endclass : scoreboard
