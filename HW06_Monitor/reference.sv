class ref_model extends uvm_monitor;
    `uvm_component_utils(ref_model)

	//instantiate interface, sequence item, analysis port
	uvm_analysis_port #(my_sequence_item) ref_port;
	virtual	vend_intf intf;
	my_sequence_item seq_itm;
	
    bit [23:0] ref_return_5, ref_return_10, ref_return_25;
    bit ref_ok;
    bit out_flag;
    bit [15:0] c5, c10, c25;
    bit [31:0] in_amount, buy_amount, amount_buffer, amount_to_return, returned_amount;
    
	function new (string name = "ref_model", uvm_component parent = null);
		super.new(name, parent);
	endfunction
	
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		ref_port = new("ref_port", this);
		
        ref_ok         = 1'b0;
        ref_return_5   = 24'd0;
        ref_return_10  = 24'd0;
        ref_return_25  = 24'd0;
        out_flag       = 1'b0;
        c5             = 16'd0;
        c10            = 16'd0;
        c25            = 16'd0;
        in_amount      = 32'd0;
        buy_amount     = 32'd0;
        amount_buffer  = 32'd0;
        amount_to_return    = 32'd0;
        returned_amount     = 32'd0;
        

        if (!uvm_config_db#(virtual vend_intf)::get(this, "*", "my_interface", intf))
		begin
			`uvm_fatal("REF_MODEL", "Could not get virtual interface")
		end
	endfunction

	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("MONITOR","RUN PHASE", UVM_MEDIUM);
		seq_itm = my_sequence_item::type_id::create("seq_itm",this); 

        forever begin
        @(posedge intf.clk);
			fork
            //////////////////////////////////////////////////////////
            begin // :Fork1
                if((intf.ok == 1))
                begin
                @(negedge intf.ok)
                    ref_ok =  1'b1;
                end                
            end // :Fork1

            //////////////////////////////////////////////////////////
            begin // :Fork2
                if(intf.return_5 == 1)
                begin
                @(negedge intf.return_5)
                    ref_return_5 = ref_return_5 + 1'b1;
                    returned_amount  = returned_amount + 32'd5;
                    out_flag = 1'b1;
                end
                else if(intf.return_10 == 1)
                begin
                @(negedge intf.return_10)
                    ref_return_10 = ref_return_10 + 1'b1;
                    returned_amount  = returned_amount + 32'd10;
                    out_flag = 1'b1;
                end
                else if(intf.return_25 == 1)
                begin
                @(negedge intf.return_25)
                    ref_return_25 = ref_return_25 + 1'b1;
                    returned_amount  = returned_amount + 32'd25;
                    out_flag = 1'b1;
                end
            end // :Fork2
            
            //////////////////////////////////////////////////////////
            begin // :Fork3
                if (intf.detect_5 == 1)
                    begin // :1
                        @(negedge intf.detect_5)
                        in_amount = in_amount + 32'd5;
                    end // :1
                else if (intf.detect_10 == 1)
                    begin // :2
                        @(negedge intf.detect_10)
                        in_amount = in_amount + 32'd10;
                    end // :2
                else if (intf.detect_25 == 1)
                    begin // :3
                        @(negedge intf.detect_25)
                        in_amount = in_amount + 32'd25;
                    end // :3
            end // :Fork3

            //////////////////////////////////////////////////////////
            begin  // : Fork4    
                if(ref_ok == 1'b1)
                    buy_amount = intf.amount;
                else
                    buy_amount = 32'd0; 
        
                amount_to_return = in_amount - buy_amount;
                amount_buffer    = amount_to_return - ((ref_return_5 * 5) + (ref_return_10 * 10) + (ref_return_25 * 25));
                
                //`uvm_info("REF", $sformatf("ok=%d, ret5=%d, ret10=%d, ret25=%d", ref_ok, ref_return_5, ref_return_10, ref_return_25), UVM_MEDIUM);
                if(amount_buffer == 32'd0 && out_flag == 1'b1)
                begin
                    get_from_intf(seq_itm);
                    ref_port.write(seq_itm);
                    `uvm_info("REF", $sformatf("ok=%d, ret5=%d, ret10=%d, ret25=%d", ref_ok, ref_return_5, ref_return_10, ref_return_25), UVM_MEDIUM);
                    out_flag = 1'b0;
                    ref_ok = 1'b0;
					ref_return_5 = 24'd0;
					ref_return_10 = 24'd0;
					ref_return_25 = 24'd0;
                    amount_to_return = 32'd0;
                    amount_buffer    = 32'd0;
                    in_amount        = 32'd0;
                    returned_amount  = 32'd0;
                end

                if(returned_amount > in_amount) //DUT 1
                  `uvm_error("REF","ERROR FLAG");
            end // : Fork4

            join
        end	
	endtask

	virtual task get_from_intf(my_sequence_item seq_itm);
        seq_itm.ok = ref_ok;
        seq_itm.return_5 = ref_return_5;
        seq_itm.return_10 = ref_return_10;
        seq_itm.return_25 = ref_return_25;
	endtask: get_from_intf

endclass : ref_model
