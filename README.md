# FSM-Up-Down-Counter-(2bit)

A robust hardware implementation of a **2-Bit Finite State Machine (FSM) Up/Down Counter** written in Verilog HDL. The design utilizes a single-procedural-block synchronous FSM architecture to ensure glitch-free state transitions and optimal hardware synthesis.

## Features
* **Synchronous Reset:** Safely resets the counter to its initial state (`2'b00`) on the rising edge of the clock when `rst` is asserted.
* **Direction Control (`dir`):** Dynamic mode switching between an incrementing counter (`dir = 0`) and a decrementing counter (`dir = 1`).
* **Clean State Transitions:** Handled natively via a robust state register tracking 4 unique states (`s0` to `s3`).

---

## State Transition Topology

The Finite State Machine operates as a modulo-4 ring topology. Depending on the `dir` signal, the transitions cycle as follows:

* **Count Up Loop (`dir = 0`):** `00` $\rightarrow$ `01` $\rightarrow$ `10` $\rightarrow$ `11` $\rightarrow$ `00`
* **Count Down Loop (`dir = 1`):** `00` $\rightarrow$ `11` $\rightarrow$ `10` $\rightarrow$ `01` $\rightarrow$ `00`

---
# Output Waveform
<img width="1532" height="378" alt="image" src="https://github.com/user-attachments/assets/17edbc84-e948-4db0-a56b-597525704e49" />

## Repository Structure

```text
├── RTL/
│   └── FSM_Up_Down_counter.v     # Synthesizable FSM Counter design
├── Testbench/
│   └── FSM_Up_Down_counter_tb.v  # Testbench driving clock, reset, and direction
└── README.md                     # Project documentation

