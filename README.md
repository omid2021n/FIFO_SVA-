#This repository contains a **16-entry synchronous FIFO** implemented in Verilog, along with a simple testbench and assertion checks.
## Features

- 16-slot FIFO with 8-bit wide data
- Synchronous write and read with `clk`
- `full` and `empty` flags
- Wrap-around pointers for continuous operation
- Built-in assertions for verification:
  - Full flag matches count
  - Empty flag matches count
  - No write when full
  - No read when empty

## Files

- `FIFO.v` — main FIFO RTL
- `fifo_tb.v` — testbench with write/read sequences
- `fifo_assertions.sv` — SystemVerilog assertions
- `bind_fifo.sv` — assertion bind to FIFO for simulation
- 
