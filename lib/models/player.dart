import 'package:flutter/material.dart';

class Player {
  final String? playerName;
  final Color? color;
  final IconData? iconData;

  const Player({this.playerName, this.color, this.iconData});

  factory Player.fromJSON(Map<String, dynamic> data) {
    return Player(
      playerName: data['playerName'] ?? "Player",
      color: data['color'] != null ? Color(data['color']) : null,
      iconData: data['iconData'] != null ? IconData(data['iconData']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "playerName": playerName,
      "color": color?.value,
      "iconData": iconData?.codePoint,
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
