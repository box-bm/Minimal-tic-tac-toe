import 'package:tik_tak_toe/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tak_toe/bloc/players/players_bloc.dart';
import 'package:tik_tak_toe/bloc/tik_tak_toe/tik_tak_toe_bloc.dart';
import 'package:tik_tak_toe/models/board_item.dart';
import 'package:tik_tak_toe/models/match_result.dart';
import 'package:tik_tak_toe/widgets/board_button.dart';

class Board extends StatelessWidget {
  final int currentPlayer;
  final List<List<BoardItem>> board;
  final MatchResult matchResult;

  const Board({
    super.key,
    required this.currentPlayer,
    required this.board,
    required this.matchResult,
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
                                    color: element.selectedByPlayerNumber !=
                                            null
                                        ? players
                                            .elementAt(
                                                element.selectedByPlayerNumber!)
                                            .color
                                        : null,
                                    tapped:
                                        element.selectedByPlayerNumber != null,
                                    icon: element.selectedByPlayerNumber != null
                                        ? players
                                            .elementAt(
                                                element.selectedByPlayerNumber!)
                                            .iconData
                                        : null,
                                    disabled: matchResult == MatchResult.tie ||
                                        matchResult != MatchResult.none,
                                    tie: matchResult == MatchResult.tie,
                                    winner: matchResult.validate(
                                        element.xPosition, element.yPosition),
                                    tapButton: () {
                                      BlocProvider.of<TikTakToeBloc>(context)
                                          .add(SelectOption(
                                              element.xPosition,
                                              element.yPosition,
                                              currentPlayer));
                                    })),
                          )
                          .toList()))
                ]),
            Visibility(
              visible: matchResult == MatchResult.tie,
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
