import 'package:flutter/material.dart';
import 'package:tik_tak_toe/models/player.dart';

class PlayerBoardHeader extends StatelessWidget {
  final Player player;
  final bool inverted;
  final bool? winner;
  final bool active;
  final bool tie;

  const PlayerBoardHeader({
    super.key,
    required this.player,
    this.inverted = false,
    this.active = false,
    this.tie = false,
    this.winner,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: active || tie ? 5 : 0,
        color: active || tie ? player.color : player.color.withAlpha(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
          width: MediaQuery.of(context).size.width * 0.40,
          child: Row(
            textDirection: inverted ? TextDirection.rtl : null,
            children: [
              Icon(
                player.iconData,
                size: 50,
                color: active || tie ? Colors.white : null,
              ),
              const SizedBox(width: 10),
              Text(
                player.playerName.isEmpty ? "Player" : player.playerName,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: active || tie ? Colors.white : null,
                    ),
              )
            ],
          ),
        ));
  }
}
