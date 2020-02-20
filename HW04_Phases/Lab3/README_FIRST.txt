 In this assignment, we will learn UVM_PHASES. There are 9 main UVM Phases.

  			

			 _____________              _ 
			/    BUILD    \              |
			\_____________/              |
                              ||                     |
			 _____\/______               |
			/   CONNECT   \              |----  Build Time.  
			\_____________/              |
                              ||                     |
                     _________\/_________            |
		    / END_OF_ELABORATION \           |
		    \____________________/          _|
                              ||             
             _       _________\/__________
            |       / START OF SIMULATION \ 
    RUN     |       \_____________________/
   TIME     |                 ||
            |            _____\/______      _
            |		/    RUN      \      |  ONE AND ONLY TASK FROM ALL THE PHASES. CAN TAKE DELAYS. ALL OTHER
	    |_		\_____________/     _|  UVM_PHASES ARE FUNCTIONS.
                              ||
			 _____\/______
			/   EXTRACT   \            _
			\_____________/             |
                              ||                    |
			 _____\/______              |
			/    CHECK    \             |
			\_____________/             |
                              ||                    |----- Clean up 
			 _____\/______              |
			/   REPORT    \             |
			\_____________/             |
                              ||                    |
			 _____\/______              |
			/    FINAL    \            _|
			\_____________/ 

		
Things that you are supposed to do in this lab. 
1. Inside UVC Directory 
        a. you will see 3 files. fifo_driver.sv, fifo_agent.sv and fifo_env.sv
	b. fifo_driver is complete. Use the same syntax and start completing fifo_agent.sv and fifo_env.sv 
2. Inside test Directory 
        a. Complete the fifo_test. Follow templates/remarks in this file. 
3. Inside package Directory 
        a. Complete the fifo_pkg. Include all the uvm files here, path will be wrt to sim directory. Follow templates/remarks in this file. 
4. Inside top Directory 
        a. Complete the fifo_top. Follow templates/remarks in this file. 
5. Inside sim Directory you will find a run script. 
        a. Complete the run script. Follow comments.
	b. To run the script, ./run when the file is executable. 

After everything in done rightly, simulate through run script. 
Please note, how each phase executes. It is important that you spend some time in eye-balling the simulation output. 
You will get a clear picture of what top-down fashion and bottom up fashion means. 

If you'd like to learn more on Phases, Visit "http://www.verificationguide.com/p/uvm-phases.html"

We Hope you'll enjoy this assignment. 
Please don't forget to leave your feedback to Professor Morris. 
Be a Critique. We all learn through mistakes that 1 overlooks. 

GOOD LUCK :) 
			