import 'dart:math';

import 'package:minimal_tic_tac_toe/models/board_item.dart';
import 'package:minimal_tic_tac_toe/models/match_result.dart';
import 'package:minimal_tic_tac_toe/utils/validate_player_wins.dart';

int miniMax(List<List<BoardItem>> board, int depth, bool isMax) {
  int boardVal = evaluateBoard(board, depth);

  var winner = validatePlayerWins(board, isMax ? 1 : 0);

  // Terminal node (win/lose/draw) or max depth reached.
  if (boardVal.abs() > 0 || depth == 0 || winner == MatchResult.tie) {
    return boardVal;
  }

  // Maximising player, find the maximum attainable value.
  if (isMax) {
    int highestVal = -9999999;
    for (int row = 0; row < 3; row++) {
      for (int col = 0; col < 3; col++) {
        if (board[row][col].selectedByPlayerNumber == null) {
          board[row][col].selectedByPlayerNumber = 1;
          highestVal = max(highestVal, miniMax(board, depth - 1, false));
          board[row][col].selectedByPlayerNumber = null;
        }
      }
    }
    return highestVal;
  } else {
    // Minimising player, find the minimum attainable value;
    int lowestVal = 9999999;
    for (int row = 0; row < 3; row++) {
      for (int col = 0; col < 3; col++) {
        if (board[row][col].selectedByPlayerNumber == null) {
          board[row][col].selectedByPlayerNumber = 0;
          lowestVal = min(lowestVal, miniMax(board, depth - 1, true));
          board[row][col].selectedByPlayerNumber = null;
        }
      }
    }
    return lowestVal;
  }
}
