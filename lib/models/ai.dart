import 'dart:math';

import 'package:minimal_tic_tac_toe/models/board_item.dart';
import 'package:minimal_tic_tac_toe/utils/minimax.dart';

class Move {
  int row;
  int col;

  Move({required this.col, required this.row});

  set setRow(int row) => this.row = row;
  set setCol(int col) => this.col = row;
}

enum Level { easy, medium, hight, extreme }

class AI {
  final _random = Random();
  int _genRandomNumber(int min, int max) => min + _random.nextInt(max - min);

  static const int maxDepth = 6;

  Move findMoveByLevel(List<List<BoardItem>> board, Level level) {
    switch (level) {
      case Level.easy:
        return _getRandomMove(board);

      case Level.medium:
        int number1 = _genRandomNumber(0, 2);
        int number2 = _genRandomNumber(0, 2);
        if (number1 == number2) {
          return _getBestMove(board);
        }
        return _getRandomMove(board);

      case Level.hight:
        int number1 = _genRandomNumber(0, 4);
        int number2 = _genRandomNumber(0, 4);
        if (number1 == number2) {
          return _getRandomMove(board);
        }
        return _getBestMove(board);

      case Level.extreme:
        int number1 = _genRandomNumber(0, 10);
        int number2 = _genRandomNumber(0, 10);
        if (number1 == number2) {
          return _getRandomMove(board);
        }
        return _getBestMove(board);
    }
  }

  Move _getRandomMove(List<List<BoardItem>> board) {
    Move move = Move(col: -1, row: -1);
    List<BoardItem> availableMoves = [];
    for (int x = 0; x < 3; x++) {
      for (int y = 0; y < 3; x++) {
        if (board[x][y].selectedByPlayerNumber == null) {
          availableMoves.add(board[x][y]);
        }
      }
    }

    if (availableMoves.isNotEmpty) {
      int randomIndex = Random().nextInt(availableMoves.length);
      move.col = availableMoves[randomIndex].xPosition;
      move.row = availableMoves[randomIndex].yPosition;
    }

    return move; // No available moves
  }

  Move _getBestMove(List<List<BoardItem>> board) {
    Move move = Move(col: -1, row: -1);
    int bestValue = -9999999;

    for (int row = 0; row < 3; row++) {
      for (int col = 0; col < 3; col++) {
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
}
