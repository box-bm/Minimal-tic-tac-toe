import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/tic_tac_toe/tic_tac_toe_bloc.dart';
import 'package:minimal_tic_tac_toe/common.dart';
import 'package:minimal_tic_tac_toe/models/match_result.dart';
import 'package:minimal_tic_tac_toe/utils/use_color_by_backgroud_color.dart';

class ResetBoardWidget {
  final MatchResult matchResult;
  final Color? winnerColor;
  final bool disableReset;

  ResetBoardWidget(
      {required this.matchResult, this.winnerColor, this.disableReset = false});

  Widget get _none {
    return const SizedBox();
  }

  reset(BuildContext context) =>
      context.read<TicTacToeBloc>().add(ResetBoard());

  Widget get button {
    if (matchResult == MatchResult.none) {
      return _none;
    }
    return Builder(builder: (context) {
      return IconButton(
        onPressed: () => reset(context),
        icon: Semantics(
            button: true,
            label: "Reset board",
            child: const Icon(Icons.replay_outlined)),
      );
    });
  }

  Widget get fab {
    if (matchResult == MatchResult.none) {
      return _none;
    }
    return Builder(builder: (context) {
      return FloatingActionButton.large(
        backgroundColor: winnerColor,
        onPressed: () => reset(context),
        child: Icon(
          Icons.replay_outlined,
          size: 45,
          color: winnerColor != null
              ? useColorByBackgroundColor(winnerColor!)
              : null,
        ),
      );
    });
  }

  Widget get boardButton {
    return Builder(
        builder: (context) => Visibility(
              visible: matchResult == MatchResult.tie && !disableReset,
              child: Center(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(100)),
                      margin: EdgeInsets.zero,
                      child: IconButton(
                          onPressed: () => reset(context),
                          icon: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.replay_outlined,
                              size: 50,
                            ),
                          )))),
            ));
  }
}
