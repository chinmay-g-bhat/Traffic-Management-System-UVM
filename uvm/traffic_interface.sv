interface traffic_if(input bit clk);

    logic reset;
    logic [3:0] vehicle_count;
    logic pollution_flag;
    logic fine_paid;

    logic north_light;
    logic south_light;
    logic east_light;
    logic west_light;

endinterface
