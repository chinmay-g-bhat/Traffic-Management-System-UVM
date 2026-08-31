class traffic_item extends uvm_sequence_item;

  rand bit [2:0] traffic_state;

  `uvm_object_utils(traffic_item)

  function new(string name = "traffic_item");
    super.new(name);
  endfunction

endclass
