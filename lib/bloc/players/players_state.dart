part of 'players_bloc.dart';

abstract class PlayersState extends Equatable {
  final List<Player> players;
  const PlayersState({this.players = const [defaultPlayer1, defaultPlayer2]});

  Map<String, dynamic>? toJson() {
    return {};
  }

  @override
  List<Object> get props => [players];
}

class PlayersInitial extends PlayersState {
  const PlayersInitial({super.players});
}

class PlayersLoaded extends PlayersState {
  const PlayersLoaded({required super.players});
  @override
  Map<String, dynamic> toJson() {
    return {
      'player1': players.elementAt(0).toJson(),
      'player2': players.elementAt(1).toJson(),
    };
  }
}
