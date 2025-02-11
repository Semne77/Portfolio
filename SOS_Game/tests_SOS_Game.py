import pytest
from unittest.mock import patch
import tkinter as tk
from tkinter import messagebox

from sprint5 import SOSGameGUI, getInput

@pytest.fixture
def game_gui():
    root = tk.Tk()
    return SOSGameGUI(root, 3, 1, 4)

@pytest.fixture
def game_gui1():
    root = tk.Tk()
    return SOSGameGUI(root, 3, 2, 4)

def test_make_move(game_gui):
    with patch('builtins.input', side_effect=['1', '2']):
        game_gui.make_move_button_clicked()  # Player 1's turn

    game_gui.make_move(0, 0, 'S')  # Player 1 makes a move
    assert game_gui.PlayerTrack() == 1  # Player 1's turn
    assert game_gui.flag is False

def test_make_move_button_clicked(game_gui):
    game_gui.make_move_button_clicked()  # Player 1's turn
    assert not game_gui.lists  # Flag should be False after a move

# Add more tests as needed

def test_get_input():
    with patch('builtins.input', side_effect=['1', '3', '4']):
        input_class = getInput()
        assert input_class.z == 4
        assert input_class.x == 3
        assert input_class.y == 1

def test_start_new_game():
    # Set up the necessary parameters for the test
    root = tk.Tk()
    board_size = 6
    game_mode = 1
    ai_mode = 4

    # Initialize the game
    game_gui = SOSGameGUI(root, board_size, game_mode, ai_mode)

    # Check if the game board size and game mode are correctly set
    assert game_gui.board_size == board_size
    assert game_gui.typeOfGame == game_mode
    assert game_gui.AIselection == ai_mode

def test_simple_game_sos_formation(game_gui):
    # Test SOS Formation
    game_gui.typeOfGame = 1
    game_gui.flag = False
    game_gui.trackMoves= [[0, 0, 'S'], [0, 1, 'O']]  # Simulate SOS formation
    game_gui.lists = [[0, 2, 'S']]
    print(game_gui.lists)
    
    assert game_gui.PlayerTrack() == 1  # Check if it's still Player 1's turn



def test_general_game_winner(game_gui1):
    """Tests if general_game correctly detects a winner."""
    # Simulate a winning sequence for Player 1
    winning_moves = [
        (0, 0, 'S'), (0, 1, 'O'), (0, 2, 'S'),  # Player 1 forms SOS
        (1, 0, 'S'), (1, 1, 'O'), (1, 2, 'O'),  # Player 2 fills some squares
        (2, 0, 'S'), (2, 1, 'O'), (2, 2, 'S'),  # Player 1 completes the second SOS
    ]
    game_gui1.board_size = 3
    for row, col, symbol in winning_moves[:-1]:
        game_gui1.make_move(row, col, symbol)
        game_gui1.flag = False
        print(game_gui1.lists)
        game_gui1.make_move_button_clicked()
        print(game_gui1.lists)
        print(len(game_gui1.trackMoves))
        print(game_gui1.trackMoves)
    game_gui1.make_move(*winning_moves[-1])
    # Assert that the game lists are empty (no more moves can be made)
    game_gui1.make_move_button_clicked()
    assert not game_gui1.trackMoves  # Track moves should be cleared.

def test_ai_move(game_gui):
    row, col, symbol = game_gui.ai_move()
    assert 0 <= row < game_gui.board_size
    assert 0 <= col < game_gui.board_size
    assert symbol in ['S', 'O']

def test_perform_ai_move_invalid_move(game_gui):
    """
    Test if perform_ai_move makes a valid move for each AI selection.
    In this test, the AI selection is set to 1 and it's Player 2's turn.
    As Player 2, the AI should not make a move.
    """
    game_gui.AIselection = 1  # Set AI selection to 1
    game_gui.current_player = 1  # Set current player to Player 2
    game_gui.perform_ai_move()  # Call perform_ai_move
    
    # Assert that no move was made by AI (row, col, ai_symbol should be None)
    assert game_gui.row is None
    assert game_gui.col is None
    #assert game_gui.ai_symbol is None



if __name__ == "__main__":
    pytest.main()




