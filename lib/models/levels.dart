import 'package:minimal_tic_tac_toe/common.dart';
import 'package:minimal_tic_tac_toe/models/game_icon.dart';
import 'package:minimal_tic_tac_toe/models/player.dart';

enum Level { easy, medium, hight, impossible }

extension LevelExtension on Level {
  Color get color {
    switch (this) {
      case Level.easy:
        return const Color.fromARGB(255, 44, 135, 192);
      case Level.medium:
        return const Color.fromARGB(255, 64, 192, 44);
      case Level.hight:
        return const Color.fromARGB(255, 212, 125, 38);
      case Level.impossible:
        return const Color.fromARGB(255, 192, 54, 44);
    }
  }

  GameIcon get icon {
    switch (this) {
      case Level.easy:
        return GameIcon("easyIcon", Icons.face_5_outlined,
            name: (context) => S.of(context).easy);
      case Level.medium:
        return GameIcon("mediumIcon", Icons.face_outlined,
            name: (context) => S.of(context).medium);
      case Level.hight:
        return GameIcon("hightIcon", Icons.face_retouching_natural_outlined,
            name: (context) => S.of(context).hard);
      case Level.impossible:
        return GameIcon("impossibleIcon", Icons.local_fire_department,
            name: (context) => S.of(context).impossible);
    }
  }

  Widget get label {
    switch (this) {
      case Level.easy:
        return Builder(
          builder: (context) => Text(S.of(context).easy),
        );
      case Level.medium:
        return Builder(
          builder: (context) => Text(S.of(context).medium),
        );
      case Level.hight:
        return Builder(
          builder: (context) => Text(S.of(context).hard),
        );
      case Level.impossible:
        return Builder(
          builder: (context) => Text(S.of(context).impossible),
        );
    }
  }

  Player get player {
    return Player(playerName: "AI", color: color, gameIcon: icon);
  }
}
