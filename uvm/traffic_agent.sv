class traffic_agent extends uvm_agent;

  `uvm_component_utils(traffic_agent)

  traffic_driver driver;
  traffic_monitor monitor;
  uvm_sequencer #(traffic_seq_item) sequencer;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);

    driver = traffic_driver::type_id::create("driver",this);
    monitor = traffic_monitor::type_id::create("monitor",this);
    sequencer = uvm_sequencer #(traffic_seq_item)::type_id::create("sequencer",this);

  endfunction

  function void connect_phase(uvm_phase phase);

    driver.seq_item_port.connect(sequencer.seq_item_export);

  endfunction

endclass
