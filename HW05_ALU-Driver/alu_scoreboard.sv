	`uvm_analysis_imp_decl(_a)
	`uvm_analysis_imp_decl(_b)
	
class my_scoreboard extends uvm_scoreboard; //Create a scoreboard
	`uvm_component_utils(my_scoreboard)      //uvm_macro
	
    uvm_analysis_imp_a #(my_sequence_item ,my_scoreboard) scoreboard_port; //test the diff betwn port and imp
	uvm_analysis_imp_b #(my_sequence_item, my_scoreboard) scoreboard_port_2;

	my_sequence_item seq_itm;	
	virtual my_interface intf;
    bit [7:0] out, exp;
    bit [7:0] a,b;

	function new(string name="alu_scoreboard",uvm_component parent=null); //create constructor
		super.new(name,parent);
		scoreboard_port =  new("scoreboard_port building",this);
		scoreboard_port_2 =  new("scoreboard_port_2 building",this);
	endfunction : new
	
	function void build_phase(uvm_phase phase);     //build phase
		`uvm_info("alu_scoreboard","build phase",UVM_NONE);		

			seq_itm = my_sequence_item::type_id::create("seq_itm",this);
        if (!uvm_config_db#(virtual my_interface)::get(this, "*", "my_interface", intf))
		begin
			`uvm_fatal("SB", "Could not get intf")
		end
	endfunction : build_phase

	virtual function write_b(my_sequence_item seq_itm);
		//`uvm_info("SCOREBOARD","write_b function", UVM_NONE)	
        out = seq_itm.z;
    endfunction
	
  	virtual function write_a(my_sequence_item seq_itm);
        //`uvm_info("SCOREBOARD","write_a function", UVM_NONE)
        a = seq_itm.test_bit_c;
        b = seq_itm.test_bit_d;

        if (seq_itm.ctl == 2'b01) 
		begin
			seq_itm.my_z = seq_itm.test_bit_c + seq_itm.test_bit_d;
            exp = seq_itm.my_z;
            //$display("..........................................................................ctl = 01");
		end

		else if (seq_itm.ctl == 2'b11)
		begin
			seq_itm.my_z = seq_itm.test_bit_c ^ seq_itm.test_bit_d;                
            exp = seq_itm.my_z;
            //$display("..........................................................................ctl = 11");
		end

        else if (seq_itm.ctl == 2'b00)
        begin
            seq_itm.my_z = seq_itm.test_bit_c;
            exp = seq_itm.my_z;
            //$display("..........................................................................ctl = 00");
		    `uvm_info("SCOREBOARD","ctl = 0", UVM_NONE)	
        end
		else if (seq_itm.ctl == 2'b10)
		begin
            seq_itm.my_z = seq_itm.test_bit_c - seq_itm.test_bit_d;	
            exp = seq_itm.my_z;
            //$display("..........................................................................ctl = 10");
		end
       	else
          seq_itm.my_z = seq_itm.my_z;

  	endfunction

	virtual function void compare();
		//seq_itm = my_sequence_item::type_id::create("seq_itm",this);
		if (out == exp)
		begin
		`uvm_info("SCBD", $sformatf("PASS  a=%d, b= %d, out=%d exp=%d, ctl=%d",a, b, out, exp, seq_itm.ctl), UVM_MEDIUM)
		end
		else
		begin 
		`uvm_info("SCBD", $sformatf("FAIL  a=%d, b= %d, out=%d exp=%d, ctl=%d", a, b, out, exp, seq_itm.ctl), UVM_MEDIUM)
		end
	endfunction: compare
	
	function void connect_phase(uvm_phase phase);
		//scoreboard_port.connect(fifo1.analysis_export);
		//scoreboard_port_2.connect(fifo2.analysis_export);
	endfunction: connect_phase
	
	
    task run_phase(uvm_phase phase);    //run phase
		
		forever begin		
           #5;
			compare();
		end
	endtask : run_phase

endclass : my_scoreboard
