	
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

	virtual vend_intf intf;
    
    bit [7:0] expected_out;
    bit [7:0] actual_out;
	reg [7:0] sb_detect_5, sb_detect_10, sb_detect_25;
	reg sb_ok;
	reg sb_out_ret_25, sb_out_ret_10, sb_out_ret_5;
    reg [31:0] sb_amount;
    reg [19:0] sb_cnt;

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
			    sb_detect_5 = 0;
                sb_detect_10 = 0;
                sb_detect_25 = 0;
                sb_out_ret_5 = 1'b0;
                sb_out_ret_10 = 1'b0;
                sb_out_ret_25 = 1'b0;
                sb_cnt = 1'b0;
		        sb_ok = 1'b0;
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
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    task run_phase(uvm_phase phase); 	
		
        forever begin // :Forever
        @(posedge intf.clk)
        
            wait(queue_in.size != 0 && queue_out.size != 0)
            begin //: 1
                
                seq_itm_in = queue_in.pop_front();
				seq_itm_out = queue_out.pop_front();
            
            fork
            begin // :fork 1
                while(!(seq_itm_in.buy || seq_itm_in.return_coins))
                begin // :2
		            case(1)
		                seq_itm_in.detect_5:  sb_detect_5  = sb_detect_5  + 1'b1;
                        seq_itm_in.detect_10: sb_detect_10 = sb_detect_10 + 1'b1;	
		                seq_itm_in.detect_25: sb_detect_25 = sb_detect_25 + 1'b1;	
                    endcase
                end // :2
                
		        sb_amount = ((sb_detect_5*5)+(sb_detect_10*10)+(sb_detect_25*25));

		        if(seq_itm_in.buy == 1 && !(seq_itm_out.return_5 || seq_itm_out.return_10 || seq_itm_out.return_25))
		        begin // :3
			        sb_ok = 1'b1;
                    sb_cnt = sb_cnt + 1'b1; 
			        sb_amount = ((sb_detect_5*5)+(sb_detect_10*10)+(sb_detect_25*25)) - seq_itm_in.amount ; 
                
                end // :3

                else sb_ok = 1'b0;


                while(sb_amount != 0)
		        begin // :4
			        
                    if(!seq_itm_in.empty_25 && sb_amount>=6'b011001)  //why !empty_25
			        begin // :5                        
				        sb_out_ret_25 = 1'b1; //make them zero in some state
				        sb_amount = sb_amount - 6'b011001; 			
			        end // :5
			        
                    else 
			        begin // :6
				        if(!seq_itm_in.empty_10 && sb_amount>=5'b01010) 
				        begin // :7
					        sb_out_ret_10 = 1'b1;
					        sb_amount = sb_amount - 5'b01010;
				        end // :7
				        else 
				        begin // :8
					        if(!seq_itm_in.empty_5 && sb_amount>=3'b101) 
					        begin // :9
						        sb_out_ret_5 = 1'b1;
						        sb_amount = sb_amount - 3'b101;
					        end // :9
					        else 
					        begin // :10
                                sb_out_ret_5 = 1'b0;
                                sb_out_ret_10 = 1'b0;
                                sb_out_ret_25 = 1'b0;
						        sb_amount = 1'b0; //to exit the while loop
					        end // :10
				        end // :8
                    end // :6
		        end // :4
              
            end // :Fork1

            begin // :Fork2
		        if (sb_ok == seq_itm_out.ok)
	    	        `uvm_info("SCBD", $sformatf("PASS sb_ok %d = seq_ok %d || buy = %d", sb_ok, seq_itm_out.ok, seq_itm_in.buy), UVM_MEDIUM)
		        else	
			        `uvm_info("SCBD", $sformatf("FAIL sb_ok %d = seq_ok %d || buy = %d", sb_ok, seq_itm_out.ok, seq_itm_in.buy), UVM_MEDIUM)

		        if ( sb_out_ret_5 == seq_itm_out.return_5)
		   	        `uvm_info("SCBD", $sformatf("PASS sb_ret_5 %d = seq_ret_5 %d", sb_out_ret_5, seq_itm_out.return_5), UVM_MEDIUM)
		        else
		   	        `uvm_info("SCBD", $sformatf("FAIL sb_ret_5 %d = seq_ret_5 %d", sb_out_ret_5, seq_itm_out.return_5), UVM_MEDIUM)

		        if ( sb_out_ret_10 == seq_itm_out.return_10)
			        `uvm_info("SCBD", $sformatf("PASS sb_ret_10 %d = seq_ret_10 %d  ", sb_out_ret_10, seq_itm_out.return_10), UVM_MEDIUM)
		        else
			        `uvm_info("SCBD", $sformatf("FAIL sb_ret_10 %d = seq_ret_10 %d  ", sb_out_ret_10, seq_itm_out.return_10), UVM_MEDIUM)

		        if ( sb_out_ret_25 == seq_itm_out.return_25)
			        `uvm_info("SCBD", $sformatf("PASS sb_ret_25 %d = seq_ret_25 %d  ", sb_out_ret_25, seq_itm_out.return_25), UVM_MEDIUM)
		        else
			        `uvm_info("SCBD", $sformatf("FAIL sb_ret_25 %d = seq_ret_25 %d  ", sb_out_ret_25, seq_itm_out.return_25), UVM_MEDIUM)

	        end
            join

            
            end  //: 1
        end // :Forever
    endtask : run_phase
    
endclass : my_scoreboard
