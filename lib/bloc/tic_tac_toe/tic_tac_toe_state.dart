part of 'tic_tac_toe_bloc.dart';

abstract class TicTacToeState extends Equatable {
  final int currentPlayer;
  final int? playerWinner;
  final List<BoardMatchHistoryItem> history;
  final Board board;

  const TicTacToeState(
      {required this.currentPlayer,
      required this.board,
      this.playerWinner,
      required this.history});

  @override
  List<Object> get props => [board, currentPlayer, history];
}

class TicTacToeInitial extends TicTacToeState {
  const TicTacToeInitial(
      {super.currentPlayer = 1,
      super.board = const Board.defaultBoard(),
      super.history = const [],
      super.playerWinner});
}

class Reseted extends TicTacToeState {
  const Reseted(
      {required super.currentPlayer,
      required super.board,
      required super.history});
}

class GameEnded extends TicTacToeState {
  const GameEnded({
    required super.currentPlayer,
    required super.board,
    required super.playerWinner,
    required super.history,
  });
}

class ChoisingItem extends TicTacToeState {
  const ChoisingItem({
    required super.currentPlayer,
    required super.board,
    required super.playerWinner,
    required super.history,
  });
}
