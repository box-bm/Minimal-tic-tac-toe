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
  final int playerNumber;

  const SelectOption(this.x, this.y, this.playerNumber);
}

class PressItemButton extends TicTacToeEvent {}

class CancelPressButton extends TicTacToeEvent {}

class ChangeBoardSize extends TicTacToeEvent {
  final int size;
  const ChangeBoardSize(this.size);
}

class ChangePlayerTurn extends TicTacToeEvent {}

class ClearHistory extends TicTacToeEvent {}
