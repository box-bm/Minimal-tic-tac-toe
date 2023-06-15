import 'package:minimal_tic_tac_toe/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/tic_tac_toe/tic_tac_toe_bloc.dart';
import 'package:minimal_tic_tac_toe/models/board_item.dart';
import 'package:minimal_tic_tac_toe/models/match_result.dart';
import 'package:minimal_tic_tac_toe/models/player.dart';
import 'package:minimal_tic_tac_toe/widgets/board/board_button.dart';
import 'package:minimal_tic_tac_toe/widgets/board/reset_board.dart';

class Board extends StatelessWidget {
  final List<Player> players;
  final int currentPlayer;
  final List<List<BoardItem>> board;
  final MatchResult matchResult;
  final bool disableResetButton;

  const Board({
    super.key,
    required this.currentPlayer,
    required this.board,
    required this.matchResult,
    required this.players,
    this.disableResetButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...board.map((row) => Row(
                      children: row
                          .map(
                            (element) => Expanded(
                              child: BoardButton(
                                  xPosition: element.xPosition,
                                  yPosition: element.yPosition,
                                  player: element.selectedByPlayerNumber != null
                                      ? players.elementAt(
                                          element.selectedByPlayerNumber!)
                                      : null,
                                  disabled: matchResult == MatchResult.tie ||
                                      matchResult != MatchResult.none,
                                  tie: matchResult == MatchResult.tie,
                                  winner: matchResult.validate(
                                      element.xPosition, element.yPosition),
                                  tapButton: () {
                                    context.read<TicTacToeBloc>().add(
                                        SelectOption(element.xPosition,
                                            element.yPosition));
                                  }),
                            ),
                          )
                          .toList()))
                ]),
            ResetBoardWidget(
                    matchResult: matchResult, disableReset: disableResetButton)
                .boardButton
          ],
        ));
  }
}
