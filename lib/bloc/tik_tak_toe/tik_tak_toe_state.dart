part of 'tik_tak_toe_bloc.dart';

abstract class TikTakToeState extends Equatable {
  final List<Player> players;
  final int playerTurnIndex;
  final int boardSize;
  final WinOption winOption;
  final List<List<BoardItem>> board;

  const TikTakToeState({
    required this.players,
    required this.playerTurnIndex,
    required this.board,
    this.winOption = WinOption.none,
    this.boardSize = 3,
  });

  @override
  List<Object> get props => [playerTurnIndex, players, board, boardSize];
}

class TikTakToeInitial extends TikTakToeState {
  const TikTakToeInitial({
    required super.players,
    required super.playerTurnIndex,
    super.board = const [],
    super.boardSize = 3,
  });
}

class GameWon extends TikTakToeState {
  final String playerNameWinner;
  const GameWon({
    required this.playerNameWinner,
    required super.players,
    required super.playerTurnIndex,
    required super.winOption,
    super.board = const [],
    super.boardSize,
  });
}

class NoWinner extends TikTakToeState {
  const NoWinner({
    required super.players,
    required super.playerTurnIndex,
    super.winOption = WinOption.tie,
    super.board = const [],
    super.boardSize,
  });
}
