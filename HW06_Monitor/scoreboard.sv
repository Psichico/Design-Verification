	
class my_scoreboard extends uvm_scoreboard; //Create a scoreboard
	`uvm_component_utils(my_scoreboard)      //uvm_macro
	`uvm_analysis_imp_decl (_in)
	`uvm_analysis_imp_decl (_ref)
	
    uvm_analysis_imp_in #(my_sequence_item ,my_scoreboard) in_port; //test the diff betwn port and imp
	uvm_analysis_imp_ref #(my_sequence_item ,my_scoreboard) out_port;
	my_sequence_item seq_itm;

    my_sequence_item seq_itm_in;
	my_sequence_item seq_itm_out;

    my_sequence_item queue_in [$];
	my_sequence_item queue_out [$];

    bit [7:0] expected_out;
    bit [7:0] actual_out;

	virtual vend_intf intf;

	reg [7:0] sb_detect_5, sb_detect_10, sb_detect_25;
	reg sb_ok;

	reg sb_out_ret_25, sb_out_ret_10, sb_out_ret_5;
    reg [31:0] sb_amount;

	function new(string name="my_scoreboard",uvm_component parent=null); //create constructor
		super.new(name,parent);
		in_port =  new("in_port building",this);
		out_port =  new("out_port building",this);
	endfunction : new
	
	function void build_phase(uvm_phase phase);     //build phase
		`uvm_info("SCOREBOARD","BUILD PHASE",UVM_MEDIUM);		
		seq_itm = my_sequence_item::type_id::create("seq_itm",this);
		seq_itm_in = my_sequence_item::type_id::create("seq_itm_in",this);
		seq_itm_out = my_sequence_item::type_id::create("seq_itm_out",this);
        if (!uvm_config_db#(virtual vend_intf)::get(this, "*", "my_interface", intf))
		begin
			`uvm_fatal("SB", "Could not get virtual interface")
		end
	endfunction : build_phase

  	virtual function void write_in(my_sequence_item seq_itm);
       queue_in.push_back(seq_itm);
  	endfunction: write_in

	virtual function void write_ref(my_sequence_item seq_itm);
       queue_out.push_back(seq_itm);
  	endfunction: write_ref

	virtual function void compare();
		if (sb_ok == seq_itm_out.ok)
	    	`uvm_info("SCBD", $sformatf("PASS sb_ok %d = seq_ok %d", sb_ok, seq_itm_out.ok), UVM_MEDIUM)
		else	
			`uvm_info("SCBD", $sformatf("FAIL sb_ok %d = seq_ok %d  ", sb_ok, seq_itm_out.ok), UVM_MEDIUM)

		if ( sb_out_ret_5 == seq_itm_out.return_5)
		   	`uvm_info("SCBD", $sformatf("PASS sb_ret_5 %d = seq_ret_5 %d", sb_out_ret_5, seq_itm_out.return_5), UVM_MEDIUM)
		else
		   	`uvm_info("SCBD", $sformatf("FAIL sb_ret_5 %d = seq_ret_5 %d", sb_out_ret_5, seq_itm_out.return_5), UVM_MEDIUM)

		if ( sb_out_ret_10 == seq_itm_out.return_10)
			`uvm_info("SCBD", $sformatf("PASS sb_ret_10 %d = sb_ret_10 %d  ", sb_out_ret_10, seq_itm_out.return_10), UVM_MEDIUM)
		else
			`uvm_info("SCBD", $sformatf("FAIL seq_ret_10 %d = seq_ret_10 %d  ", sb_out_ret_10, seq_itm_out.return_10), UVM_MEDIUM)

		if ( sb_out_ret_25 == seq_itm_out.return_25)
			`uvm_info("SCBD", $sformatf("PASS sb_ret_25 %d = seq_ret_25 %d  ", sb_out_ret_25, seq_itm_out.return_25), UVM_MEDIUM)
		else
			`uvm_info("SCBD", $sformatf("FAIL sb_ret_25 %d = seq_ret_25 %d  ", sb_out_ret_25, seq_itm_out.return_25), UVM_MEDIUM)

	endfunction: compare
	
	function void connect_phase(uvm_phase phase);
	
    endfunction: connect_phase
	
    task run_phase(uvm_phase phase);    //run phase	
		forever begin		
            wait(queue_in.size != 0 && queue_out.size != 0)
            begin
		        seq_itm_in = queue_in.pop_front();
				seq_itm_out = queue_out.pop_front();
				//Write your code here
				if(!(seq_itm_in.buy || seq_itm_in.return_coins))
				begin
		   	        //`uvm_info("SCBD", $sformatf("not detected buy yet"), UVM_MEDIUM)
					detect_coins(seq_itm_in);
                end
				else
				begin
					buy_or_return(seq_itm_in);
				end
		   	    //`uvm_info("SB_LIST", $sformatf("%d  %d  %d  %d, %d %d %d", seq_itm_out.return_5, seq_itm_out.return_10, seq_itm_out.return_25, seq_itm_out.ok, seq_itm_in.detect_5, seq_itm_in.detect_10, seq_itm_in.detect_25), UVM_MEDIUM)
				compare();
            end
		end
	endtask : run_phase

	virtual task buy_or_return(my_sequence_item seq_itm_in);

		sb_amount = ((sb_detect_5*5)+(sb_detect_10*10)+(sb_detect_25*25));
		sb_ok = 1'b0;
        sb_out_ret_5 = 1'b0;
        sb_out_ret_10 = 1'b0;
        sb_out_ret_25 = 1'b0;

		if(seq_itm_in.buy == 1)
		begin
			sb_ok = 1'b1;
			sb_amount = ((sb_detect_5*5)+(sb_detect_10*10)+(sb_detect_25*25)) - seq_itm_in.amount ; 
		   	//`uvm_info("SCBD", $sformatf("buy = 1"), UVM_MEDIUM)
        end

		while(sb_amount != 0)
		begin
			if(!seq_itm.empty_25 && sb_amount>=6'b011001)  //why !empty_25
			begin
				sb_out_ret_25 = 1'b1; //make them zero in some state
				sb_amount = sb_amount - 6'b011001; 			
			end
			else 
			begin
				if(!seq_itm.empty_10 && sb_amount>=5'b01010) 
				begin
					sb_out_ret_10 = 1'b1;
					sb_amount = sb_amount - 5'b01010;
				end
				else 
				begin
					if(!seq_itm.empty_5 && sb_amount>=3'b101) 
					begin
						sb_out_ret_5 = 1'b1;
						sb_amount = sb_amount - 3'b101;
					end
					else 
					begin
						sb_amount = 1'b0; //to exit the while loop
					end
				end
            end
		end

	endtask : buy_or_return

	virtual task detect_coins(my_sequence_item seq_itm_in);
		case(1)

		seq_itm_in.detect_5:
		begin
		   	//`uvm_info("SCBD", $sformatf("detected 5"), UVM_MEDIUM)
			sb_detect_5 = sb_detect_5 + 1'b1;
		end

		seq_itm_in.detect_10:
		begin
		   	//`uvm_info("SCBD", $sformatf("detected 10"), UVM_MEDIUM)
			sb_detect_10 = sb_detect_10 + 1'b1;	
		end

		seq_itm_in.detect_25:
		begin
		   	//`uvm_info("SCBD", $sformatf("detected 25"), UVM_MEDIUM)
			sb_detect_25 = sb_detect_25 + 1'b1;	
		end

        endcase
	endtask: detect_coins

endclass : my_scoreboard
