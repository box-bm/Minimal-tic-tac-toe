part of 'players_bloc.dart';

abstract class PlayersState extends Equatable {
  const PlayersState();
  
  @override
  List<Object> get props => [];
}

class PlayersInitial extends PlayersState {}
