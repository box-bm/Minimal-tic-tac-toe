import 'package:minimal_tic_tac_toe/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/players/players_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/tic_tac_toe/tic_tac_toe_bloc.dart';
import 'package:minimal_tic_tac_toe/models/board_item.dart';
import 'package:minimal_tic_tac_toe/models/match_result.dart';
import 'package:minimal_tic_tac_toe/widgets/board/board_button.dart';

class Board extends StatelessWidget {
  final int currentPlayer;
  final List<List<BoardItem>> board;
  final MatchResult matchResult;
  final bool disableResetButton;

  const Board({
    super.key,
    required this.currentPlayer,
    required this.board,
    required this.matchResult,
    this.disableResetButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayersBloc, PlayersState>(builder: _build);
  }

  Widget _build(BuildContext context, PlayersState state) {
    var players = [state.player1, state.player2];

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
                                    BlocProvider.of<TicTacToeBloc>(context).add(
                                        SelectOption(element.xPosition,
                                            element.yPosition));
                                  }),
                            ),
                          )
                          .toList()))
                ]),
            Visibility(
              visible: matchResult == MatchResult.tie && !disableResetButton,
              child: Center(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(100)),
                      margin: EdgeInsets.zero,
                      child: IconButton(
                          onPressed: () =>
                              context.read<TicTacToeBloc>().add(ResetBoard()),
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
