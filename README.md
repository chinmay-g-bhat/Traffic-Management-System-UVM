# Traffic Management System using UVM

## Overview

This project presents the design and functional verification of a Traffic Management System using SystemVerilog and the Universal Verification Methodology (UVM). The objective is to develop a reliable traffic controller and verify its functionality using a modular UVM-based verification environment.

## Features

- RTL design using SystemVerilog
- UVM-based verification environment
- Sequence-based stimulus generation
- Functional coverage collection
- Self-checking scoreboard
- Modular verification components

## Tools Used

- SystemVerilog
- UVM
- Siemens QuestaSim
- Synopsys Verdi
- Synopsys TestMAX
- EDA Playground

## Repository Structure

```text
Traffic-Management-System-UVM/
│
├── rtl/
│   └── traffic_controller.sv
│
├── uvm/
│   ├── traffic_interface.sv
│   ├── traffic_item.sv
│   ├── traffic_sequence.sv
│   ├── traffic_driver.sv
│   ├── traffic_monitor.sv
│   ├── traffic_coverage.sv
│   ├── traffic_scoreboard.sv
│   ├── traffic_agent.sv
│   ├── traffic_env.sv
│   ├── traffic_test.sv
│   └── tb_top.sv
│
└── README.md
