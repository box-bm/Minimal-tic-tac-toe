import 'package:minimal_tic_tac_toe/common.dart';
import 'package:minimal_tic_tac_toe/models/game_icon.dart';

class Player {
  final String id;
  final String playerName;
  final Color color;
  final GameIcon gameIcon;

  const Player({
    required this.id,
    required this.playerName,
    required this.color,
    required this.gameIcon,
  });

  factory Player.fromJSON(Map<String, dynamic> data) {
    return Player(
        id: data['id'],
        playerName: data['playerName'],
        color: Color(data['color']),
        gameIcon: GameIcon.fromCodePoint(data['gameIcon']));
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "playerName": playerName,
      "color": color.value,
      "gameIcon": gameIcon.icon.codePoint,
    };
  }

  Player copyWith({String? playerName, Color? color, GameIcon? gameIcon}) {
    return Player(
      id: id,
      playerName: playerName ?? this.playerName,
      color: color ?? this.color,
      gameIcon: gameIcon ?? this.gameIcon,
    );
  }
}
