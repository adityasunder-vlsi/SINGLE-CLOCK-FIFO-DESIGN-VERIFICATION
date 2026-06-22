# Single Clock FIFO — Design & Verification

A synchronous (single clock) FIFO (First In, First Out) buffer designed in Verilog HDL and verified using a self-checking Verilog testbench, simulated on Intel ModelSim.

This project was built as part of an ongoing RTL/VLSI learning journey, focused on understanding FIFO architecture, pointer-based occupancy tracking, and waveform-driven verification.

---

## 📌 Overview

A FIFO is one of the most fundamental building blocks in digital design, used to safely buffer data between two parts of a system. This project implements a **single-clock FIFO**, where both the write and read operations happen on the same clock domain, making it a good first step before moving to asynchronous (dual-clock) FIFOs.

The design was built from scratch in Verilog, simulated, and debugged using waveform analysis to confirm correct FIFO behavior end-to-end.

---

## ⚙️ Logic & Design Process

- Implemented a synchronous FIFO architecture
- Designed a read/write pointer mechanism to track data flow
- Added a FIFO counter (`fifo_counter`) for occupancy tracking
- Generated **Full** and **Empty** status flags to prevent overflow/underflow
- Developed a dedicated Verilog testbench for functional verification

---

## 🔌 Signal Description

| Signal | Direction | Description |
|---|---|---|
| `clk` | Input | Synchronization clock for read and write operations |
| `rst` | Input | Synchronous reset, initializes FIFO to empty state |
| `wr_en` | Input | Write enable signal |
| `rd_en` | Input | Read enable signal |
| `buf_in` | Input | Input data to be written into the FIFO |
| `buf_out` | Output | Output data read from the FIFO |
| `fifo_counter` | Internal/Output | Tracks the number of elements currently stored in the FIFO |

---

## 🧪 Verification Approach

A Verilog testbench was developed to drive stimulus into the FIFO and verify its functional correctness through waveform inspection.

**Verification flow followed:**

```
RTL Coding → Compilation → Simulation → Waveform Analysis → Debugging
```

**Test scenario:**
- Data written in sequence: `11 → 22 → 33`
- Data read back in the same sequence: `11 → 22 → 33`
- `fifo_counter` transitions observed: `0 → 1 → 2 → 3 → 2 → 1 → 0`

This confirms correct **First In, First Out** behavior — data is read out in exactly the order it was written, and the occupancy counter correctly tracks each write and read operation.

---

## 📊 Waveform Verification

The waveform output was analyzed to confirm:

✅ Correct data written into the FIFO in order
✅ Correct data read out of the FIFO in the same order
✅ Correct increment/decrement behavior of `fifo_counter` on every write/read
✅ No overflow or underflow during the test sequence

---

## 🖥️ Simulation Workflow (Intel ModelSim)

Standard ModelSim transcript commands were used throughout the simulation process for:

- Restarting simulations
- Adding waveform signals
- Running simulation timing
- Waveform zooming & debugging

---

## 🚀 Applications of FIFO

FIFOs are widely used across digital systems wherever data needs to be buffered between two interfaces operating at different rates or timings, including:

- UART / USB communication
- FPGA & ASIC pipelines
- Processor buffering
- Network systems
- Streaming architectures
- DMA controllers

---

## 🛠️ Skills Demonstrated

- Verilog HDL
- RTL Design
- Digital Logic Design
- Testbench Development
- ModelSim Simulation
- Waveform Analysis & Debugging

---

## 📂 Repository Structure

```
.
├── design/         # FIFO RTL design (Verilog)
├── testbench/      # Verilog testbench for verification
└── README.md
```

---

## 🔭 Next Steps

This project is part of an ongoing learning path. Planned next steps include:

- SystemVerilog Assertions (SVA) for protocol/property checking
- Functional coverage for verification completeness
- Asynchronous (dual-clock) FIFO design
- UVM-based verification environment

---

## 🏷️ Tags
