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
			sm_state_var = 0;
			assign_values(seq_itm);
			drive(seq_itm);
            //`uvm_info("DRIVER", $sformatf(" ", ), UVM_MEDIUM)	 	
            seq_item_port.item_done();
		end
	endtask : run_phase

		virtual task assign_values(my_sequence_item seq_itm);
	
			assign ok=_out_ok;
			assign return_5=_out_return_5;
			assign return_10=_out_return_10;
			assign return_25=_out_return_25;
			`uvm_info("DRIVER", $sformatf("Assigning values"), UVM_MEDIUM)

		endtask : assign_values

        virtual task drive(my_sequence_item seq_itm);
            //drive all the inputs in your DUT
			acc_d <= acc;
			cnt_d <= cnt;
			ret_5_d <= ret_5;
			ret_10_d <= ret_10;
			ret_25_d <= ret_25;
			sm_state_var_d <= sm_state_var;
			sm_return_var_d <= sm_return_var;
			_out_return_5 <= ret_5;
			_out_return_10 <= ret_10;
			_out_return_25 <= ret_25;
			_out_ok <= 1'b0;

			sm_state_var_d <= sm_state_var;  // state holds value 
			sm_return_var_d <= sm_return_var; // return value hold
	
			case(sm_state_var)
				0 : begin // state Sreset
					cnt_d = 1'b0;
					acc_d = 1'b0;
					ret_5_d = 1'b0;
					ret_10_d = 1'b0;
					ret_25_d = 1'b0;
					sm_state_var_d=1; // goto Sdrop
				end
				1 : begin // state Sdrop
					cnt_d = 1'b0;
					case(1'b1)
						detect_5 : begin
							acc_d = acc+3'b101;
							sm_state_var_d=2; // calls down_5
							sm_return_var_d=1; // returns to Sdrop
						end
						detect_10 : begin
							acc_d = acc+5'b01010;
							sm_state_var_d=3; // calls down_10
							sm_return_var_d=1; // returns to Sdrop
						end
						detect_25 : begin
							acc_d = acc+6'b011001;
							sm_state_var_d=4; // calls down_25
							sm_return_var_d=1; // returns to Sdrop
						end
						return_coins : begin
							sm_state_var_d=6; // goto Sreturn_em
						end
						buy : begin
							sm_state_var_d=5; // goto Sbuy
						end
					endcase
				end
				2 : begin // state down_5
					if(!detect_5) begin
						cnt_d = cnt+1'b1;
						if(cnt>$urandom_range(6'b010100,6'b011110)) begin
							sm_state_var_d=sm_return_var; // return
						end
					end
				end
				3 : begin // state down_10
					if(!detect_10) begin
						cnt_d = cnt+1'b1;
						if(cnt>$urandom_range(6'b010100,6'b011110)) begin
							sm_state_var_d=sm_return_var; // return
						end
					end
				end
				4 : begin // state down_25
					if(!detect_25) begin
						cnt_d = cnt+1'b1;
						if(cnt>$urandom_range(6'b010100,6'b011110)) begin
							sm_state_var_d=sm_return_var; // return
						end
					end
				end
				5 : begin // state Sbuy
					if(acc>=amount) begin
						_out_ok = 1'b1;
						cnt_d = cnt+1'b1;
						if(cnt>$urandom_range(9'b001100100,10'b0011001000)) begin
							acc_d = acc-amount;
							sm_state_var_d=6; // goto Sreturn_em
						end
					end
					else begin
						sm_state_var_d=1; // goto Sdrop
					end
				end
				6 : begin // state Sreturn_em
					cnt_d = 1'b0;
					if(acc>1'b0) begin
						if(!empty_25&&acc>=6'b011001) begin
							ret_25_d = 1'b1;
							acc_d = acc-6'b011001;
							sm_state_var_d=7; // calls Sret_pulse
							sm_return_var_d=6; // returns to Sreturn_em
						end
						else begin
							if(!empty_10&&acc>=5'b01010) begin
								ret_10_d = 1'b1;
								acc_d = acc-5'b01010;
								sm_state_var_d=7; // calls Sret_pulse
								sm_return_var_d=6; // returns to Sreturn_em
							end
							else begin
								if(!empty_5&&acc>=3'b101) begin
									ret_5_d = 1'b1;
									acc_d = acc-3'b101;
									sm_state_var_d=7; // calls Sret_pulse
									sm_return_var_d=6; // returns to Sreturn_em
								end
								else begin
									acc_d = 1'b0;
									sm_state_var_d=1; // goto Sdrop
								end
							end
						end
					end
					else begin
						cnt_d = 1'b0;
						acc_d = 1'b0;
						sm_state_var_d=1; // goto Sdrop
					end
				end
				7 : begin // state Sret_pulse
					if(cnt>$urandom_range(13'b0001111101000,14'b00011111010000)) begin
						ret_5_d = 1'b0;
						ret_10_d = 1'b0;
						ret_25_d = 1'b0;
						cnt_d = 1'b0;
						sm_state_var_d=8; // goto Srec_pulse
					end
					else begin
						cnt_d = cnt+1'b1;
					end
				end
				8 : begin // state Srec_pulse
					if(cnt>$urandom_range(13'b0001111101000,17'b00010011100010000)) begin
						sm_state_var_d=sm_return_var; // return
						cnt_d = 1'b0;
					end
					else begin
						cnt_d = cnt+1'b1;
					end
				end
			endcase // ending state machine sm_state_var

            `uvm_info("DRIVER", $sformatf("Driving Sequence"), UVM_MEDIUM)
        endtask : drive


endclass : my_driver
