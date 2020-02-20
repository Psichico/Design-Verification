// This is the top most module that instantiates DUT and Testbench. 
// We also pass a default test name here.


`include "../package/fifo_pkg.sv"
`include "uvm_macros.svh"

module fifo_top(); 

	import uvm_pkg::*;
	import fifo_pkg::*;
	
	initial begin
		run_test("fifo_test"); // This argument will be a class name. 
	end 

	initial begin
		#200 $finish; 
	end 

endmodule : fifo_top
