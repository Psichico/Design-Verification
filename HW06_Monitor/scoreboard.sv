//	`uvm_analysis_imp_decl(_a)
//	`uvm_analysis_imp_decl(_b)
	
class my_scoreboard extends uvm_scoreboard; //Create a scoreboard
	`uvm_component_utils(my_scoreboard)      //uvm_macro
	
    uvm_analysis_imp #(my_sequence_item ,my_scoreboard) scoreboard_port; //test the diff betwn port and imp

	my_sequence_item seq_itm;
    my_sequence_item seq_itm_sb_a;

    my_sequence_item queue_a [$];

    bit [7:0] expected_out;
    bit [7:0] actual_out;

	virtual vend_intf intf;

	function new(string name="my_scoreboard",uvm_component parent=null); //create constructor
		super.new(name,parent);
		scoreboard_port =  new("scoreboard_port building",this);
	endfunction : new
	
	function void build_phase(uvm_phase phase);     //build phase
		`uvm_info("SCOREBOARD","BUILD PHASE",UVM_MEDIUM);		
		seq_itm = my_sequence_item::type_id::create("seq_itm",this);
		seq_itm_sb_a = my_sequence_item::type_id::create("seq_itm_sb_a",this);
        if (!uvm_config_db#(virtual vend_intf)::get(this, "*", "my_interface", intf))
		begin
			`uvm_fatal("SB", "Could not get virtual interface")
		end
	endfunction : build_phase

  	virtual function write(my_sequence_item seq_itm);
       queue_a.push_back(seq_itm);
  	endfunction

	virtual function void compare();
		if (expected_out == actual_out)
		begin
	    	`uvm_info("SCBD", $sformatf("PASS  "), UVM_MEDIUM)
		end
		else
		begin 
    		`uvm_info("SCBD", $sformatf("FAIL  "), UVM_MEDIUM)
		end
	endfunction: compare
	
	function void connect_phase(uvm_phase phase);
	
    endfunction: connect_phase
	
    task run_phase(uvm_phase phase);    //run phase	
		forever begin		
            wait(queue_a.size != 0)
            begin
		        seq_itm_sb_a = queue_a.pop_front();
                compare();
            end
		end
	endtask : run_phase

endclass : my_scoreboard
