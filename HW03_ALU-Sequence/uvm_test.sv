class my_test extends uvm_test;

  `uvm_component_utils(my_test)

  function new (string name = "my_test", uvm_component parent = null)
    super.new(name, parent);

    endfunction

    my_env env_alu;

    function void build_phase (uvm_phase phase);
      super.build_phase (phase);

      env_alu = my_env::type_id::create("ENV_ALU", this);

    endfunction

    function void end_of_elaboration_phase(uvm_phase phase);
      uvm_top.print_topology();
    endfunction


    task run_phase(uvm_phase phase);

      my_sequence seq_alu = seq_alu::type_id::create("seq_alu",this);
      seq_alu.start(env_alu.seqr_alu);

    endtask


endclass
