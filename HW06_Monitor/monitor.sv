class my_monitor extends uvm_monitor;
    `uvm_component_utils(my_monitor)

	//instantiate interface, sequence item, analysis port
	uvm_analysis_port #(my_sequence_item) monitor_port;
	virtual	vend_intf intf;
	my_sequence_item seq_itm;

    bit [15:0] c5, c10, c25;
    bit [23:0] mon_return_25, mon_return_10, mon_return_5;
    bit mon_ok, out_flag;	
    bit mon_retcoins;
    bit [31:0] buy_amount, mon_amount;

	function new (string name = "my_monitor", uvm_component parent = null);
		super.new(name, parent);
	endfunction
	
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		monitor_port = new("monitor_port", this);
        
        c5            = 0;
        c10           = 0;
        c25           = 0;
        mon_return_25 = 0;
        mon_return_10 = 0;
        mon_return_5  = 0;
        mon_ok        = 0;
        mon_retcoins  = 0;
        mon_amount    = 0;
        buy_amount    = 0;
        out_flag      = 0;

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
                
                begin // :buy / return coins

                if (intf.buy == 1)
                    begin
                        @(negedge intf.buy)
                        mon_ok = 1;
                `uvm_info("MONITOR_IN", $sformatf("%d", mon_ok), UVM_NONE)
                    end
                else if (intf.return_coins == 1)
                    begin
                        @(negedge intf.return_coins)
                        mon_retcoins = 1;
                    end

                end // :buy / return coins
                
              
                begin // :fork new

                if(mon_ok == 1 || mon_retcoins == 1)
                begin // :if

                    mon_amount = (c5 * 5) + (c10 * 10) + (c25 * 25);                     
                    get_from_intf(seq_itm);

                    if(mon_ok == 1)
                        buy_amount = intf.amount;
                    else
                        buy_amount = 0;

                    mon_amount = mon_amount - buy_amount;

                    while(mon_amount>1'b0) begin // :1
                        `uvm_info("MONITOR_IN", $sformatf("IN WHILE LOOP %d", mon_amount), UVM_NONE)
                        if(!seq_itm.empty_25 && mon_amount>=6'b011001) begin // :2
                            mon_return_25 = mon_return_25 + 1'b1;
                            mon_amount = mon_amount - 6'b011001;
                        end // :2

                        else begin // :3
                            if(!seq_itm.empty_10 && mon_amount>=5'b01010) begin // :4
                                mon_return_10 = mon_return_10 + 1'b1;
                                mon_amount = mon_amount - 5'b01010;
                            end // :4
                            else begin // :5
                                if(!seq_itm.empty_5 && mon_amount>=3'b101) begin // :6
                                    mon_return_5 = mon_return_5 + 1'b1;
                                    mon_amount = mon_amount - 3'b101;
                                end // :6
                                else begin // :7
                                    //out_flag = 1;
                                    mon_amount = 32'd0;
                                end // :7
                            end // :5
                        end // :3
                    end //:1


                      //returned_amount = (mon_return_25 * 25) + (mon_return_10 * 10) + (mon_return_5 * 5);
                        expected_packet(seq_itm); 
                        monitor_port.write(seq_itm);
                        `uvm_info("MONITOR_IN", $sformatf("ret5=%d, ret10=%d, ret25=%d", mon_return_5, mon_return_10, mon_return_25), UVM_NONE)
                        c5  = 0;
                        c10 = 0;
                        c25 = 0;
                        out_flag = 0;
                        mon_ok = 0;
                        mon_retcoins = 0;
                end // :if
                end // :fork3
            join
		end	// :Forever
	endtask

	virtual task get_from_intf(my_sequence_item seq_itm);
            seq_itm.empty_5 = intf.empty_5;
            seq_itm.empty_10 = intf.empty_10;
            seq_itm.empty_25 = intf.empty_25;
	endtask: get_from_intf

    virtual task expected_packet(my_sequence_item seq_itm);
            seq_itm.ok = mon_ok;
            seq_itm.return_25 = mon_return_25;
            seq_itm.return_10 = mon_return_10;
            seq_itm.return_5  = mon_return_5;
    endtask: expected_packet

endclass : my_monitor
