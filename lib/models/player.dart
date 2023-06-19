import 'package:minimal_tic_tac_toe/common.dart';
import 'package:minimal_tic_tac_toe/models/game_icon.dart';

class Player {
  final String playerName;
  final int? playernumber;
  final Color color;
  final GameIcon gameIcon;

  const Player(
      {required this.playerName,
      required this.color,
      required this.gameIcon,
      this.playernumber});

  factory Player.fromJSON(Map<String, dynamic> data) {
    return Player(
        playerName: data['playerName'],
        color: Color(data['color']),
        gameIcon: GameIcon.fromCodePoint(data['gameIcon']));
  }

  Map<String, dynamic> toJson() {
    return {
      "playerName": playerName,
      "color": color.value,
      "gameIcon": gameIcon.icon.codePoint,
    };
  }

  Player copyWith({String? playerName, Color? color, GameIcon? gameIcon}) {
    return Player(
      playerName: playerName ?? this.playerName,
      color: color ?? this.color,
      gameIcon: gameIcon ?? this.gameIcon,
    );
  }
}
