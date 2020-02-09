// HW01 Messages. ID: 014521416

package my_package_1;

import uvm_pkg::*;

class scoreboard_1 extends uvm_scoreboard; //Create a scoreboard
	`uvm_component_utils(scoreboard_1)      //uvm_macro
	uvm_analysis_port #(string,scoreboard_1) source_port;	        // 12.2.2.3 ports, exports and imps

	function new(string name="scoreboard_1",uvm_component parent=null); //create constructor
		super.new(name,parent);
	endfunction : new
	
	function void build_phase(uvm_phase phase);     //build phase
		`uvm_info("scoreboard_1","build phase",UVM_MEDIUM);
		source_port =  new("source_port building",this);
	endfunction : build_phase

  	
    task run_phase(uvm_phase phase);    //run phase
		string send;
        int i=1;
        repeat(20)
        begin
            $sformat(send,">> %d  JAIMIL PATEL",i);    
            source_port.write(send);
            i++;
        end
	endtask : run_phase

endclass : scoreboard_1

class scoreboard_2 extends uvm_scoreboard;
	`uvm_component_utils(scoreboard_2)
	uvm_analysis_imp #(string,scoreboard_2) destination_port; 	
    
	function new(string name="scoreboard_2",uvm_component parent=null);
		super.new(name,parent);
	endfunction : new

	function void build_phase(uvm_phase phase);
		`uvm_info("scoreboard_2","build phase",UVM_MEDIUM);
        destination_port = new("destination_port build phase",this);
	endfunction : build_phase

    function void write(string message);
        `uvm_info("destination",$psprintf(">> %s",message),UVM_MEDIUM);
    endfunction : write
endclass : scoreboard_2	

class environment_1 extends uvm_env;
	`uvm_component_utils(environment_1)
	
	scoreboard_1 sb_send;
	scoreboard_2 sb_receive;	
	
    function new(string name="environment_1",uvm_component parent=null);
		super.new(name,parent);
	    sb_send = new("sb_send",this);
        sb_receive = new("sb_receive",this);
    endfunction : new

    function void build_phase(uvm_phase phase);
		`uvm_info("environment_1","build phase",UVM_MEDIUM);
	endfunction : build_phase

    function void connect_phase(uvm_phase phase);
       sb_send.source_port.connect(sb_receive.destination_port); //connect sbsend and sbreceive. connect port and export 
    endfunction : connect_phase

endclass : environment_1

class main extends uvm_test;
    `uvm_component_utils(main)
    
    environment_1 messages;

    function new(string name="main",uvm_component parent=null);
        super.new(name,parent);
    endfunction : new

    function void build_phase(uvm_phase phase);
		`uvm_info("main","build phase",UVM_MEDIUM);
        messages = environment_1::type_id::create("messages",this);
	endfunction : build_phase
    
    uvm_phase phase;
    task run_phase(uvm_phase phase);
        phase.raise_objection(phase);
        #50ns; //wait to receive all the messages
        phase.drop_objection(phase);
    endtask : run_phase
endclass : main

endpackage : my_package_1


import uvm_pkg::*;
import my_package_1::*;

module top();

    initial begin
        run_test("main");
    end
endmodule
