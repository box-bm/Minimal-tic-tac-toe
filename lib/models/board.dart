import 'package:minimal_tic_tac_toe/models/levels.dart';
import 'package:minimal_tic_tac_toe/models/match_result.dart';

import 'board_item.dart';

class Board {
  final int boardSize;
  final MatchResult matchResult;
  final List<List<BoardItem>> board;
  final bool singlePlayer;
  final Level? iaLevel;
  final int? playerWinner;

  Board({
    required this.boardSize,
    required this.matchResult,
    required this.singlePlayer,
    this.playerWinner,
    this.iaLevel,
    required this.board,
  });

  const Board.defaultBoard({
    this.iaLevel,
    this.boardSize = 3,
    this.board = const [],
    this.playerWinner,
    this.matchResult = MatchResult.none,
    required this.singlePlayer,
  });

  Board copyWith(
      {int? boardSize,
      MatchResult? matchResult,
      List<List<BoardItem>>? board,
      int? playerWinner,
      bool? singlePlayer,
      Level? iaLevel}) {
    return Board(
      singlePlayer: singlePlayer ?? this.singlePlayer,
      iaLevel: iaLevel ?? this.iaLevel,
      boardSize: boardSize ?? this.boardSize,
      matchResult: matchResult ?? this.matchResult,
      board: board ?? this.board,
      playerWinner: playerWinner ?? this.playerWinner,
    );
  }
}
