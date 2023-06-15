import 'dart:math';

import 'package:minimal_tic_tac_toe/models/board_item.dart';
import 'package:minimal_tic_tac_toe/models/levels.dart';
import 'package:minimal_tic_tac_toe/utils/minimax.dart';

class AI {
  static const int maxDepth = 6;

  const AI();

  Move findMoveByLevel(List<List<BoardItem>> board, Level level) {
    switch (level) {
      case Level.easy:
        int number1 = _genRandomNumber(0, 8);
        int number2 = _genRandomNumber(0, 8);
        if (number1 == number2) {
          // 12% movimiento oficial
          return _getBestMove(board);
        }
        return _getRandomMove(board);

      case Level.medium:
        int number1 = _genRandomNumber(0, 5);
        int number2 = _genRandomNumber(0, 5);
        if (number1 == number2) {
          // 20% movimiento aleatorio
          return _getRandomMove(board);
        }
        return _getBestMove(board);

      case Level.hight:
        int number1 = _genRandomNumber(0, 8);
        int number2 = _genRandomNumber(0, 8);
        if (number1 == number2) {
          // 12.5% movimiento aleatorio
          return _getRandomMove(board);
        }
        return _getBestMove(board);

      case Level.impossible:
        int number1 = _genRandomNumber(0, 20);
        int number2 = _genRandomNumber(0, 20);
        if (number1 == number2) {
          // 5% movimiento aleatorio
          return _getRandomMove(board);
        }
        return _getBestMove(board);
    }
  }

  int _genRandomNumber(int min, int max) => min + Random().nextInt(max - min);

  Move _getBestMove(List<List<BoardItem>> board) {
    Move move = Move(col: -1, row: -1);
    int bestValue = -9999999;

    for (int row = 0; row < board.length; row++) {
      for (int col = 0; col < board.length; col++) {
        if (board[row][col].selectedByPlayerNumber == null) {
          board[row][col].selectedByPlayerNumber = 1;
          int moveValue = miniMax(board, maxDepth, false);
          board[row][col].selectedByPlayerNumber = null;
          if (moveValue > bestValue) {
            move.row = row;
            move.col = col;
            bestValue = moveValue;
          }
        }
      }
    }
    return move;
  }

  Move _getRandomMove(List<List<BoardItem>> board) {
    Move move = Move(col: -1, row: -1);
    List<BoardItem> availableMoves = [];

    for (int x = 0; x < board.length; x++) {
      for (int y = 0; y < board.length; y++) {
        if (board[x][y].selectedByPlayerNumber == null) {
          availableMoves.add(board[x][y]);
        }
      }
    }

    if (availableMoves.length == 1) {
      move.col = availableMoves[0].yPosition;
      move.row = availableMoves[0].xPosition;
    }

    if (availableMoves.isNotEmpty && availableMoves.length > 1) {
      int randomIndex = _genRandomNumber(1, availableMoves.length);
      move.col = availableMoves[randomIndex - 1].yPosition;
      move.row = availableMoves[randomIndex - 1].xPosition;
    }

    return move; // No available moves
  }
}

class Move {
  int row;
  int col;

  Move({required this.col, required this.row});

  set setCol(int col) => this.col = row;
  set setRow(int row) => this.row = row;
}
