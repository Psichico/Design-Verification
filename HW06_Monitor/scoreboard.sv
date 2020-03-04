//	`uvm_analysis_imp_decl(_a)
	`uvm_analysis_imp_decl(_ref)
	
class my_scoreboard extends uvm_scoreboard; //Create a scoreboard
	`uvm_component_utils(my_scoreboard)      //uvm_macro
	
    uvm_analysis_imp #(my_sequence_item ,my_scoreboard) in_port; //test the diff betwn port and imp
	uvm_analysis_imp_ref #(my_sequence_item ,my_scoreboard) out_port;
	my_sequence_item seq_itm;

    my_sequence_item seq_itm_in;
	my_sequence_item seq_itm_out;

    my_sequence_item queue_in [$];
	my_sequence_item queue_out [$];

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
		seq_itm_in = my_sequence_item::type_id::create("seq_itm_in",this);
		seq_itm_out = my_sequence_item::type_id::create("seq_itm_out",this);
        if (!uvm_config_db#(virtual vend_intf)::get(this, "*", "my_interface", intf))
		begin
			`uvm_fatal("SB", "Could not get virtual interface")
		end
	endfunction : build_phase

  	virtual function write(my_sequence_item seq_itm);
       queue_in.push_back(seq_itm);
  	endfunction

	virtual function write_ref(my_sequence_item seq_itm);
       queue_out.push_back(seq_itm);
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
            wait(queue_in.size != 0 && queue_out.size != 0)
            begin
		        seq_itm_in = queue_in.pop_front();
				seq_itm_out = queue_out.pop_front();
				//Write your code here
                compare();
            end
		end
	endtask : run_phase

endclass : my_scoreboard
