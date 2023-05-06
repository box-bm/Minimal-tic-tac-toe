part of 'tik_tak_toe_bloc.dart';

abstract class TikTakToeEvent extends Equatable {
  const TikTakToeEvent();

  @override
  List<Object> get props => [];
}

class InitBoard extends TikTakToeEvent {
  final int size;
  final List<Player> players;
  const InitBoard({this.size = 3, required this.players});
}

class CreateNewBoard extends TikTakToeEvent {
  final int? size;
  final List<Player>? players;
  const CreateNewBoard({this.size, this.players});
}

class ResetBoard extends TikTakToeEvent {}

class SelectOption extends TikTakToeEvent {
  final int x;
  final int y;

  const SelectOption(this.x, this.y);
}

class ChangeBoardSize extends TikTakToeEvent {
  final int size;
  const ChangeBoardSize(this.size);
}

class ChangePlayerTurn extends TikTakToeEvent {}
