import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:minimal_tic_tac_toe/bloc/players/players_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/settings/sounds_cubit.dart';
import 'package:minimal_tic_tac_toe/bloc/tic_tac_toe/tic_tac_toe_bloc.dart';
import 'package:minimal_tic_tac_toe/common.dart';
import 'package:minimal_tic_tac_toe/models/levels.dart';
import 'package:minimal_tic_tac_toe/models/match_result.dart';
import 'package:minimal_tic_tac_toe/utils/ad_helper.dart';
import 'package:minimal_tic_tac_toe/widgets/adds/add_banner.dart';
import 'package:minimal_tic_tac_toe/widgets/board/board.dart';
import 'package:minimal_tic_tac_toe/widgets/board/board_title.dart';
import 'package:minimal_tic_tac_toe/widgets/board/board_turn.dart';
import 'package:minimal_tic_tac_toe/widgets/board/reset_board.dart';
import 'package:minimal_tic_tac_toe/widgets/buttons/records_button.dart';
import 'package:minimal_tic_tac_toe/widgets/buttons/settings_button.dart';

class TicTacToe extends StatefulWidget {
  static String route = "/TicTacToe";

  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  InterstitialAd? _interstitialAd;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayersBloc, PlayersState>(
        builder: (context, playersState) {
      return BlocConsumer<TicTacToeBloc, TicTacToeState>(
        listenWhen: (previous, current) =>
            (previous.history.length != current.history.length) ||
            (current is Restarted),
        listener: (context, state) {
          if (state.history.length % 7 == 0 &&
              state.history.isNotEmpty &&
              state is Restarted &&
              _interstitialAd != null) {
            _interstitialAd?.show();
          }

          if (state is GameEnded) {
            if (context.read<SoundsCubit>().state) {
              final player = AudioPlayer();
              if (state.board.matchResult == MatchResult.tie) {
                player.play(AssetSource("sounds/tie.wav"));
              } else {
                player.play(AssetSource("sounds/winner.wav"));
              }
            }
            return;
          }
        },
        buildWhen: (previous, current) => true,
        builder: (context, state) {
          var players = [
            playersState.player1,
            state.iaLevel != null ? state.iaLevel!.player : playersState.player2
          ];

          var resetBoardWidgets = ResetBoardWidget(
              matchResult: state.board.matchResult,
              winnerColor: state.board.matchResult == MatchResult.none ||
                      state.board.matchResult == MatchResult.tie
                  ? null
                  : players[state.playerWinner!].color);
          return Scaffold(
              appBar: AppBar(
                  title: Text(state.singlePlayer
                      ? S.of(context).singlePlayer
                      : S.of(context).multiplayer),
                  actions: [
                    resetBoardWidgets.button,
                    const RecordsButton(),
                    const SettingsButton(),
                  ]),
              floatingActionButton: resetBoardWidgets.fab,
              body: SafeArea(
                  minimum: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BoardTurn(
                          history: state.history,
                          singlePlayer: state.singlePlayer,
                          currentPlayer: state.currentPlayer,
                          players: players,
                          winner: state.playerWinner,
                          result: state.board.matchResult),
                      Expanded(
                        child: BoardTitle(
                            players: players,
                            playerWinner: state.playerWinner,
                            result: state.board.matchResult,
                            visible: state is GameEnded),
                      ),
                      Expanded(
                          flex: 5,
                          child: Align(
                            child: Board(
                              players: players,
                              board: state.board.board,
                              currentPlayer: state.currentPlayer,
                              matchResult: state.board.matchResult,
                            ),
                          )),
                      const AddBanner(),
                    ],
                  )));
        },
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _loadInterstitialAd();
  }

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: AdHelper.addRequest,
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              Navigator.popAndPushNamed(context, TicTacToe.route);
            },
          );

          setState(() {
            _interstitialAd = ad;
          });
        },
        onAdFailedToLoad: (err) {
          _interstitialAd?.dispose();
        },
      ),
    );
  }
}
