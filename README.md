# Traffic Management System using UVM

## Overview

This project presents the RTL design and UVM-based functional verification of a Traffic Management System using SystemVerilog.

The Traffic Management System is designed to control traffic signals for a T-shaped road intersection using a finite state machine (FSM). The RTL design is simulated and analyzed using Xilinx Vivado, while the verification environment is developed using SystemVerilog and UVM.

## Project Structure

```text
Traffic-Management-System/
│
├── RTL/
│   └── traffic_controller.sv
│
├── UVM/
│   ├── traffic_item.sv
│   ├── traffic_sequence.sv
│   ├── traffic_driver.sv
│   ├── traffic_monitor.sv
│   ├── traffic_scoreboard.sv
│   ├── traffic_coverage.sv
│   ├── traffic_agent.sv
│   ├── traffic_env.sv
│   ├── traffic_test.sv
│   ├── traffic_interface.sv
│   └── tb_top.sv
│
├── Simulation/
│   ├── simulation_output.txt
│   └── waveform.png
│
├── Vivado_Results/
│   ├── RTL_Schematic/
│   ├── Synthesis_Schematic/
│   ├── Utilization/
│   ├── Timing/
│   ├── Power/
│   └── Device_Package/
│
└── README.md
