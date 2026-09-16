# 4-Bit Multi-Function Barrel Shifter

[![Language](https://img.shields.io/badge/Language-Verilog-blue.svg)](https://en.wikipedia.org/wiki/Verilog)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

A high-performance, combinational **Barrel Shifter** implemented in Verilog HDL. Unlike a standard linear shift register that shifts data one bit per clock cycle, this barrel shifter uses a logarithmic multi-stage multiplexer structure to shift or rotate data by any specified bit count in **$\mathcal{O}(1)$ constant time** (a single cycle).

---

## 📌 Features

* **Constant-Time Execution:** Computes $N$-bit shifts within 1 combinational cycle.
* **4 Operations Supported:**
  * Logical Shift Left (`LSL`)
  * Logical Shift Right (`LSR`)
  * Arithmetic Shift Right (`ASR`) — preserves the sign bit for signed numbers.
  * Rotate Right (`ROR`) — circular wrap-around shift.
* **Parameterized & Synthesizable:** Clean, standard Verilog design optimized for FPGA synthesis and ASIC layouts.

---

### Supported Operations Summary

| Opcode (`mode`) | Operation | Example Input (`1011`) | Shift (`2`) | Result |
| :---: | :--- | :---: | :---: | :---: |
| `2'b00` | **Logical Shift Left (LSL)** | `1011` | 2 | `1100` |
| `2'b01` | **Logical Shift Right (LSR)** | `1011` | 2 | `0010` |
| `2'b10` | **Arithmetic Shift Right (ASR)** | `1011` | 2 | `1110` |
| `2'b11` | **Rotate Right (ROR)** | `1011` | 2 | `1110` |


### Output
#### Waveform
<img width="959" height="244" alt="image" src="https://github.com/user-attachments/assets/97df188b-324d-4ebd-98c7-68158e592fec" />

#### Simulation Terminal
<img width="773" height="167" alt="image" src="https://github.com/user-attachments/assets/0b9cbbf8-1bd5-4560-9a4d-e4cecb8e5fd0" />
