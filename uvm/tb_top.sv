module tb_top;

bit clk = 0;

always #5 clk = ~clk;


traffic_if vif(clk);


traffic_controller dut(

    .clk(clk),
    .reset(vif.reset),
    .vehicle_count(vif.vehicle_count),
    .pollution_flag(vif.pollution_flag),
    .fine_paid(vif.fine_paid),

    .north_light(vif.north_light),
    .south_light(vif.south_light),
    .east_light(vif.east_light),
    .west_light(vif.west_light)

);


initial
begin
    $dumpfile("dump.vcd");
    $dumpvars;
end


initial
begin
    vif.reset = 1;
    #20;
    vif.reset = 0;
end


initial
begin
    uvm_config_db #(virtual traffic_if)::set(null,"*","vif",vif);
    run_test("traffic_test");
end

endmodule
