part of 'players_bloc.dart';

abstract class PlayersState extends Equatable {
  final Player player1;
  final Player player2;
  const PlayersState(
      {this.player1 = defaultPlayer1, this.player2 = defaultPlayer2});

  Map<String, dynamic>? toJson() {
    return {};
  }

  @override
  List<Object> get props => [player1, player2];
}

class PlayersInitial extends PlayersState {
  const PlayersInitial({
    super.player1 = defaultPlayer1,
    super.player2 = defaultPlayer2,
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
