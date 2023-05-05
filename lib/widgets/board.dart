import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tak_toe/bloc/tik_tak_toe/tik_tak_toe_bloc.dart';
import 'package:tik_tak_toe/models/win_options.dart';
import 'package:tik_tak_toe/widgets/board_button.dart';

class Board extends StatelessWidget {
  const Board({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TikTakToeBloc, TikTakToeState>(builder: _build);
  }

  Widget _build(BuildContext context, TikTakToeState state) {
    return AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: [
            Column(
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
                                    disabled:
                                        state.winOption == WinOption.tie ||
                                            state.winOption != WinOption.none,
                                    tie: state.winOption == WinOption.tie,
                                    winned: state.winOption.validate(
                                        element.xPosition, element.yPosition),
                                    tapButton: () {
                                      context.read<TikTakToeBloc>().add(
                                          SelectOption(element.xPosition,
                                              element.yPosition));
                                    })),
                          )
                          .toList()))
                ]),
            Visibility(
              visible: state.winOption == WinOption.tie,
              child: Center(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(100)),
                      margin: EdgeInsets.zero,
                      child: IconButton(
                          onPressed: () =>
                              context.read<TikTakToeBloc>().add(ResetBoard()),
                          icon: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.replay_outlined,
                              size: 50,
                            ),
                          )))),
            )
          ],
        ));
  }
}
