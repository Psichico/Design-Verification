// Include all the testbench files here. The order of files is the order in which they compile. 
//`include "./../uvc/fifo_driver.sv"
// include fifo_agent, fifo_env and fifo_test files in the order it is mentioned.  


package fifo_pkg;

	import uvm_pkg::*;

	`include "./../uvc/fifo_driver.sv"
	`include "./../uvc/fifo_agent.sv"
	`include "./../uvc/fifo_env.sv"
	`include "./../test/fifo_test.sv"

endpackage
