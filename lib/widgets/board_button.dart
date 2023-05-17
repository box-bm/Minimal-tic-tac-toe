import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/tic_tac_toe/tic_tac_toe_bloc.dart';
import 'package:minimal_tic_tac_toe/common.dart';
import 'package:minimal_tic_tac_toe/models/player.dart';
import 'package:minimal_tic_tac_toe/utils/use_color_by_backgroud_color.dart';

import '../bloc/settings/sounds_cubit.dart';

class BoardButton extends StatelessWidget {
  final bool disabled;
  final Player? player;
  final bool winner;
  final bool tie;
  final void Function() tapButton;
  final int xPosition;
  final int yPosition;

  const BoardButton(
      {super.key,
      required this.tapButton,
      this.winner = false,
      this.disabled = false,
      this.tie = false,
      this.player,
      required this.xPosition,
      required this.yPosition});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1,
        child: Card(
          elevation: getElevation(),
          color: getColor(),
          child: Semantics(
            label: "Row ${xPosition + 1}, Column ${yPosition + 1}",
            button: true,
            selected: player != null,
            child: InkWell(
              // enableFeedback: context.read<SoundsCubit>().state,
              onTap: player != null || disabled ? null : tapButton,
              onTapDown: (details) {
                context.read<TicTacToeBloc>().add(PressItemButton());
              },
              onTapCancel: () {
                context.read<TicTacToeBloc>().add(CancelPressButton());
              },
              borderRadius: BorderRadius.circular(10),
              child: FittedBox(
                  fit: BoxFit.fill,
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Icon(player?.iconData, color: getIconColor()),
                  )),
            ),
          ),
        ));
  }

  double? getElevation() {
    if (winner) return 10;
    if (tie || player != null) return 0;
    return null;
  }

  Color? getColor() {
    if (tie) return player?.color.withAlpha(10);
    if (winner) return player?.color;
    if (player != null) return player?.color.withOpacity(0.2);
    return null;
  }

  Color? getIconColor() {
    if (tie) return player?.color.withAlpha(40);
    if (winner) {
      return useColorByBackgroundColor(player?.color ?? Colors.black);
    }
    if (player != null) return player?.color;
    return null;
  }
}
