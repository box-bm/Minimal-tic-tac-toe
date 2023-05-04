import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tak_toe/bloc/tik_tak_toe/tik_tak_toe_bloc.dart';
import 'package:tik_tak_toe/widgets/board_button.dart';

class Board extends StatelessWidget {
  const Board({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TikTakToeBloc, TikTakToeState>(builder: _build);
  }

  Widget _build(BuildContext context, TikTakToeState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...state.board.map((row) => Row(
            children: row
                .map(
                  (element) => Expanded(
                      child: BoardButton(
                          color: element.selectedByPlayer?.color,
                          tapped: element.selectedByPlayer != null,
                          icon: element.selectedByPlayer?.iconData,
                          tapButton: () {
                            context.read<TikTakToeBloc>().add(SelectOption(
                                element.xPosition, element.yPosition));
                          })),
                )
                .toList()))
      ],
    );
  }
}
