part of 'tik_tak_toe_bloc.dart';

abstract class TikTakToeState extends Equatable {
  final int currentPlayer;
  final int boardSize;
  final MatchResult matchResult;
  final int? playerWinner;
  final List<List<BoardItem>> board;

  const TikTakToeState({
    required this.currentPlayer,
    required this.board,
    this.playerWinner,
    this.matchResult = MatchResult.none,
    this.boardSize = 3,
  });

  @override
  List<Object> get props => [boardSize, matchResult, board, currentPlayer];

  String boardToString() {
    return jsonEncode(board);
  }
}

class TikTakToeInitial extends TikTakToeState {
  const TikTakToeInitial({
    super.currentPlayer = 1,
    super.playerWinner,
    super.board = const [],
    super.boardSize = 3,
  });
}

class GameEnded extends TikTakToeState {
  const GameEnded({
    required super.currentPlayer,
    required super.matchResult,
    required super.playerWinner,
    super.board = const [],
    super.boardSize,
  });
}
