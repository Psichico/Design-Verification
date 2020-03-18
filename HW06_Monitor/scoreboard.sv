	
class my_scoreboard extends uvm_scoreboard; //Create a scoreboard
	`uvm_component_utils(my_scoreboard)      //uvm_macro
	`uvm_analysis_imp_decl (_in)
	`uvm_analysis_imp_decl (_ref)
	
    uvm_analysis_imp_in #(my_sequence_item ,my_scoreboard) in_port; //test the diff betwn port and imp
	uvm_analysis_imp_ref #(my_sequence_item ,my_scoreboard) out_port;

    my_sequence_item seq_itm;
    my_sequence_item seq_itm_in;
	my_sequence_item seq_itm_out;

    my_sequence_item queue_in [$];
	my_sequence_item queue_out [$];

	virtual vend_intf intf;
    bit [7:0] error_flag;    

	function new(string name="my_scoreboard",uvm_component parent=null); //create constructor
		super.new(name,parent);
		in_port =  new("in_port building",this);
		out_port =  new("out_port building",this);
	endfunction : new
	
	function void build_phase(uvm_phase phase);     //build phase
		`uvm_info("SCOREBOARD","BUILD PHASE",UVM_MEDIUM);		
		seq_itm = my_sequence_item::type_id::create("seq_itm",this);
		seq_itm_in = my_sequence_item::type_id::create("seq_itm_in",this);
		seq_itm_out = my_sequence_item::type_id::create("seq_itm_out",this);

        error_flag = 8'd0;

        if (!uvm_config_db#(virtual vend_intf)::get(this, "*", "my_interface", intf))
		begin
			`uvm_fatal("SB", "Could not get virtual interface")
		end
	endfunction : build_phase

  	virtual function void write_in(my_sequence_item seq_itm);
       queue_in.push_back(seq_itm);
  	endfunction: write_in

	virtual function void write_ref(my_sequence_item seq_itm);
       queue_out.push_back(seq_itm);
  	endfunction: write_ref
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    task run_phase(uvm_phase phase); 	
	    forever begin
          @(posedge intf.clk)
            
            //error_flag = queue_in.size() - queue_out.size();
            //if(error_flag >= 2)
            //begin
                //`uvm_error("SCB","Didn't return my money");
            //end
            
            //`uvm_info("SCBD",$sformatf("%d  %d",queue_in.size(), queue_out.size()), UVM_MEDIUM);
            
            wait(queue_in.size != 0 && queue_out.size != 0)
            begin //: 1
                
                seq_itm_in = queue_in.pop_front();
				seq_itm_out = queue_out.pop_front();
                if (seq_itm_in.ok == seq_itm_out.ok)
	    	        `uvm_info("SCBD", $sformatf("PASS in ok %d , out ok %d", seq_itm_in.ok, seq_itm_out.ok), UVM_MEDIUM)
                else
	    	        `uvm_error("SCBD", "Ok Failed")

                if (seq_itm_in.return_5 == seq_itm_out.return_5)
	    	        `uvm_info("SCBD", $sformatf("PASS in ret5 %d , out ret5 %d", seq_itm_in.return_5, seq_itm_out.return_5), UVM_MEDIUM)
                else
	    	        `uvm_error("SCBD", "Ret5 failed")

                if (seq_itm_in.return_10 == seq_itm_out.return_10)
	    	        `uvm_info("SCBD", $sformatf("PASS in ret10 %d , out ret10 %d", seq_itm_in.return_10, seq_itm_out.return_10), UVM_MEDIUM)
                else
	    	        `uvm_error("SCBD", "Ret10 failed")

                if (seq_itm_in.return_25 == seq_itm_out.return_25)
	    	        `uvm_info("SCBD", $sformatf("PASS in ret25 %d , out ret25 %d", seq_itm_in.return_25, seq_itm_out.return_25), UVM_MEDIUM)
                else
	    	        `uvm_error("SCBD", "Ret25 failed")

            end // :1 new
        end
    endtask : run_phase



endclass : my_scoreboard
