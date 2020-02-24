class alu_scoreboard extends uvm_scoreboard; //Create a scoreboard
	`uvm_component_utils(alu_scoreboard)      //uvm_macro
	
    //uvm_analysis_port #(my_sequence_item ,scoreboard) scoreboard_port;	        // 12.2.2.3 ports, exports and imps
    uvm_analysis_imp #(my_sequence_item ,scoreboard) scoreboard_port; //test the diff betwn port and imp

	function new(string name="alu_scoreboard",uvm_component parent=null); //create constructor
		super.new(name,parent);
	endfunction : new
	
	function void build_phase(uvm_phase phase);     //build phase
		`uvm_info("alu_scoreboard","build phase",UVM_MEDIUM);
		scoreboard_port =  new("scoreboard_port building",this);
	endfunction : build_phase

  	
    task run_phase(uvm_phase phase);    //run phase
		
        my_sequence_item seq_itm;

        forever begin
		//	@(posedge intf.clk);
			if (!rst) begin        
                $sformat(string, "In run phase of scoreboard");    
                scoreboard_port.write(string);

                `uvm_info("scoreboard", $sformatf("a=%0d b=%0d", 
                               seq_itm.a, seq_itm.b), UVM_LOW)
                
                if (seq_itm.ctl == 2'b01) 
                begin
                    seq_itm.my_z = seq_itm.test_bit_a + seq_itm.test_bit_b;
                    `uvm_info("SCBD", $sformatf("ADDER ON. my_z = %0d", seq_itm.my_z))
                end

                elseif (seq_itm.ctl == 2'b11)
                begin
                    seq_itm.my_cout = 0;
                    `uvm_info("SCBD", $sformatf("XOR ON. my_z = %0d", seq_itm.my_cout))                
                end

                else
                begin
                    `uvm_info("SCBD", $sformatf("other op"))
                end

                if (seq_itm.my_z == seq_itm.z)
                    `uvm_info("SCBD", $sformatf("PASS  out=%0d my_out=%0d", seq_itm.z, seq_itm.my_z), UVM_HIGH)
                else 
                    `uvm_info("SCBD", $sformatf("FAIL  out=%0d my_out=%0d", seq_itm.z, seq_itm.my_z), UVM_HIGH)
//                end else begin
//                `uvm_info("SCBD", $sformatf("PASS ! out=%0d exp=%0d", 
//                                            item.out, exp_out), UVM_HIGH)
            end
        end

	endtask : run_phase

endclass : alu_scoreboard