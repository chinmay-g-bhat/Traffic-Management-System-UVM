class traffic_monitor extends uvm_component;

  `uvm_component_utils(traffic_monitor)

  virtual traffic_if vif;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);

    if(!uvm_config_db #(virtual traffic_if)::get(this,"","vif",vif))
      `uvm_fatal("MON","Interface not found")

  endfunction

  task run_phase(uvm_phase phase);

  bit [3:0] prev_vehicle;
  bit prev_pollution;
  bit prev_fine;

  forever begin
    @(posedge vif.clk);

    if (vif.vehicle_count != prev_vehicle ||
        vif.pollution_flag != prev_pollution ||
        vif.fine_paid != prev_fine)
    begin
      `uvm_info("MONITOR",
        $sformatf("vehicle=%0d pollution=%0d fine=%0d",
        vif.vehicle_count,
        vif.pollution_flag,
        vif.fine_paid),
        UVM_LOW)
    end

    prev_vehicle   = vif.vehicle_count;
    prev_pollution = vif.pollution_flag;
    prev_fine      = vif.fine_paid;

  end

endtask

endclass
