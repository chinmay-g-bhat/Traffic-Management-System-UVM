class traffic_env extends uvm_env;

  `uvm_component_utils(traffic_env)

  traffic_agent agent;
  traffic_scoreboard sb;
  traffic_coverage cov;   // NEW

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);

    agent = traffic_agent::type_id::create("agent",this);
    sb    = traffic_scoreboard::type_id::create("sb",this);
    cov   = traffic_coverage::type_id::create("cov",this);  // NEW

  endfunction

endclass
