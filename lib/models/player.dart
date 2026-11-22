import 'package:minimal_tic_tac_toe/common.dart';

class Player {
  final String playerName;
  final Color color;
  final IconData iconData;

  const Player(
      {required this.playerName, required this.color, required this.iconData});

  factory Player.fromJSON(Map<String, dynamic> data) {
    return Player(
        playerName: data['playerName'],
        color: Color(data['color']),
        // Icons are built dynamically; CI builds with --no-tree-shake-icons.
        // ignore: non_const_argument_for_const_parameter
        iconData: IconData(data['iconData'], fontFamily: 'MaterialIcons'));
  }

  Map<String, dynamic> toJson() {
    return {
      "playerName": playerName,
      "color": color.toARGB32(),
      "iconData": iconData.codePoint,
    };
  }

  Player copyWith({String? playerName, Color? color, IconData? iconData}) {
    return Player(
      playerName: playerName ?? this.playerName,
      color: color ?? this.color,
      iconData: iconData ?? this.iconData,
    );
  }
}
