# BinarytoHex Game

## Project Overview

The **Binary-to-Hexadecimal Game** is an engaging, interactive two-player game designed for the **BASYS3 FPGA board**. It challenges players to input binary values using switches, aiming to reach the hexadecimal value `F` (binary `1111` or decimal `15`). The game demonstrates advanced FPGA design principles, including **Finite State Machines (FSM)**, **multiplexed display control**, and modular programming. With real-time feedback and a clear winner display, it offers an exciting introduction to digital design.

---

## Features

- **Finite State Machine (FSM)**:
  - Structured transitions through three states: **Ready**, **Active**, and **Win**.
- **Real-Time Feedback**:
  - Dynamically updates the 7-segment display to show player inputs and game states.
- **Interactive Two-Player Gameplay**:
  - Players alternate turns, inputting 4-bit binary values via switches.
- **Winner Announcement**:
  - Displays `P1F` (Player 1 Wins) or `P2F` (Player 2 Wins) on the 7-segment display.
- **Modular Design**:
  - Separates game logic and display management for ease of debugging and scalability.
- **Efficient Resource Utilization**:
  - Leverages multiplexing for dynamic display updates, reducing hardware overhead.

---

## How to Play

### 1. Initialization:
- Press the **RESET** button (`PIN U18`) to activate the **Ready State**.
- The 7-segment display cycles through `R`, `E`, `D`, and `Y` to indicate readiness.

### 2. Starting the Game:
- Press the **START** button (`PIN T18`) to transition to the **Active State**.

### 3. Gameplay:
- **Player Turns**: Players alternate turns to input a 4-bit binary number using switches.
- **Real-Time Feedback**: Each input is displayed on the 7-segment display for verification.
- The first player to input `F` (binary `1111`) wins the game.

### 4. Announcing the Winner:
- The winner is displayed as:
  - `P1F` for Player 1 Finish.
  - `P2F` for Player 2 Finish.

### 5. Resetting the Game:
- Press the **RESET** button to restart and return to the **Ready State**.

---

## Hardware Configuration

### Components
- **BASYS3 FPGA Board**
- **7-Segment Display**
- **Switches and Buttons**

### Pin Assignments

#### Buttons:
| Function  | Pin  |
|-----------|------|
| RESET     | U18  |
| START     | T18  |

#### Player Switches:
| Player   | Switches           | Pins                |
|----------|--------------------|---------------------|
| Player 1 | `sw[1]` to `sw[4]` | V16, W16, W17, W15 |
| Player 2 | `sw[11]` to `sw[14]` | R3, W2, U1, T1     |

#### 7-Segment Display:
- **Cathodes**: `seg[0]` to `seg[6]`
- **Anodes**: `an[0]` to `an[3]`

---

## Setup Instructions

### Prerequisites
- **BASYS3 FPGA board**
- **Vivado Design Suite**

### Steps
1. **Load Files**:
   - Import `Game.vhd` and `DisplayOutput.vhd` into your Vivado project.
2. **Apply Constraints**:
   - Use the provided `Master_Constraint.xdc` file to map FPGA pins.
3. **Synthesize and Implement**:
   - Generate the bitstream file and program the BASYS3 FPGA board.
4. **Verify Connections**:
   - Ensure all buttons, switches, and displays are functioning correctly.

---

## File Structure

- **[`Game.vhd`](./Files/Game.vhd)**:
  - Implements FSM logic for gameplay and state transitions.
- **[`DisplayOutput.vhd`](./Files/DisplayOutput.vhd)**:
  - Manages the 7-segment display using multiplexing.
- **[`Master_Constraint.xdc`](./Files/Master_Constraint.xdc)**:
  - Defines pin mappings for buttons, switches, and display components.

---

## Enhancements

- **Customizable Ready Sequence**:
  - Modify the initialization sequence for personalized startup animations.
- **Adjustable Winning Condition**:
  - Change the target value from `F` to any hexadecimal number.
- **Advanced Gameplay**:
  - Expand to support multi-digit hexadecimal inputs or additional players.

---

## Development Environment

- **Software**:
  - Vivado Design Suite
- **Hardware**:
  - BASYS3 FPGA Board

### Suggested Tools
- Logic analyzer for debugging
- Vivado simulator for design testing

---

## Acknowledgments

- Project developed as part of the **ENEL 384 Design Lab**.
- Special thanks to the **University of Regina ENSE Labs** for guidance and resources.

---

## License

This project is licensed under the [MIT License](./LICENSE). Feel free to use, modify, and distribute the code under the terms of the license.

---

## Additional Notes

- **Troubleshooting**:
  - If the 7-segment display doesn't function correctly, double-check the clock divider and pin mappings.
  - Ensure the FPGA board is powered and configured correctly.
- **Learning Opportunity**:
  - This project offers a hands-on introduction to state machines, multiplexing, and digital design principles.

---

By combining the elegance of modular design with interactive gameplay, the Binary-to-Hexadecimal Game serves as a fun and educational showcase of FPGA capabilities.
