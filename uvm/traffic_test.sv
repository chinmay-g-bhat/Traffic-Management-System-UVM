class traffic_test extends uvm_test;

  `uvm_component_utils(traffic_test)

  traffic_env env;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);

    env = traffic_env::type_id::create("env",this);

  endfunction
  
  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();   // ✅ THIS LINE
endfunction

  task run_phase(uvm_phase phase);

    traffic_sequence seq;

    phase.raise_objection(this);

    seq = traffic_sequence::type_id::create("seq");

    seq.start(env.agent.sequencer);

    #2000;

    phase.drop_objection(this);

  endtask

endclass
