part of 'game_progress_bloc.dart';

abstract class GameProgressEvent extends Equatable {
  const GameProgressEvent();

  @override
  List<Object> get props => [];
}

class OnWinSiglePlayerMatch extends GameProgressEvent {
  final Level level;
  final MatchResult matchResult;

  const OnWinSiglePlayerMatch(this.level, this.matchResult);
}

class OnEndMatch extends GameProgressEvent {
  final List<app_player.Player> players;
  final int playedMatches;
  final Board board;

  const OnEndMatch(
      {required this.players, required this.board, this.playedMatches = 0});
}

class OnEndMultiplayerMatch extends GameProgressEvent {
  final List<app_player.Player> players;
  final Board board;
  const OnEndMultiplayerMatch({required this.players, required this.board});
}
