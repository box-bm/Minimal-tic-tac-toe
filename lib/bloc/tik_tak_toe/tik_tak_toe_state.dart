part of 'tik_tak_toe_bloc.dart';

abstract class TikTakToeState extends Equatable {
  final int currentPlayer;
  final int? playerWinner;
  final List<BoardMatchHistoryItem> history;
  final Board board;

  const TikTakToeState(
      {required this.currentPlayer,
      required this.board,
      this.playerWinner,
      required this.history});

  @override
  List<Object> get props => [board, currentPlayer];

  String boardToString() {
    return jsonEncode(board);
  }
}

class TikTakToeInitial extends TikTakToeState {
  const TikTakToeInitial(
      {super.currentPlayer = 1,
      super.board = const Board.defaultBoard(),
      super.history = const [],
      super.playerWinner});
}

class GameEnded extends TikTakToeState {
  const GameEnded({
    required super.currentPlayer,
    required super.board,
    required super.playerWinner,
    required super.history,
  });
}
