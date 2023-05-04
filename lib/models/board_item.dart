import 'package:tik_tak_toe/models/player.dart';

class BoardItem {
  int xPosition;
  int yPosition;
  Player? selectedByPlayer;

  BoardItem({
    required this.xPosition,
    required this.yPosition,
    this.selectedByPlayer,
  });

  select(Player selectedByPlayer) {
    this.selectedByPlayer = selectedByPlayer;
  }

  BoardItem copyWith(
      {int? xPosition, int? yPosition, Player? selectedByPlayer}) {
    return BoardItem(
        xPosition: xPosition ?? this.xPosition,
        yPosition: yPosition ?? this.yPosition,
        selectedByPlayer: selectedByPlayer ?? this.selectedByPlayer);
  }
}
