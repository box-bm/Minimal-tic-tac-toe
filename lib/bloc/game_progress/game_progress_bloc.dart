import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:games_services/games_services.dart';
import 'package:minimal_tic_tac_toe/models/board.dart';
import 'package:minimal_tic_tac_toe/models/player.dart' as app_player;
import 'package:minimal_tic_tac_toe/models/game_achievement.dart';
import 'package:minimal_tic_tac_toe/models/levels.dart';
import 'package:minimal_tic_tac_toe/models/match_result.dart';
import 'package:minimal_tic_tac_toe/repository/achievements.dart';

part 'game_progress_event.dart';
part 'game_progress_state.dart';

class GameProgressBloc extends Bloc<GameProgressEvent, GameProgressState> {
  GameProgressBloc() : super(GameProgressInitial()) {
    on<OnEndMultiplayerMatch>((event, emit) {
      // playing the first multiplayer match
      unlockAchievementByAchivementName(AchievementName.funAmongFriends);

      // when the user play more than 50 matches
      incrementAchievementByAchivementName(
          AchievementName.competitionBetweenFriends);

      // unlock achivements using icons
      unlockAchievementByIconSelection(
          event.players, "ios", "android", AchievementName.techRivals);
      unlockAchievementByIconSelection(
          event.players, "sun", "moon", AchievementName.sunAndMoon);
    });
    on<OnEndMatch>((event, emit) async {
      if (event.board.singlePlayer && event.board.playerWinner == 0) {
        add(OnWinSiglePlayerMatch(
            event.board.iaLevel!, event.board.matchResult));
      }
      if (!event.board.singlePlayer) {
        add(OnEndMultiplayerMatch(board: event.board, players: event.players));
      }
      if (event.playedMatches == 100) {
        unlockAchievementByAchivementName(AchievementName.longWay);
      }
    });
    on<OnWinSiglePlayerMatch>((event, emit) async {
      if (event.level == Level.easy) {
        unlockAchievementByAchivementName(AchievementName.easyIsSoEasy);
      }
      if (event.level == Level.medium) {
        unlockAchievementByAchivementName(AchievementName.mediumIsNotThanEasy);
      }
      if (event.level == Level.hight) {
        unlockAchievementByAchivementName(AchievementName.itsLookLikeNotEasy);
        incrementAchievementByAchivementName(
            AchievementName.itWasJustABitOfGoodLuck);
      }
      if (event.level == Level.impossible) {
        unlockAchievementByAchivementName(AchievementName.thatWasSoEasyIThink);
      }
    });
  }
}

void incrementAchievementByAchivementName(AchievementName achievementName) {
  Achievements.increment(
      achievement: gameAchievements
          .firstWhere((element) => element.id == achievementName)
          .achievement);
}

void unlockAchievementByAchivementName(AchievementName achievementName) {
  Achievements.unlock(
      achievement: gameAchievements
          .firstWhere((element) => element.id == achievementName)
          .achievement);
}

void unlockAchievementByIconSelection(List<app_player.Player> players,
    String iconID1, String iconID2, AchievementName achievementName) {
  var player1Icon = players[0].gameIcon;
  var player2Icon = players[1].gameIcon;

  if ([iconID1, iconID2].contains(player1Icon.id) &&
      [iconID1, iconID2].contains(player2Icon.id) &&
      player1Icon.id != player2Icon.id) {
    unlockAchievementByAchivementName(achievementName);
  }
}
