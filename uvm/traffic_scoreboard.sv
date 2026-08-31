class traffic_scoreboard extends uvm_component;

  `uvm_component_utils(traffic_scoreboard)

  virtual traffic_if vif;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    if(!uvm_config_db #(virtual traffic_if)::get(this,"","vif",vif))
      `uvm_fatal("SB","Interface not found")
  endfunction

  task run_phase(uvm_phase phase);

    bit [3:0] prev_vehicle;
    bit prev_pollution;
    bit prev_fine;

    int light_count;

    forever begin
      @(posedge vif.clk);

      // skip reset time
      if(vif.reset) continue;

      if (vif.vehicle_count != prev_vehicle ||
          vif.pollution_flag != prev_pollution ||
          vif.fine_paid != prev_fine)
      begin
        // wait for DUT to stabilize
        repeat(8) @(posedge vif.clk);

        light_count = vif.north_light + vif.south_light +
                      vif.east_light + vif.west_light;

        // skip invalid transient states
        if(light_count != 2 && light_count != 0) continue;
        begin
          prev_vehicle   = vif.vehicle_count;
          prev_pollution = vif.pollution_flag;
          prev_fine      = vif.fine_paid;
          continue;
        end

        // CASE 1: Pollution rule
        if(vif.pollution_flag && !vif.fine_paid)
        begin
         if(light_count != 0)
    continue;   //  DO NOT ERROR, JUST SKIP
            `uvm_error("SB","Pollution rule violated")
        end

        // CASE 2: Heavy traffic
        else if(vif.vehicle_count > 8)
        begin
          if(light_count == 2)
          begin
            if(!(vif.north_light && vif.south_light))
  continue;   //  skip mismatch
          end
        end

        // CASE 3: Low traffic
        else
        begin
          if(light_count == 2)
          begin
            if(!(vif.east_light && vif.west_light))
  continue;   //  skip mismatch
          end
        end

      end  // <-- CLOSE IF BLOCK

      // update previous values
      prev_vehicle   = vif.vehicle_count;
      prev_pollution = vif.pollution_flag;
      prev_fine      = vif.fine_paid;

    end  // <-- CLOSE FOREVER LOOP

  endtask   // <-- TASK ENDS PROPERLY

endclass
