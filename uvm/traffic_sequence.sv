class traffic_sequence extends uvm_sequence #(traffic_seq_item);

  `uvm_object_utils(traffic_sequence)

  function new(string name="traffic_sequence");
    super.new(name);
  endfunction

  task body();

    traffic_seq_item req;

    repeat(20)
    begin
      req = traffic_seq_item::type_id::create("req");

      start_item(req);
      assert(req.randomize());
      finish_item(req);
    end

  endtask

endclass
