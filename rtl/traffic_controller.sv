module traffic_controller(

    input clk,
    input reset,
    input [3:0] vehicle_count,
    input pollution_flag,
    input fine_paid,

    output reg north_light,
    output reg south_light,
    output reg east_light,
    output reg west_light
);

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        north_light <= 0;
        south_light <= 0;
        east_light  <= 0;
        west_light  <= 0;
    end

    else
    begin

        if(pollution_flag && !fine_paid)
        begin
            north_light <= 0;
            south_light <= 0;
            east_light  <= 0;
            west_light  <= 0;
        end

        else if(vehicle_count > 8)
        begin
            north_light <= 1;
            south_light <= 1;
            east_light  <= 0;
            west_light  <= 0;
        end

        else
        begin
            north_light <= 0;
            south_light <= 0;
            east_light  <= 1;
            west_light  <= 1;
        end

    end

end

endmodule
