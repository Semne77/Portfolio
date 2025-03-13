# SOS Game - Python Implementation  

## 🎮 Project Overview  
The **SOS Game** is a classic **turn-based strategy game** where two players take turns placing letters **'S'** and **'O'** on a grid to form the word **"SOS"** in any direction (horizontal, vertical, or diagonal). This project includes:  
- **Graphical User Interface (GUI)** using `Tkinter`  
- **Multiple game modes** (Simple Game & General Game)  
- **AI-controlled player options**  
- **Move recording and replay system**  

📽 **Video Overview:** [Watch the demo](https://www.loom.com/share/7f4f401645e74a85bec9dd08b91db8fe?sid=9b1f6b4a-a0e9-4ad6-a734-4ef3b0f31a62)  

---

## 🛠 Features  
✔ **GUI-based gameplay** using Tkinter  
✔ **Two game modes** (Simple Game & General Game)  
✔ **Human vs. Human, Human vs. AI, AI vs. AI modes**  
✔ **Game replay system** – review previous moves  
✔ **Move tracking and file storage**  

---

## 🏗 How It Works  

### **1️⃣ Game Modes**  
- **Simple Game**: First player to form "SOS" wins.  
- **General Game**: Players continue forming "SOS" until the grid is full. The player with more SOS formations wins.  

### **2️⃣ AI Selection Options**  
- **Mode 1**: AI is **Player 1**  
- **Mode 2**: AI is **Player 2**  
- **Mode 3**: Both players are AI  
- **Mode 4**: Both players are human  

### **3️⃣ Core Functionalities**  
- `make_move(row, col, symbol)`: Places a player's selected letter in a grid cell.  
- `ai_move()`: AI selects a random valid move.  
- `checkGameOver()`: Determines if the game has ended.  
- `provide_sample_game()`: Displays a replay of the recorded moves.  
- `save_move_to_file()`: Saves moves to a file for later review.  
- `toggle_output()`: Shows or hides recorded moves in the GUI.  

---

## 💻 Installation & Running the Game  

### **🔹 Prerequisites**  
- **Python 3.x**  
- **Required Libraries**: Install dependencies using:  
  ```bash
  pip install pytest
