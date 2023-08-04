#!/bin/bash

board=(1 2 3 4 5 6 7 8 9)

function print_board {
  echo " ${board[0]} | ${board[1]} | ${board[2]} "
  echo "---+---+---"
  echo " ${board[3]} | ${board[4]} | ${board[5]} "
  echo "---+---+---"
  echo " ${board[6]} | ${board[7]} | ${board[8]} "
}

function check_win {
  if [[ ${board[$1]} == $2 && ${board[$3]} == $2 && ${board[$5]} == $2 ]]; then
    echo "$2 wins!"
    exit
  fi
}

function check_tie {
  for i in {0..8}; do
    if [[ ${board[$i]} != "X" && ${board[$i]} != "O" ]]; then
      return 1
    fi
  done
  echo "It's a tie!"
  exit
}
echo "enter -1 to exit:"
read $n

while $n -ne -1; do
while true; do
  print_board

  echo "Player 1 (X), enter your move (1-9):"
  read move
  while [[ ${board[$move-1]} == "X" || ${board[$move-1]} == "O" ]]; do
    echo "That space is already taken. Enter a valid move (1-9):"
    read move
  done
  board[$move-1]="X"

  check_win 0 X 1 X 2 X
  check_win 3 X 4 X 5 X
  check_win 6 X 7 X 8 X
  check_win 0 X 3 X 6 X
  check_win 1 X 4 X 7 X
  check_win 2 X 5 X 8 X
  check_win 0 X 4 X 8 X
  check_win 2 X 4 X 6 X
  check_tie

  print_board

  echo "Player 2 (O), enter your move (1-9):"
  read move
  while [[ ${board[$move-1]} == "X" || ${board[$move-1]} == "O" ]]; do
    echo "That space is already taken. Enter a valid move (1-9):"
    read move
  done
  board[$move-1]="O"

  check_win 0 O 1 O 2 O
  check_win 3 O 4 O 5 O
  check_win 6 O 7 O 8 O
  check_win 0 O 3 O 6 O
  check_win 1 O 4 O 7 O
  check_win 2 O 5 O 8 O
  check_win 0 O 4 O 8 O
  check_win 2 O 4 O 6 O
  check_tie

done
done