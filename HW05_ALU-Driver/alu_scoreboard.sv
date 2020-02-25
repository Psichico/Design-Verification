class my_scoreboard extends uvm_scoreboard; //Create a scoreboard
	`uvm_component_utils(my_scoreboard)      //uvm_macro
	
    //uvm_analysis_port #(my_sequence_item ,scoreboard) scoreboard_port;	        // 12.2.2.3 ports, exports and imps
    uvm_analysis_imp #(my_sequence_item ,my_scoreboard) scoreboard_port; //test the diff betwn port and imp
	// TRY tlm analysis port

	my_sequence_item seq_itm;
	virtual my_interface intf;

	function new(string name="alu_scoreboard",uvm_component parent=null); //create constructor
		super.new(name,parent);
	endfunction : new
	
	function void build_phase(uvm_phase phase);     //build phase
		`uvm_info("alu_scoreboard","build phase",UVM_NONE);		
		scoreboard_port =  new("scoreboard_port building",this);
		if (!uvm_config_db#(virtual my_interface)::get(this, "*", "my_interface", intf))
		begin
			`uvm_fatal("SB", "Could not get intf")
		end
	endfunction : build_phase

  	virtual function write (my_sequence_item seq_itm);
        //`uvm_info("SCOREBOARD","write function", UVM_NONE)
        if (seq_itm.ctl == 2'b01) 
		begin
			seq_itm.my_z = seq_itm.test_bit_a + seq_itm.test_bit_b;
            $display("..........................................................................ctl = 01");
		end

		else if (seq_itm.ctl == 2'b11)
		begin
			seq_itm.my_z = seq_itm.test_bit_a ^ seq_itm.test_bit_b;                
            $display("..........................................................................ctl = 11");
		end

        else if (seq_itm.ctl == 2'b00)
        begin
            seq_itm.my_z = seq_itm.test_bit_a;
            $display("..........................................................................ctl = 00");
        end
		else
		begin
            seq_itm.my_z = seq_itm.test_bit_a - seq_itm.test_bit_b;	
            $display("..........................................................................ctl = 10");
		end

		if (seq_itm.my_z == seq_itm.z)
			`uvm_info("SCBD", $sformatf("PASS  out=%0d expected=%0d, ctl=%d", seq_itm.z, seq_itm.my_z, seq_itm.ctl), UVM_NONE)
		else 
			`uvm_info("SCBD", $sformatf("FAIL  out=%0d expected=%0d, ctl=%d", seq_itm.z, seq_itm.my_z, seq_itm.ctl), UVM_NONE)

  	
  	endfunction
	
    task run_phase(uvm_phase phase);    //run phase
		seq_itm = my_sequence_item::type_id::create("seq_itm",this);
	endtask : run_phase

endclass : my_scoreboard








	/*
			if (seq_itm.ctl == 2'b01) 
			begin
			seq_itm.my_z = seq_itm.test_bit_a + seq_itm.test_bit_b;
			`uvm_info("SCBD", $sformatf("ADDER ON. my_z = %0d", seq_itm.my_z), UVM_MEDIUM)
			end

			else if (seq_itm.ctl == 2'b11)
			begin
			seq_itm.my_cout = 0;
			`uvm_info("SCBD", $sformatf("XOR ON. my_z = %0d", seq_itm.my_cout), UVM_MEDIUM)                
			end

			else
			begin
			`uvm_info("SCBD", $sformatf("other op"), UVM_MEDIUM)
			`uvm_info("scoreboard", $sformatf("a=%0h b=%0h ctl=%b z=%b", seq_itm.test_bit_a, seq_itm.test_bit_b, seq_itm.ctl, seq_itm.z), UVM_LOW)
			end

			if (seq_itm.my_z == seq_itm.z)
			`uvm_info("SCBD", $sformatf("PASS  out=%0d my_out=%0d", seq_itm.z, seq_itm.my_z), UVM_HIGH)
			else 
			`uvm_info("SCBD", $sformatf("FAIL  out=%0d my_out=%0d", seq_itm.z, seq_itm.my_z), UVM_HIGH)
*/
