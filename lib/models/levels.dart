import 'package:minimal_tic_tac_toe/common.dart';
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

  IconData get icon {
    switch (this) {
      case Level.easy:
        return Icons.face_5_outlined;
      case Level.medium:
        return Icons.face_outlined;
      case Level.hight:
        return Icons.face_retouching_natural_outlined;
      case Level.impossible:
        return Icons.local_fire_department;
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
    return Player(playerName: "AI", color: color, iconData: icon);
  }
}
