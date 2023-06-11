part of 'tic_tac_toe_bloc.dart';

abstract class TicTacToeEvent extends Equatable {
  const TicTacToeEvent();

  @override
  List<Object> get props => [];
}

class CreateNewBoard extends TicTacToeEvent {}

class ResetBoard extends TicTacToeEvent {}

class SelectOption extends TicTacToeEvent {
  final int x;
  final int y;

  const SelectOption(this.x, this.y);
}

class PressItemButton extends TicTacToeEvent {}

class CancelPressButton extends TicTacToeEvent {}

class ChangeBoardSize extends TicTacToeEvent {
  final int size;
  const ChangeBoardSize(this.size);
}

class ChangePlayerTurn extends TicTacToeEvent {}

class ClearHistory extends TicTacToeEvent {}

class MakeAIMove extends TicTacToeEvent {
  final List<List<BoardItem>> board;
  const MakeAIMove(this.board);
}

class InitSinglePlayerGame extends TicTacToeEvent {
  final Level level;
  const InitSinglePlayerGame(this.level);
}

class InitMultiplayerPlayerGame extends TicTacToeEvent {}
