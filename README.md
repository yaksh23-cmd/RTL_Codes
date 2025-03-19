Memory Transfer Implementation by Verilog:

Introduction:
This project implements a Memory Transfer Block using Verilog. The goal is to simulate and analyze the timing diagram of the memory transfer operation. The block is divided into four main modules and one test module:

MEM_counter_A – Counter A and Memory A
Add_Sub – Data processing unit
MEM_counter_B – Counter B and Memory B
Controller – State machine for controlling operations
Test Module – For verifying functionality and timing
Block Diagram
The overall block diagram is shown in Fig. 2.45 (from Ref. [1]). The implementation follows a modular design for scalability and easier debugging.
![image](https://github.com/user-attachments/assets/033e84e9-84cb-4bb0-a068-639e36cc6f82)

Implementation Details:
1. MEM_counter_A
This module includes:
✅ 3-bit Counter

Generates an address AddrA based on:
Reset signal
Clock signal
Enable signal (IncA)
If Reset = 0 and IncA = 0 → AddrA = 0
If Reset = 0 and IncA = 1 → Increment AddrA
✅ Memory A

Two operating modes:
Write Mode: When WEA = 1, data from DataInA is stored at AddrA
Read Mode: When WEA = 0, data from AddrA is sent to Dout1

2. Add_Sub
This module represents the data path between Memory A and Memory B:
✅ D Flip-Flop – Stores Dout1 from the previous cycle → Outputs Dout2
✅ Comparator (COMP) – Compares Dout1 and Dout2 → Generates Sign signal
✅ Adder – Computes ADDOut = Dout1 + Dout2
✅ Subtractor – Computes SUBOut = Dout1 - Dout2
✅ Multiplexer (MUX) – Selects between ADDOut and SUBOut based on Sign

If Dout2 < Dout1 → Sign = 1 → Outputs ADDOut
If Dout2 > Dout1 → Sign = 0 → Outputs SUBOut
3. MEM_counter_B
This module includes:
✅ 2-bit Counter

Generates an address AddrB based on:
Reset signal
Clock signal
Enable signal (IncB)
If Reset = 1 → AddrB = 0
If Reset = 0 and IncB = 1 → Increment AddrB
✅ Memory B

Two operating modes:
Write Mode: When WEB = 1, data from DataInB is stored at AddrB
Read Mode: When WEB = 0, write operation is disabled
4. Controller
✅ Implements a Moore State Machine

Controls the behavior of:
IncA, IncB – Increment signals for Counter A and B
WEA, WEB – Write enable signals for Memory A and B
State transitions are defined based on the clock cycles and comparison results
5. Test Module
✅ Forms the top-level module for testing

Inputs:
Clock – 200ps
Reset – Initially 1, then set to 0 after 80ps
DataInA – Initialized to 0, incremented every 200ps for 8 cycles
Checks the timing diagram and expected data flow between Memory A and Memory B
