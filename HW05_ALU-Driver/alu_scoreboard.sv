	`uvm_analysis_imp_decl(_a)
	`uvm_analysis_imp_decl(_b)
	
class my_scoreboard extends uvm_scoreboard; //Create a scoreboard
	`uvm_component_utils(my_scoreboard)      //uvm_macro
	
<<<<<<< HEAD
    //uvm_analysis_port #(my_sequence_item ,scoreboard) scoreboard_port;	        // 12.2.2.3 ports, exports and imps
    uvm_analysis_imp #(my_packet ,my_scoreboard) scoreboard_port; //test the diff betwn port and imp
	// TRY tlm analysis port

	my_packet pkt_itm;
=======
    uvm_analysis_imp_a #(my_sequence_item ,my_scoreboard) scoreboard_port; //test the diff betwn port and imp
	uvm_analysis_imp_b #(my_sequence_item, my_scoreboard) scoreboard_port_2;

	my_sequence_item seq_itm;
    
    my_sequence_item seq_itm_sb_a, seq_itm_sb_b;

    my_sequence_item queue_a [$];
    my_sequence_item queue_b [$];

    bit [7:0] expected;
    bit [7:0] out;

>>>>>>> pal_code
	virtual my_interface intf;

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

        if (!uvm_config_db#(virtual my_interface)::get(this, "*", "my_interface", intf))
		begin
			`uvm_fatal("SB", "Could not get intf")
		end
	endfunction : build_phase

<<<<<<< HEAD
  	virtual function write (my_packet pkt_itm);
        //`uvm_info("SCOREBOARD","write function", UVM_NONE)
        if (pkt_itm.ctl == 2'b01) 
		begin
			pkt_itm.my_z = pkt_itm.test_bit_a + pkt_itm.test_bit_b;
            //$display("..........................................................................ctl = 01");
		end
=======
	virtual function write_b(my_sequence_item seq_itm);
       queue_b.push_back(seq_itm);
    endfunction
	
  	virtual function write_a(my_sequence_item seq_itm);
       queue_a.push_back(seq_itm);
  	endfunction
>>>>>>> pal_code

	virtual function void compare();
		if (expected == out)
		begin
<<<<<<< HEAD
			pkt_itm.my_z = pkt_itm.test_bit_a ^ pkt_itm.test_bit_b;                
            //$display("..........................................................................ctl = 11");
		end

        else if (pkt_itm.ctl == 2'b00)
        begin
            pkt_itm.my_z = pkt_itm.test_bit_a;
            //$display("..........................................................................ctl = 00");
        end
		else if (pkt_itm.ctl == 2'b10)
		begin
            pkt_itm.my_z = pkt_itm.test_bit_a - pkt_itm.test_bit_b;	
            //$display("..........................................................................ctl = 10");
		end

       // else
        //  seq_itm.my_z = seq_itm.my_z;

		if (pkt_itm.my_z == pkt_itm.z)
			`uvm_info("SCBD", $sformatf("PASS  a=%d, b= %d, z=%d my_z=%d, ctl=%d",pkt_itm.test_bit_a, pkt_itm.test_bit_b, pkt_itm.z, pkt_itm.my_z, pkt_itm.ctl), UVM_NONE)
		else 
			`uvm_info("SCBD", $sformatf("FAIL  a=%d, b= %d, z=%d my_z=%d, ctl=%d",pkt_itm.test_bit_a, pkt_itm.test_bit_b, pkt_itm.z, pkt_itm.my_z, pkt_itm.ctl), UVM_NONE)

  	
  	endfunction
=======
		`uvm_info("SCBD", $sformatf("PASS  a=%d, b= %d, out=%d exp=%d",seq_itm_sb_a.test_bit_a, seq_itm_sb_a.test_bit_b, out, expected), UVM_MEDIUM)
		end
		else
		begin 
		`uvm_info("SCBD", $sformatf("FAIL  a=%d, b= %d, out=%d exp=%d",seq_itm_sb_a.test_bit_a, seq_itm_sb_a.test_bit_b, out, expected), UVM_MEDIUM)
		end
	endfunction: compare
	
	function void connect_phase(uvm_phase phase);
	endfunction: connect_phase
	
>>>>>>> pal_code
	
    task run_phase(uvm_phase phase);    //run phase
		
		forever begin		
            wait(queue_a.size != 0 && queue_b.size != 0)
            begin
		    seq_itm_sb_a = queue_a.pop_front();
            seq_itm_sb_b = queue_b.pop_front();
            out = seq_itm_sb_b.z;

                if (seq_itm_sb_a.ctl == 2'b01) 
		        begin
			        expected = seq_itm_sb_a.test_bit_a + seq_itm_sb_a.test_bit_b;// + {8'b0,seq_itm_sb_a:};
		        end

		        else if (seq_itm_sb_a.ctl == 2'b11)
		        begin
			        expected = seq_itm_sb_a.test_bit_a ^ seq_itm_sb_a.test_bit_b;
		        end

                else if (seq_itm_sb_a.ctl == 2'b00)
                begin
			        expected = seq_itm_sb_a.test_bit_a;
                end
		        else if (seq_itm_sb_a.ctl == 2'b10)
		        begin
			        expected = seq_itm_sb_a.test_bit_a - seq_itm_sb_a.test_bit_b;
		        end
       	        else
                    expected = expected;

                compare();
                //#5;
            end
            
		end
	endtask : run_phase

endclass : my_scoreboard
