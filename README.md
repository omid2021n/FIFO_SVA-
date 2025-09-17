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

 # Allocation: Simulator allocated 6417 kB (elbread=427 elab2=5854 kernel=135 sdf=0)
KERNEL: ASDB file was created in location /home/runner/dataset.asdb
KERNEL: T=0 | wr=0 rd=0 din=00 dout=xx full=x empty=x
KERNEL: T=5000 | wr=0 rd=0 din=00 dout=xx full=0 empty=1
KERNEL: T=10000 | wr=1 rd=0 din=61 dout=xx full=0 empty=1
KERNEL: Info: design.sv (83): Verify  Empty   time :15000
KERNEL: T=15000 | wr=1 rd=0 din=16 dout=xx full=0 empty=0
KERNEL: T=25000 | wr=1 rd=0 din=4d dout=xx full=0 empty=0
KERNEL: T=35000 | wr=1 rd=0 din=c8 dout=xx full=0 empty=0
KERNEL: T=45000 | wr=1 rd=0 din=d8 dout=xx full=0 empty=0
KERNEL: T=55000 | wr=1 rd=0 din=35 dout=xx full=0 empty=0
KERNEL: T=65000 | wr=1 rd=0 din=48 dout=xx full=0 empty=0
KERNEL: T=75000 | wr=1 rd=0 din=9a dout=xx full=0 empty=0
KERNEL: T=85000 | wr=1 rd=0 din=70 dout=xx full=0 empty=0
KERNEL: T=95000 | wr=1 rd=0 din=36 dout=xx full=0 empty=0
KERNEL: T=105000 | wr=1 rd=0 din=02 dout=xx full=0 empty=0
KERNEL: T=115000 | wr=1 rd=0 din=ef dout=xx full=0 empty=0
KERNEL: T=125000 | wr=1 rd=0 din=5e dout=xx full=0 empty=0
KERNEL: T=135000 | wr=1 rd=0 din=10 dout=xx full=0 empty=0
KERNEL: T=145000 | wr=1 rd=0 din=ad dout=xx full=0 empty=0
KERNEL: T=155000 | wr=1 rd=0 din=ec dout=xx full=1 empty=0
KERNEL: Info: design.sv (72): Verify  Full   time :165000
KERNEL: Info: design.sv (94): Verify WR and  Full   time :165000
KERNEL: T=165000 | wr=0 rd=1 din=ec dout=xx full=1 empty=0
KERNEL: T=175000 | wr=0 rd=1 din=ec dout=61 full=0 empty=0
KERNEL: T=185000 | wr=0 rd=1 din=ec dout=16 full=0 empty=0
KERNEL: T=195000 | wr=0 rd=1 din=ec dout=4d full=0 empty=0
KERNEL: T=205000 | wr=0 rd=1 din=ec dout=c8 full=0 empty=0
KERNEL: T=215000 | wr=0 rd=1 din=ec dout=d8 full=0 empty=0
KERNEL: T=225000 | wr=0 rd=1 din=ec dout=35 full=0 empty=0
KERNEL: T=235000 | wr=0 rd=1 din=ec dout=48 full=0 empty=0
KERNEL: T=245000 | wr=0 rd=1 din=ec dout=9a full=0 empty=0
# KERNEL: T=255000 | wr=0 rd=1 din=ec dout=70 full=0 empty=0
# KERNEL: T=265000 | wr=0 rd=1 din=ec dout=36 full=0 empty=0
# KERNEL: T=275000 | wr=0 rd=1 din=ec dout=02 full=0 empty=0
# KERNEL: T=285000 | wr=0 rd=1 din=ec dout=ef full=0 empty=0
# KERNEL: T=295000 | wr=0 rd=1 din=ec dout=5e full=0 empty=0
# KERNEL: T=305000 | wr=0 rd=1 din=ec dout=10 full=0 empty=0
# KERNEL: T=315000 | wr=0 rd=1 din=ec dout=ad full=0 empty=1
# KERNEL: Info: design.sv (83): Verify  Empty   time :325000
# KERNEL: Info: design.sv (106): Verify  RD and Empty   time :325000
# RUNTIME: Info: RUNTIME_0068 testbench.sv (79): $finish called.
# KERNEL: Time: 500 ns,  Iteration: 0,  Instance: /tb_fifo,  Process: @INITIAL#74_4@.
# KERNEL: stopped at time: 500 ns
# VSIM: Simulation has finished. There are no more test vectors to simulate.
# VSIM: Simulation has finished. 
  
