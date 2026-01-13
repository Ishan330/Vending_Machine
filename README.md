# Vending_Machine
# 🧾 Vending Machine Design using Verilog HDL  
### Datapath + FSM Controller Architecture

## 📌 Overview
This project implements a **coin-based vending machine** using **Verilog HDL** with a clean separation between **datapath** and **controller**.

The controller is implemented as a **Finite State Machine (FSM)**, while the datapath contains registers, multiplexers, arithmetic units, and a comparator.

---

## 🎯 Features
- RTL design using **Verilog HDL**
- **FSM-based controller**
- Modular **datapath + controller** design
- Supports multiple coin denominations
- Parameterized item prices
- Fully verified using a testbench
- Interview-ready digital design project

---

## 🧠 Architecture

### Datapath Components
- **Registers**
  - `ITEM_REG`
  - `PRICE_REG`
  - `COIN_REG`
  - `BALANCE_REG`

- **Multiplexers**
  - `MUX_ITEM` – selects item price
  - `MUX_COIN` – selects coin value
  - `MUX_BAL` – selects balance update path

- **Functional Units**
  - `ADDER` – adds coin value to balance
  - `SUB` – subtracts price from balance
  - `COMP` – comparator (`LT`, `GT`, `EQ`)

📷 **Datapath Diagram**  
![Datapath](datapath.png)

---

## 🧠 Controller (FSM)
- Generates control signals:
  - `LD_ITEM`
  - `LD_PRICE`
  - `LD_COIN`
  - `ITEM_SEL`
  - `COIN_SEL`
- Uses comparator outputs (`LT`, `GT`, `EQ`) for state transitions

---

## 🔄 Working Principle
1. User selects an item
2. Item price is loaded into `PRICE_REG`
3. User inserts valid coins
4. Balance is updated using the adder
5. Comparator checks balance vs price
6. Item is dispensed when balance ≥ price
7. Remaining balance is stored

---

## 🧪 Simulation & Verification
- Verified using a custom Verilog testbench
- Only valid coin inputs are counted
- Balance and `done` signal verified

📷 **Simulation Waveform**  
![Waveform](waveform.png)

---

## 📁 Project Structure
