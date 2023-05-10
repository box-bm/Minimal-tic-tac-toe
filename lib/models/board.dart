import 'package:minimal_tic_tac_toe/models/match_result.dart';

import 'board_item.dart';

class Board {
  final int boardSize;
  final MatchResult matchResult;
  final List<List<BoardItem>> board;
  final int? playerWinner;

  Board({
    required this.boardSize,
    required this.matchResult,
    this.playerWinner,
    required this.board,
  });

  const Board.defaultBoard({
    this.boardSize = 3,
    this.board = const [],
    this.playerWinner,
    this.matchResult = MatchResult.none,
  });

  Board copyWith({
    int? boardSize,
    MatchResult? matchResult,
    List<List<BoardItem>>? board,
    int? playerWinner,
  }) {
    return Board(
      boardSize: boardSize ?? this.boardSize,
      matchResult: matchResult ?? this.matchResult,
      board: board ?? this.board,
      playerWinner: playerWinner ?? this.playerWinner,
    );
  }
}
