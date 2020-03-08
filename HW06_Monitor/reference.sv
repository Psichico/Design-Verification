class ref_model extends uvm_monitor;
    `uvm_component_utils(ref_model)

	//instantiate interface, sequence item, analysis port
	uvm_analysis_port #(my_sequence_item) ref_port;
	virtual	vend_intf intf;
	my_sequence_item seq_itm;
	
    bit ok_true, ret5_true, ret10_true, ret25_true;

	function new (string name = "ref_model", uvm_component parent = null);
		super.new(name, parent);
	endfunction
	
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		ref_port = new("ref_port", this);
		ok_true = 0;
        ret5_true = 0;
        ret10_true = 0;
        ret25_true = 0;
        if (!uvm_config_db#(virtual vend_intf)::get(this, "*", "my_interface", intf))
		begin
			`uvm_fatal("REF_MODEL", "Could not get virtual interface")
		end
	endfunction

	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("MONITOR","RUN PHASE", UVM_MEDIUM);
		    seq_itm = my_sequence_item::type_id::create("seq_itm",this); //should I create this here??           
        forever begin
        @(posedge intf.clk);
			fork
            begin // :Fork1
                if((intf.ok == 1) && (ok_true == 0))
                begin
                    ok_true = 1;
                    get_from_intf(seq_itm);
                    ref_port.write(seq_itm);
                end
                
                if(intf.ok == 0 && ok_true == 1)
                begin
                  ok_true = 0;
                end
            end // :Fork1
/*
            begin // :Fork2
                if(intf.return_5 == 1 && ret5_true == 0)
                begin
                    seq_itm.return_5 = 1;
                    ret5_true = 1;
                end
                else
                  seq_itm.return_5 = 0;

                if(intf.return_5 == 0 && ret5_true == 1)
                begin
                  ret5_true = 0;
                  seq_itm.return_5 = 0;
                end
                  //seq_itm.return_5 = 0;
            end // :Fork2

            begin // :Fork3
                if(intf.return_10 == 1 && ret10_true == 0)
                begin
                    seq_itm.return_10 = 1;
                    ret10_true = 1;
                end
                else
                  seq_itm.return_10 = 0;

                if(intf.return_10 == 0 && ret10_true == 1)
                begin
                  ret10_true = 0;
                  seq_itm.return_10 = 0;
                end
                  //seq_itm.return_10 = 0;
            end // :Fork3

            begin // :Fork4
                if(intf.return_25 == 1 && ret25_true == 0)
                begin
                    seq_itm.return_25 = 1;
                    ret25_true = 1;
                end
                else 
                  seq_itm.return_25 = 0;

                if(intf.return_25 == 0 && ret25_true == 1)
                begin
                  ret25_true = 0;
                  seq_itm.return_25 = 0;
                end
                  //seq_itm.return_25 = 0;
            end // :Fork4
            
            begin
                if(ret25_true || ret10_true || ret5_true || ok_true)
                    ref_port.write(seq_itm);

            end
*/            join
        end	
	endtask

	virtual task get_from_intf(my_sequence_item seq_itm);
        seq_itm.ok = intf.ok;
        seq_itm.return_5 = intf.return_5;
        seq_itm.return_10 = intf.return_10;
        seq_itm.return_25 = intf.return_25;
	endtask: get_from_intf

endclass : ref_model
