# Traffic Management System using UVM

## Overview

This project presents the RTL design and UVM-based functional verification of a Traffic Management System using SystemVerilog.

The Traffic Management System is designed to control traffic signals for a T-shaped road intersection using a finite state machine (FSM). The RTL design is developed using SystemVerilog, while the functional verification is performed using a SystemVerilog UVM-based verification environment.

## Features

- RTL design using SystemVerilog
- FSM-based traffic signal control
- UVM-based functional verification
- Sequence item and sequence-based stimulus generation
- Driver and monitor components
- Functional coverage
- Self-checking scoreboard
- Modular UVM verification environment
- Simulation waveform analysis
- RTL schematic analysis
- Synthesis schematic analysis
- Power analysis
- FPGA device and package information

## Project Structure

Traffic-Management-System-UVM/

├── rtl/
│   └── [traffic_controller.sv](rtl/traffic_controller.sv)

├── uvm/
│   ├── [traffic_interface.sv](uvm/traffic_interface.sv)
│   ├── [traffic_item.sv](uvm/traffic_item.sv)
│   ├── [traffic_sequence.sv](uvm/traffic_sequence.sv)
│   ├── [traffic_driver.sv](uvm/traffic_driver.sv)
│   ├── [traffic_monitor.sv](uvm/traffic_monitor.sv)
│   ├── [traffic_coverage.sv](uvm/traffic_coverage.sv)
│   ├── [traffic_scoreboard.sv](uvm/traffic_scoreboard.sv)
│   ├── [traffic_agent.sv](uvm/traffic_agent.sv)
│   ├── [traffic_env.sv](uvm/traffic_env.sv)
│   ├── [traffic_test.sv](uvm/traffic_test.sv)
│   └── [tb_top.sv](uvm/tb_top.sv)

├── results/
│   ├── [simulation_output.txt](results/simulation_output.txt)
│   └── [waveform.png](results/waveform.png)

├── vivado_results/
│   └── vivado/
│       ├── [Device.png](vivado_results/vivado/Device.png)
│       ├── [PAckage.png](vivado_results/vivado/PAckage.png)
│       ├── [Power_Report.png](vivado_results/vivado/Power_Report.png)
│       ├── [RTL_Schematic.png](vivado_results/vivado/RTL_Schematic.png)
│       ├── [Synthesis_Schematic.png](vivado_results/vivado/Synthesis_Schematic.png)
│       └── [README.md](vivado_results/vivado/README.md)

├── [LICENSE](LICENSE)
└── [README.md](README.md)

## RTL Design

The traffic controller is implemented using a finite state machine (FSM) to control the traffic signals of a T-shaped intersection.

The RTL source code is available below:

[Open Traffic Controller RTL](rtl/traffic_controller.sv)

## UVM Verification Environment

A SystemVerilog UVM-based verification environment was developed to verify the functional behavior of the traffic controller.

The verification environment contains:

- **Interface** – Provides the connection between the DUT and UVM testbench.
- **Sequence Item** – Defines the stimulus data used during verification.
- **Sequence** – Generates stimulus for the verification environment.
- **Driver** – Drives stimulus to the DUT through the virtual interface.
- **Monitor** – Observes DUT activity.
- **Coverage** – Collects functional coverage during simulation.
- **Scoreboard** – Performs self-checking by comparing expected and observed behavior.
- **Agent** – Integrates the driver and monitor components.
- **Environment** – Integrates the UVM verification components.
- **Test** – Configures and executes the verification environment.
- **Testbench Top** – Connects the DUT, interface, and UVM testbench.

The complete UVM source code is available in the [UVM directory](uvm/).

## Simulation Results

The RTL design and UVM verification environment were simulated using EDA Playground.

The simulation output contains the executed test cases, UVM messages, verification results, and simulation summary.

[Open Simulation Output](results/simulation_output.txt)

[Open Simulation Waveform](results/waveform.png)

## Vivado Results

The RTL design was analyzed using Xilinx Vivado.

The repository includes the following Vivado results:

[Open RTL Schematic](vivado_results/vivado/RTL_Schematic.png)

[Open Synthesis Schematic](vivado_results/vivado/Synthesis_Schematic.png)

[Open Power Report](vivado_results/vivado/Power_Report.png)

[Open Device Information](vivado_results/vivado/Device.png)

[Open Package Information](vivado_results/vivado/PAckage.png)

Additional information about the Vivado results is available in the [Vivado Results README](vivado_results/vivado/README.md).

## Verification Summary

The UVM testbench was used to verify the functional behavior of the traffic controller through simulation.

The verification environment includes functional coverage and scoreboard-based checking to compare expected and observed behavior of the DUT.

Simulation output and waveform results are included in the repository for reference.

## Tools and Technologies

- SystemVerilog
- Universal Verification Methodology (UVM)
- Xilinx Vivado
- QuestaSim
- EDA Playground

## Author

**Chinmay G Bhat**

M.Tech in VLSI
