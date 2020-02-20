// This is the top most module that instantiates DUT and Testbench. 
// We also pass a default test name here.

module fifo_top(); 

// Import UVM Packages
// Include uvm_macros.svh
// Include fifo_pkg. Mention the path rightly.

  initial begin
    run_test("PASS_FIFO_TEST_NAME_HERE"); // This argument will be a class name. 
  end 

  initial begin
    #200 $finish; 
  end 

endmodule : fifo_top