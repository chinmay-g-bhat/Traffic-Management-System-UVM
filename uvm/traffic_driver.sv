class traffic_driver extends uvm_driver #(traffic_seq_item);

  `uvm_component_utils(traffic_driver)

  virtual traffic_if vif;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);

    if(!uvm_config_db #(virtual traffic_if)::get(this,"","vif",vif))
      `uvm_fatal("DRV","Interface not found")

  endfunction

  task run_phase(uvm_phase phase);

    traffic_seq_item tr;

    forever
    begin

      seq_item_port.get_next_item(tr);

      @(posedge vif.clk);

      vif.vehicle_count <= tr.vehicle_count;
      vif.pollution_flag <= tr.pollution_flag;
      vif.fine_paid <= tr.fine_paid;

      seq_item_port.item_done();

    end

  endtask

endclass
