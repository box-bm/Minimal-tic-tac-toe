part of 'players_bloc.dart';

abstract class PlayersState extends Equatable {
  final Player player1;
  final Player player2;
  const PlayersState(
      {this.player1 = const Player(), this.player2 = const Player()});

  Map<String, dynamic>? toJson() {
    return {};
  }

  @override
  List<Object> get props => [player1, player2];
}

class PlayersInitial extends PlayersState {
  const PlayersInitial({
    super.player1 = const Player(
        playerName: "Player 1",
        color: Color.fromARGB(255, 238, 183, 18),
        iconData: Icons.close),
    super.player2 = const Player(
        playerName: "Player 2",
        color: Color.fromARGB(255, 17, 161, 180),
        iconData: Icons.circle_outlined),
  });
}

class PlayersLoaded extends PlayersState {
  const PlayersLoaded({required super.player1, required super.player2});
  @override
  Map<String, dynamic> toJson() {
    return {
      'player1': player1.toJson(),
      'player2': player2.toJson(),
    };
  }
}
