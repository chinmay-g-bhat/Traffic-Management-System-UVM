class traffic_coverage extends uvm_component;

  `uvm_component_utils(traffic_coverage)

  virtual traffic_if vif;

  covergroup traffic_cg;

    vehicle_cp : coverpoint vif.vehicle_count {
      bins low_range  = {[0:3]};
      bins mid_range  = {[4:8]};
      bins high_range = {[9:15]};
    }

    pollution_cp : coverpoint vif.pollution_flag {
      bins no_pollution = {0};
      bins pollution    = {1};
    }

    fine_cp : coverpoint vif.fine_paid {
      bins unpaid = {0};
      bins paid   = {1};
    }

    cross vehicle_cp, pollution_cp, fine_cp;

  endgroup


  function new(string name, uvm_component parent);
    super.new(name,parent);

    // Covergroup must be constructed here
    traffic_cg = new();

  endfunction


  function void build_phase(uvm_phase phase);

    if(!uvm_config_db #(virtual traffic_if)::get(this,"","vif",vif))
      `uvm_fatal("COV","Interface not found")

  endfunction


  task run_phase(uvm_phase phase);

    forever begin
      @(posedge vif.clk);
      traffic_cg.sample();
    end

  endtask


  function void report_phase(uvm_phase phase);

    `uvm_info("COVERAGE",
      $sformatf("Functional Coverage = %0.2f %%", traffic_cg.get_coverage()),
      UVM_LOW)

  endfunction

endclass
