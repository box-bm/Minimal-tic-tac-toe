import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:tik_tak_toe/models/player.dart';
import 'package:tik_tak_toe/repository/default_players.dart';

part 'players_event.dart';
part 'players_state.dart';

class PlayersBloc extends HydratedBloc<PlayersEvent, PlayersState> {
  PlayersBloc() : super(const PlayersInitial()) {
    on<ChangePlayerName>((event, emit) {
      var name = event.name;

      if (event.playerNumber == 1) {
        emit(PlayersLoaded(
            player1: state.player1.copyWith(playerName: name),
            player2: state.player2));
      } else {
        emit(PlayersLoaded(
            player1: state.player1,
            player2: state.player2.copyWith(playerName: name)));
      }
    });
    on<ChangePlayerColor>((event, emit) {
      if (event.playerNumber == 1) {
        emit(PlayersLoaded(
            player1: state.player1.copyWith(color: event.color),
            player2: state.player2));
      } else {
        emit(PlayersLoaded(
            player1: state.player1,
            player2: state.player2.copyWith(color: event.color)));
      }
    });
    on<ChangePlayerIconData>((event, emit) {
      if (event.playerNumber == 1) {
        emit(PlayersLoaded(
            player1: state.player1.copyWith(iconData: event.iconData),
            player2: state.player2));
      } else {
        emit(PlayersLoaded(
            player1: state.player1,
            player2: state.player2.copyWith(iconData: event.iconData)));
      }
    });

    on<ResetChanges>((event, emit) {
      emit(const PlayersLoaded(
          player1: defaultPlayer1, player2: defaultPlayer2));
    });
  }

  @override
  PlayersState? fromJson(Map<String, dynamic> json) {
    try {
      var player1 = Player.fromJSON(json['player1']);
      var player2 = Player.fromJSON(json['player2']);
      return PlayersLoaded(player1: player1, player2: player2);
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
