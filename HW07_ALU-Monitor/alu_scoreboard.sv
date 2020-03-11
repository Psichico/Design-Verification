	
class my_scoreboard extends uvm_scoreboard; //Create a scoreboard
	`uvm_component_utils(my_scoreboard)      //uvm_macro
	
	`uvm_analysis_imp_decl(_a)
	`uvm_analysis_imp_decl(_b)
	
    uvm_analysis_imp_a #(my_sequence_item ,my_scoreboard) scoreboard_port; //test the diff betwn port and imp
	uvm_analysis_imp_b #(my_sequence_item, my_scoreboard) scoreboard_port_2;

	my_sequence_item seq_itm;
    my_sequence_item seq_itm_sb_a, seq_itm_sb_b;

    my_sequence_item queue_a [$];
    my_sequence_item queue_b [$];

    bit [7:0] expected;
    bit [7:0] out;
	bit [8:0] buff;

	virtual alu_if intf;

	function new(string name="alu_scoreboard",uvm_component parent=null); //create constructor
		super.new(name,parent);
		scoreboard_port =  new("scoreboard_port building",this);
		scoreboard_port_2 =  new("scoreboard_port_2 building",this);
	endfunction : new
	
	function void build_phase(uvm_phase phase);     //build phase
		`uvm_info("alu_scoreboard","build phase",UVM_NONE);		
			seq_itm = my_sequence_item::type_id::create("seq_itm",this);
			seq_itm_sb_a = my_sequence_item::type_id::create("seq_itm_sb_a",this);
			seq_itm_sb_b = my_sequence_item::type_id::create("seq_itm_sb_b",this);

        if (!uvm_config_db#(virtual alu_if)::get(this, "*", "alu_if", intf))
		begin
			`uvm_fatal("SB", "Could not get intf")
		end
	endfunction : build_phase

	virtual function write_b(my_sequence_item seq_itm);
       queue_b.push_back(seq_itm);
    endfunction
	
  	virtual function write_a(my_sequence_item seq_itm);
       queue_a.push_back(seq_itm);
  	endfunction


	virtual function void my_compare();
		if (expected == out)
		begin
			`uvm_info("SCBD", $sformatf("PASS  a=%d, b= %d, out=%d exp=%d",seq_itm_sb_a.test_bit_a, seq_itm_sb_a.test_bit_b, out, expected), UVM_MEDIUM)
		end
		else
		begin 
			`uvm_info("SCBD", $sformatf("FAIL  a=%d, b= %d, out=%d exp=%d",seq_itm_sb_a.test_bit_a, seq_itm_sb_a.test_bit_b, out, expected), UVM_MEDIUM)
		end
	endfunction: my_compare
	
	
    task run_phase(uvm_phase phase);    //run phase
		
		forever begin		
            wait(queue_a.size != 0 && queue_b.size != 0)
            begin
				seq_itm_sb_a = queue_a.pop_front();
				seq_itm_sb_b = queue_b.pop_front();
				out = seq_itm_sb_b.z;

				case(seq_itm_sb_a.ctl)

				0: buff = {1'b0 , seq_itm_sb_a.test_bit_a};
				1: buff = seq_itm_sb_a.test_bit_a + seq_itm_sb_a.test_bit_b + {8'b0 , seq_itm_sb_a.ci};
				2: buff = seq_itm_sb_a.test_bit_a - seq_itm_sb_a.test_bit_b + {8'b0 , seq_itm_sb_a.ci};
				3: buff = seq_itm_sb_a.test_bit_a ^ seq_itm_sb_a.test_bit_b;

				endcase
				expected = buff [7:0];
				my_compare();
				
            end
            
		end
	endtask : run_phase

endclass : my_scoreboard