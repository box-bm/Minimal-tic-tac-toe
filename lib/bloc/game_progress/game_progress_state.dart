part of 'game_progress_bloc.dart';

abstract class GameProgressState extends Equatable {
  const GameProgressState();
  
  @override
  List<Object> get props => [];
}

class GameProgressInitial extends GameProgressState {}
