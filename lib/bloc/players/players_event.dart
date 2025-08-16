part of 'players_bloc.dart';

abstract class PlayersEvent extends Equatable {
  const PlayersEvent();

  @override
  List<Object> get props => [];
}

class ChangePlayerName extends PlayersEvent {
  final int playerNumber;
  final String name;

  const ChangePlayerName({
    required this.playerNumber,
    required this.name,
  });
}

class ChangePlayerColor extends PlayersEvent {
  final int playerNumber;
  final Color color;

  const ChangePlayerColor({
    required this.playerNumber,
    required this.color,
  });
}

class ChangePlayerIconData extends PlayersEvent {
  final int playerNumber;
  final GameIcon gameIcon;

  const ChangePlayerIconData({
    required this.playerNumber,
    required this.gameIcon,
  });
}

class ResetChanges extends PlayersEvent {}
