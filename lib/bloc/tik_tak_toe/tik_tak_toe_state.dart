part of 'tik_tak_toe_bloc.dart';

abstract class TikTakToeState extends Equatable {
  final List<Player> players;
  final int playerTurnIndex;
  final int boardSize;
  final List<List<BoardItem>> board;

  const TikTakToeState({
    required this.players,
    required this.playerTurnIndex,
    required this.board,
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

class Finished extends TikTakToeState {
  const Finished({
    required super.players,
    required super.playerTurnIndex,
    super.board = const [],
    super.boardSize,
  });
}
