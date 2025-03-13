# Connect Four - Python Implementation  

## Author  
Semyon Tsyrenov  

## Description  
This project is a Python-based implementation of the classic game **Connect Four**. It allows two players to take turns placing tokens in a **7-column, 6-row grid**, aiming to connect four tokens **horizontally, vertically, or diagonally** before the opponent does.  

## How to Play  
1. The game is played between **two players**.  
2. Players take turns placing their tokens (**Player 1 uses 1, Player 2 uses 2**).  
3. Players **select a column (0-6)** to drop their token.  
4. The first player to **connect four tokens** in a row, column, or diagonally **wins**.  
5. If all **42 spaces are filled** without a winner, the game **ends in a draw**.  

## How the Code Works  

### Main Functions  

- **setup()** – Initializes a 6x7 game board filled with zeros (empty slots).  
- **present(b)** – Displays the board in the console.  
- **colheight(b, c)** – Returns the height of tokens in column `c`.  
- **pt(b, p, c)** – Places player `p`'s token in column `c` at the lowest available row.  
- **vc(b, p, c)** – Checks if player `p` has won vertically in column `c`.  
- **hc(b, p, c)** – Checks if player `p` has won horizontally.  
- **d2(b, p)** – Checks for a diagonal win (**↘ pattern**).  
- **d4(b, p)** – Checks for a diagonal win (**↙ pattern**).  
- **playgame(b)** – Runs the main game loop:  
  - Asks players for column choices.  
  - Places tokens and checks for a winning condition.  
  - Displays the updated board.  
  - Ends the game if a player wins or if the board is full.  

## Features  
✔ **Two-player turn-based gameplay**  
✔ **Real-time board updates**  
✔ **Win detection for vertical, horizontal, and diagonal victories**  
✔ **Input validation for correct column selection**  
✔ **Game ends in a draw if no player wins within 42 turns**  

## How to Run the Game  

1. **Install Python** (if not already installed).  
2. **Download the script**: [Connect_4_Game.py](./Connect_4_Game.py)  
3. Open a terminal or command prompt and navigate to the script's directory.  
4. Run the game using:  
   ```bash
   python Connect_4_Game.py
