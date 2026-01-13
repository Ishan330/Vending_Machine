# Vending_Machine
# Vending Machine (Verilog HDL)

A coin-operated vending machine implemented in **Verilog HDL** using a **datapath and FSM-based controller architecture**.  
The design models item selection, coin insertion, balance update, and item dispensing logic.

---

## 📌 Project Description
- Datapath handles arithmetic, storage, and comparison operations
- Controller (FSM) generates control signals based on system state
- Fully verified using a Verilog testbench and waveform simulation

---

## 📂 Project Files

| File | Description |
|-----|------------|
| `datapath.v` | Datapath RTL (MUX, registers, adder, subtractor, comparator) |
| `controller.v` | FSM-based controller generating control signals |
| `tb.v` | Testbench for functional verification |
| `vending.vcd` | Simulation waveform dump |
| `WAVEFORM.png` | GTKWave simulation output |
| `DATAPATH_CIRCUIT.png` | Datapath block diagram |
| `TERMINAL_OUTPUT.txt` | Terminal simulation results |

---

## 🔁 How It Works (One-Liners)
- User selects an item
- Item price is loaded into the price register
- Valid coins are accepted and added to balance
- Comparator checks balance vs price
- Item is dispensed when balance ≥ price

---

## ▶️ How to Run / View

### Run Simulation
```bash
iverilog -o simv datapath.v controller.v tb.v
vvp simv
