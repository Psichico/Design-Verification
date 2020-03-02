class my_driver extends uvm_driver #(my_sequence_item);
	`uvm_component_utils(my_driver)

	function new(string name = "my_driver", uvm_component parent = null);
		super.new(name, parent);
	endfunction

	// Instantiate interface, sequence item. 
	virtual vend_intf intf;	
    my_sequence_item seq_itm; 
	
	function void build_phase(uvm_phase phase);
		super.build_phase (phase);
		// VOID: uvm_config_db#(type T = int)::set(uvm_component cntxt, string inst_name, string field_name, T value);
		// BIT:  uvm_config_db#(type T = int)::get(uvm_component cntxt, string inst_name, string field_name, ref T value);
		if (!uvm_config_db#(virtual vend_intf)::get(this, "*", "my_interface", intf))
		begin	
			`uvm_fatal("DRIVER", "Could not get virtual interface") 
		end
	endfunction

	task run_phase (uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("DRIVER","RUN PHASE", UVM_MEDIUM);
		forever begin
	    @(posedge intf.clk);	
            seq_item_port.get_next_item(seq_itm);
			seq_itm.sm_state_var = 0;
			assign_values(seq_itm);
			drive(seq_itm);
            //`uvm_info("DRIVER", $sformatf(" ", ), UVM_MEDIUM)	 	
            seq_item_port.item_done();
		end
	endtask : run_phase

		virtual task assign_values(my_sequence_item seq_itm);
	
			seq_itm.ok=seq_itm._out_ok;
			seq_itm.return_5=seq_itm._out_return_5;
			seq_itm.return_10=seq_itm._out_return_10;
			seq_itm.return_25=seq_itm._out_return_25;
			`uvm_info("DRIVER", $sformatf("Assigning values"), UVM_MEDIUM)

		endtask : assign_values

        virtual task drive(my_sequence_item seq_itm);
            //drive all the inputs in your DUT
			seq_itm.acc_d <= seq_itm.acc;
			seq_itm.cnt_d <= seq_itm.cnt;
			seq_itm.ret_5_d <= seq_itm.ret_5;
			seq_itm.ret_10_d <= seq_itm.ret_10;
			seq_itm.ret_25_d <= seq_itm.ret_25;
			seq_itm.sm_state_var_d <= seq_itm.sm_state_var;
			seq_itm.sm_return_var_d <= seq_itm.sm_return_var;
			seq_itm._out_return_5 <= seq_itm.ret_5;
			seq_itm._out_return_10 <= seq_itm.ret_10;
			seq_itm._out_return_25 <= seq_itm.ret_25;
			seq_itm._out_ok <= 1'b0;

			seq_itm.sm_state_var_d <= seq_itm.sm_state_var;  // state holds value 
			seq_itm.sm_return_var_d <= seq_itm.sm_return_var; // return value hold
	
			case(seq_itm.sm_state_var)
				0 : begin // state Sreset
					seq_itm.cnt_d = 1'b0;
					seq_itm.acc_d = 1'b0;
					seq_itm.ret_5_d = 1'b0;
					seq_itm.ret_10_d = 1'b0;
					seq_itm.ret_25_d = 1'b0;
					seq_itm.sm_state_var_d=1; // goto Sdrop
				end
				1 : begin // state Sdrop
					seq_itm.cnt_d = 1'b0;
					case(1'b1)
						seq_itm.detect_5 : begin
							seq_itm.acc_d = seq_itm.acc+3'b101;
							seq_itm.sm_state_var_d=2; // calls down_5
							seq_itm.sm_return_var_d=1; // returns to Sdrop
						end
						seq_itm.detect_10 : begin
							seq_itm.acc_d = seq_itm.acc+5'b01010;
							seq_itm.sm_state_var_d=3; // calls down_10
							seq_itm.sm_return_var_d=1; // returns to Sdrop
						end
						seq_itm.detect_25 : begin
							seq_itm.acc_d = seq_itm.acc+6'b011001;
							seq_itm.sm_state_var_d=4; // calls down_25
							seq_itm.sm_return_var_d=1; // returns to Sdrop
						end
						seq_itm.return_coins : begin
							seq_itm.sm_state_var_d=6; // goto Sreturn_em
						end
						seq_itm.buy : begin
							seq_itm.sm_state_var_d=5; // goto Sbuy
						end
					endcase
				end
				2 : begin // state down_5
					if(!seq_itm.detect_5) begin
						seq_itm.cnt_d = seq_itm.cnt+1'b1;
						if(seq_itm.cnt>$urandom_range(6'b010100,6'b011110)) begin
							seq_itm.sm_state_var_d=seq_itm.sm_return_var; // return
						end
					end
				end
				3 : begin // state down_10
					if(!seq_itm.detect_10) begin
						seq_itm.cnt_d = seq_itm.cnt+1'b1;
						if(seq_itm.cnt>$urandom_range(6'b010100,6'b011110)) begin
							seq_itm.sm_state_var_d=seq_itm.sm_return_var; // return
						end
					end
				end
				4 : begin // state down_25
					if(!seq_itm.detect_25) begin
						seq_itm.cnt_d = seq_itm.cnt+1'b1;
						if(seq_itm.cnt>$urandom_range(6'b010100,6'b011110)) begin
							seq_itm.sm_state_var_d=seq_itm.sm_return_var; // return
						end
					end
				end
				5 : begin // state Sbuy
					if(seq_itm.acc>=seq_itm.amount) begin
						seq_itm._out_ok = 1'b1;
						seq_itm.cnt_d = seq_itm.cnt+1'b1;
						if(seq_itm.cnt>$urandom_range(9'b001100100,10'b0011001000)) begin
							seq_itm.acc_d = seq_itm.acc-seq_itm.amount;
							seq_itm.sm_state_var_d=6; // goto Sreturn_em
						end
					end
					else begin
						seq_itm.sm_state_var_d=1; // goto Sdrop
					end
				end
				6 : begin // state Sreturn_em
					seq_itm.cnt_d = 1'b0;
					if(seq_itm.acc>1'b0) begin
						if(!seq_itm.empty_25&&seq_itm.acc>=6'b011001) begin
							seq_itm.ret_25_d = 1'b1;
							seq_itm.acc_d = seq_itm.acc-6'b011001;
							seq_itm.sm_state_var_d=7; // calls Sret_pulse
							seq_itm.sm_return_var_d=6; // returns to Sreturn_em
						end
						else begin
							if(!seq_itm.empty_10&&seq_itm.acc>=5'b01010) begin
								seq_itm.ret_10_d = 1'b1;
								seq_itm.acc_d = seq_itm.acc-5'b01010;
								seq_itm.sm_state_var_d=7; // calls Sret_pulse
								seq_itm.sm_return_var_d=6; // returns to Sreturn_em
							end
							else begin
								if(!seq_itm.empty_5&&seq_itm.acc>=3'b101) begin
									seq_itm.ret_5_d = 1'b1;
									seq_itm.acc_d = seq_itm.acc-3'b101;
									seq_itm.sm_state_var_d=7; // calls Sret_pulse
									seq_itm.sm_return_var_d=6; // returns to Sreturn_em
								end
								else begin
									seq_itm.acc_d = 1'b0;
									seq_itm.sm_state_var_d=1; // goto Sdrop
								end
							end
						end
					end
					else begin
						seq_itm.cnt_d = 1'b0;
						seq_itm.acc_d = 1'b0;
						seq_itm.sm_state_var_d=1; // goto Sdrop
					end
				end
				7 : begin // state Sret_pulse
					if(seq_itm.cnt>$urandom_range(13'b0001111101000,14'b00011111010000)) begin
						seq_itm.ret_5_d = 1'b0;
						seq_itm.ret_10_d = 1'b0;
						seq_itm.ret_25_d = 1'b0;
						seq_itm.cnt_d = 1'b0;
						seq_itm.sm_state_var_d=8; // goto Srec_pulse
					end
					else begin
						seq_itm.cnt_d = seq_itm.cnt+1'b1;
					end
				end
				8 : begin // state Srec_pulse
					if(seq_itm.cnt>$urandom_range(13'b0001111101000,17'b00010011100010000)) begin
						seq_itm.sm_state_var_d=seq_itm.sm_return_var; // return
						seq_itm.cnt_d = 1'b0;
					end
					else begin
						seq_itm.cnt_d = seq_itm.cnt+1'b1;
					end
				end
			endcase // ending state machine sm_state_var

            `uvm_info("DRIVER", $sformatf("Driving Sequence"), UVM_MEDIUM)
        endtask : drive


endclass : my_driver
