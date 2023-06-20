import 'package:games_services/games_services.dart';

class GameAchievement {
  final AchievementName id;
  final Achievement achievement;

  GameAchievement({required this.id, required this.achievement});
}

enum AchievementName {
  thatWasSoEasyIThink,
  longWay,
  itWasJustABitOfGoodLuck,
  itsLookLikeNotEasy,
  mediumIsNotThanEasy,
  competitionBetweenFriends,
  funAmongFriends,
  easyIsSoEasy,
  techRivals,
  sunAndMoon,
}
