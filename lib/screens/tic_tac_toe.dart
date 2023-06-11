import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:minimal_tic_tac_toe/ad_helper.dart';
import 'package:minimal_tic_tac_toe/bloc/players/players_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/settings/sounds_cubit.dart';
import 'package:minimal_tic_tac_toe/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/tic_tac_toe/tic_tac_toe_bloc.dart';
import 'package:minimal_tic_tac_toe/models/match_result.dart';
import 'package:minimal_tic_tac_toe/screens/matches_history.dart';
import 'package:minimal_tic_tac_toe/utils/use_color_by_backgroud_color.dart';
import 'package:minimal_tic_tac_toe/widgets/add_banner.dart';
import 'package:minimal_tic_tac_toe/widgets/board.dart';
import 'package:minimal_tic_tac_toe/widgets/board_title.dart';
import 'package:minimal_tic_tac_toe/widgets/board_turn.dart';
import 'package:minimal_tic_tac_toe/widgets/settings_button.dart';

class TicTacToe extends StatefulWidget {
  static String route = "/TicTacToe";

  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  InterstitialAd? _interstitialAd;

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
          if (kDebugMode) {
            print('Failed to load an interstitial ad: ${err.message}');
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TicTacToeBloc, TicTacToeState>(
      listenWhen: (previous, current) {
        return (previous.history.length != current.history.length) ||
            (current is Restarted);
      },
      listener: (context, state) {
        if (state.history.isNotEmpty && _interstitialAd == null) {
          _loadInterstitialAd();
        }
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
      buildWhen: (previous, current) {
        return true;
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
                title: Text(state.singlePlayer
                    ? S.of(context).singlePlayer
                    : S.of(context).multiplayer),
                actions: [
                  IconButton(
                    onPressed: () =>
                        context.read<TicTacToeBloc>().add(ResetBoard()),
                    icon: Semantics(
                        button: true,
                        label: "Reset board",
                        child: const Icon(Icons.replay_outlined)),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MatchesHistory.route);
                      },
                      icon: Semantics(
                        label: "View Records",
                        button: true,
                        child: const Icon(Icons.history_edu_outlined),
                      )),
                  const SettingsButton(),
                ]),
            floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: state.board.matchResult != MatchResult.none &&
                    state.board.matchResult != MatchResult.tie
                ? FloatingActionButton.large(
                    backgroundColor: (state.playerWinner ?? 0) == 0
                        ? context.read<PlayersBloc>().state.player1.color
                        : context.read<PlayersBloc>().state.player2.color,
                    onPressed: () =>
                        context.read<TicTacToeBloc>().add(ResetBoard()),
                    child: Icon(
                      Icons.replay_outlined,
                      size: 45,
                      color: useColorByBackgroundColor(
                          (state.playerWinner ?? 0) == 0
                              ? context.read<PlayersBloc>().state.player1.color
                              : context
                                  .read<PlayersBloc>()
                                  .state
                                  .player2
                                  .color),
                    ),
                  )
                : null,
            body: SafeArea(
                minimum: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BoardTurn(
                        singlePlayer: state.singlePlayer,
                        currentPlayer: state.currentPlayer,
                        winner: state.playerWinner,
                        result: state.board.matchResult),
                    Expanded(
                      flex: 1,
                      child: BoardTitle(
                          playerWinner: state.playerWinner,
                          result: state.board.matchResult,
                          visible: state is GameEnded),
                    ),
                    Expanded(
                      flex: 5,
                      child: Board(
                        board: state.board.board,
                        currentPlayer: state.currentPlayer,
                        matchResult: state.board.matchResult,
                      ),
                    ),
                    const AddBanner(),
                  ],
                )));
      },
    );
  }
}
