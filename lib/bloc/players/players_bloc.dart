import 'package:equatable/equatable.dart';
import 'package:minimal_tic_tac_toe/common.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:minimal_tic_tac_toe/models/game_icon.dart';
import 'package:minimal_tic_tac_toe/models/player.dart';
import 'package:minimal_tic_tac_toe/repository/default_players.dart';

part 'players_event.dart';
part 'players_state.dart';

class PlayersBloc extends HydratedBloc<PlayersEvent, PlayersState> {
  PlayersBloc() : super(const PlayersInitial()) {
    on<ChangePlayerName>((event, emit) {
      var players = state.players;
      players
          .elementAt(event.playerNumber - 1)
          .copyWith(playerName: event.name);

      emit(PlayersLoaded(players: players));
    });
    on<ChangePlayerColor>((event, emit) {
      var players = state.players;
      players.elementAt(event.playerNumber - 1).copyWith(color: event.color);
      emit(PlayersLoaded(players: players));
    });
    on<ChangePlayerIconData>((event, emit) {
      var players = state.players;
      players
          .elementAt(event.playerNumber - 1)
          .copyWith(gameIcon: event.gameIcon);
      emit(PlayersLoaded(players: players));
    });

    on<ResetChanges>((event, emit) {
      emit(const PlayersInitial());
    });
  }

  @override
  PlayersState? fromJson(Map<String, dynamic> json) {
    try {
      var player1 = Player.fromJSON(json['player1']);
      var player2 = Player.fromJSON(json['player2']);
      return PlayersLoaded(players: [player1, player2]);
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(PlayersState state) {
    if (state is PlayersLoaded) {
      return state.toJson();
    }
    return null;
  }
}
