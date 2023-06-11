import 'package:minimal_tic_tac_toe/models/board_item.dart';
import 'package:minimal_tic_tac_toe/models/match_result.dart';

MatchResult validatePlayerWins(List<List<BoardItem>> board, int currentPlayer) {
  // Check rows
  for (int row = 0; row < 3; row++) {
    if (board[row][0].selectedByPlayerNumber == currentPlayer &&
        board[row][0].selectedByPlayerNumber ==
            board[row][1].selectedByPlayerNumber &&
        board[row][0].selectedByPlayerNumber ==
            board[row][2].selectedByPlayerNumber) {
      switch (row) {
        case 0:
          return MatchResult.firstRow;
        case 1:
          return MatchResult.secondRow;
        case 2:
          return MatchResult.thirdRow;
      }
    }
  }

  // Check columns
  for (int col = 0; col < 3; col++) {
    if (board[0][col].selectedByPlayerNumber == currentPlayer &&
        board[0][col].selectedByPlayerNumber ==
            board[1][col].selectedByPlayerNumber &&
        board[0][col].selectedByPlayerNumber ==
            board[2][col].selectedByPlayerNumber) {
      switch (col) {
        case 0:
          return MatchResult.firstColumn;
        case 1:
          return MatchResult.secondColumn;
        case 2:
          return MatchResult.thirdColumn;
      }
    }
  }

  // Check diagonals
  if (board[0][0].selectedByPlayerNumber == currentPlayer &&
      board[0][0].selectedByPlayerNumber ==
          board[1][1].selectedByPlayerNumber &&
      board[0][0].selectedByPlayerNumber ==
          board[2][2].selectedByPlayerNumber) {
    return MatchResult.firstDiagonal;
  }
  if (board[2][0].selectedByPlayerNumber == currentPlayer &&
      board[2][0].selectedByPlayerNumber ==
          board[1][1].selectedByPlayerNumber &&
      board[2][0].selectedByPlayerNumber ==
          board[0][2].selectedByPlayerNumber) {
    return MatchResult.secondDiagonal;
  }

  for (int row = 0; row < 3; row++) {
    for (int col = 0; col < 3; col++) {
      if (board[row][col].selectedByPlayerNumber == null) {
        return MatchResult.none;
      }
    }
  }

  return MatchResult.tie;
}

int evaluateBoard(List<List<BoardItem>> board, int depth) {
  var iaWin = validatePlayerWins(board, 1);
  var playerWin = validatePlayerWins(board, 0);

  if (iaWin != MatchResult.tie && iaWin != MatchResult.none) {
    return 10 + depth;
  }
  if (playerWin != MatchResult.tie && playerWin != MatchResult.none) {
    return -10 - depth;
  }

  return 0;
}
