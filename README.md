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

## ⚙️ Architecture & Working Principle

A barrel shifter avoids multi-cycle latency by cascading layers of 2-to-1 multiplexers. Each stage handles a shift distance equal to a power of two ($2^0, 2^1, \dots, 2^{n-1}$).
