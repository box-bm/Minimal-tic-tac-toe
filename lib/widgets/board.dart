import 'package:flutter/material.dart';
import 'package:tik_tak_toe/models/option.dart';
import 'package:tik_tak_toe/widgets/board_button.dart';

class Board extends StatelessWidget {
  final List<List<Option>> options;
  final int playerNumber;
  final void Function(int x, int y) onTapCard;
  const Board(
      {super.key,
      required this.options,
      required this.playerNumber,
      required this.onTapCard});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...options.map((row) => Row(
            children: row
                .map(
                  (element) => Expanded(
                      child: BoardButton(
                          color: element.available
                              ? null
                              : element.playerNumber == 1
                                  ? Color.fromARGB(255, 17, 180, 47)
                                  : Color.fromARGB(255, 17, 161, 180),
                          tapped: !element.available,
                          icon: element.playerNumber == null
                              ? null
                              : element.playerNumber == 1
                                  ? Icons.close
                                  : Icons.circle_outlined,
                          tapButton: () {
                            onTapCard(element.xPosition, element.yPosition);
                          })),
                )
                .toList()))
      ],
    );
  }
}
