class ref_model extends uvm_monitor;
    `uvm_component_utils(ref_model)

	//instantiate interface, sequence item, analysis port
	uvm_analysis_port #(my_sequence_item) ref_port;
	virtual	vend_intf intf;
	my_sequence_item seq_itm;
	
    bit [15:0] ret5_true, ret10_true, ret25_true;
    bit ok_true;
    int  cnt;
    bit flag;

	function new (string name = "ref_model", uvm_component parent = null);
		super.new(name, parent);
	endfunction
	
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		ref_port = new("ref_port", this);
		ok_true = 1'b0;
        ret5_true = 16'h0000;
        ret10_true = 16'h0000;
        ret25_true = 16'h0000;
        cnt = 0;
        flag = 1'b0;
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
                if((intf.ok == 1))
                begin
                @(negedge intf.ok)
                    ok_true =  1'b1;
                end
                
                //else
                  //ok_true = 16'h0000;
            end // :Fork1

            begin // :Fork2
                if(intf.return_5 == 1)
                begin
                @(negedge intf.return_5)
                    ret5_true = ret5_true + 1'b1;
                    `uvm_info("RET5", $sformatf("ok=%d, ret5=%d, ret10=%d, ret25=%d", ok_true, ret5_true, ret10_true, ret25_true), UVM_MEDIUM);
                end
                //else
                  //ret5_true = 16'h0000;
            end // :Fork2

            begin // :Fork3
                if(intf.return_10 == 1)
                begin
                @(negedge intf.return_10)
                    ret10_true = ret10_true + 1'b1;
                    `uvm_info("RET10", $sformatf("ok=%d, ret5=%d, ret10=%d, ret25=%d", ok_true, ret5_true, ret10_true, ret25_true), UVM_MEDIUM);
                end
                //else
                 // ret10_true = 16'h0000;
            end // :Fork3

            begin // :Fork4
                if(intf.return_25 == 1)
                begin
                    `uvm_info("RET25", $sformatf("ok=%d, ret5=%d, ret10=%d, ret25=%d", ok_true, ret5_true, ret10_true, ret25_true), UVM_MEDIUM);
                @(negedge intf.return_25)
                    ret25_true = ret25_true + 1'b1;
                    flag = 1'b1;
                    `uvm_info("RET25", $sformatf("ok=%d, ret5=%d, ret10=%d, ret25=%d", ok_true, ret5_true, ret10_true, ret25_true), UVM_MEDIUM);
                end
                //else
                 // ret25_true = 16'h0000;
            end // :Fork4
            
            begin
                    if(flag == 1'b1)
                    begin
                        `uvm_info("REF", $sformatf("ok=%d, ret5=%d, ret10=%d, ret25=%d", ok_true, ret5_true, ret10_true, ret25_true), UVM_MEDIUM);
                        get_from_intf(seq_itm);
                        ref_port.write(seq_itm);
                        flag = 1'b0;
                    end
                
            end
            join
        end	
	endtask

	virtual task get_from_intf(my_sequence_item seq_itm);
        seq_itm.ok = ok_true;
        seq_itm.return_5 = ret5_true;
        seq_itm.return_10 = ret10_true;
        seq_itm.return_25 = ret25_true;
	endtask: get_from_intf

endclass : ref_model
