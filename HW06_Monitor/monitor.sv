class my_monitor extends uvm_monitor;
    `uvm_component_utils(my_monitor)

	//instantiate interface, sequence item, analysis port
	uvm_analysis_port #(my_sequence_item) monitor_port;
	virtual	vend_intf intf;
	my_sequence_item seq_itm;

    bit [7:0] c5, c10, c25;
    bit [19:0] mon_cnt;
    bit mon_ok;	
	function new (string name = "my_monitor", uvm_component parent = null);
		super.new(name, parent);
	endfunction
	
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		monitor_port = new("monitor_port", this);
        c5 = 0;
        c10 = 0;
        c25 = 0;
		if (!uvm_config_db#(virtual vend_intf)::get(this, "*", "my_interface", intf))
		begin
			`uvm_fatal("MONITOR", "Could not get virtual interface")
		end
	endfunction

	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("MONITOR","RUN PHASE", UVM_MEDIUM);
		
        seq_itm = my_sequence_item::type_id::create("seq_itm",this); //should I create this here??           
        
        forever begin // :Forever
        @(posedge intf.clk);
		    
            fork
                begin // :fork1
                if (intf.detect_5 == 1)
                    begin // :1
                        @(negedge intf.detect_5)
                        c5 = c5 + 1'b1;
                    end // :1
                else if (intf.detect_10 == 1)
                    begin // :2
                        @(negedge intf.detect_10)
                        c10 = c10 + 1'b1;
                    end // :2
                else if (intf.detect_25 == 1)
                    begin // :3
                        @(negedge intf.detect_25)
                        c25 = c25 + 1'b1;
                    end // :3
                end // :fork1

                begin // :fork2
                    if(intf.buy == 1 || intf.return_coins == 1)
                    begin // :4
                        get_from_intf(seq_itm);
                        monitor_port.write(seq_itm);    
                    end // :4   
                end // :fork2

                begin // :fork3
                    if(intf.buy == 1 )
                    begin // :5
                        mon_ok = 1;
                        while(mon_cnt <= 200)
                            begin    
                                mon_cnt = mon_cnt + 1'b1; 
                            end
                        mon_ok = 0;
                    end // :5
                end // :fork3
            join
            //`uvm_info("MONITOR_IN", $sformatf("In run phase of monitor"), UVM_NONE)
		end	// :Forever
	endtask

	virtual task get_from_intf(my_sequence_item seq_itm);
		 	seq_itm.detect_5 = c5;
            seq_itm.detect_10 = c10;
            seq_itm.detect_25 = c25;
            seq_itm.amount = intf.amount;
            seq_itm.buy = intf.buy;
            seq_itm.return_coins = intf.return_coins ;
            seq_itm.empty_5 = intf.empty_5;
            seq_itm.empty_10 = intf.empty_10;
            seq_itm.empty_25 = intf.empty_25;
            seq_itm.ok = mon_ok;
	endtask: get_from_intf

endclass : my_monitor
