part of 'tic_tac_toe_bloc.dart';

abstract class TicTacToeState extends Equatable {
  final bool singlePlayer;
  final int currentPlayer;
  final int? playerWinner;
  final List<BoardMatchHistoryItem> history;
  final Board board;

  const TicTacToeState({
    required this.singlePlayer,
    required this.currentPlayer,
    required this.board,
    this.playerWinner,
    required this.history,
  });

  @override
  List<Object> get props => [board, currentPlayer, history, singlePlayer];
}

class TicTacToeInitial extends TicTacToeState {
  const TicTacToeInitial({
    super.currentPlayer = 1,
    super.board = const Board.defaultBoard(),
    super.history = const [],
    super.playerWinner,
    super.singlePlayer = false,
  });
}

class Restarted extends TicTacToeState {
  const Restarted({
    required super.currentPlayer,
    required super.board,
    required super.history,
    required super.singlePlayer,
  });
}

class GameEnded extends TicTacToeState {
  const GameEnded({
    required super.currentPlayer,
    required super.board,
    required super.playerWinner,
    required super.history,
    required super.singlePlayer,
  });
}

class ChoosingItem extends TicTacToeState {
  const ChoosingItem({
    required super.currentPlayer,
    required super.board,
    required super.playerWinner,
    required super.history,
    required super.singlePlayer,
  });
}
