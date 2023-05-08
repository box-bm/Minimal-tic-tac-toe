part of 'tik_tak_toe_bloc.dart';

abstract class TikTakToeEvent extends Equatable {
  const TikTakToeEvent();

  @override
  List<Object> get props => [];
}

class CreateNewBoard extends TikTakToeEvent {}

class ResetBoard extends TikTakToeEvent {}

class SelectOption extends TikTakToeEvent {
  final int x;
  final int y;
  final int playerNumber;

  const SelectOption(this.x, this.y, this.playerNumber);
}

class ChangeBoardSize extends TikTakToeEvent {
  final int size;
  const ChangeBoardSize(this.size);
}

class ChangePlayerTurn extends TikTakToeEvent {}

class ClearHistory extends TikTakToeEvent {}
