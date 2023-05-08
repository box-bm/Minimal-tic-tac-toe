import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:tik_tak_toe/ad_helper.dart';
import 'package:tik_tak_toe/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tak_toe/bloc/tik_tak_toe/tik_tak_toe_bloc.dart';
import 'package:tik_tak_toe/models/match_result.dart';
import 'package:tik_tak_toe/screens/matches_history.dart';
import 'package:tik_tak_toe/screens/settings.dart';
import 'package:tik_tak_toe/widgets/add_banner.dart';
import 'package:tik_tak_toe/widgets/board.dart';
import 'package:tik_tak_toe/widgets/board_title.dart';
import 'package:tik_tak_toe/widgets/board_turn.dart';

class TikTakToe extends StatefulWidget {
  static String route = "/tikTakToe";

  const TikTakToe({super.key});

  @override
  State<TikTakToe> createState() => _TikTakToeState();
}

class _TikTakToeState extends State<TikTakToe> {
  InterstitialAd? _interstitialAd;

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              Navigator.popAndPushNamed(context, TikTakToe.route);
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
    return Scaffold(
        appBar: AppBar(actions: [
          IconButton(
              onPressed: () => context.read<TikTakToeBloc>().add(ResetBoard()),
              icon: const Icon(Icons.replay_outlined)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, MatchesHistory.route);
              },
              icon: const Icon(Icons.assignment_outlined)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Settings.route);
              },
              icon: const Icon(Icons.settings)),
        ]),
        body: BlocConsumer<TikTakToeBloc, TikTakToeState>(
          listenWhen: (previous, current) {
            return (previous.history.length != current.history.length) ||
                (current is Reseted);
          },
          listener: (context, state) {
            if (state.history.isNotEmpty && _interstitialAd == null) {
              _loadInterstitialAd();
            }
            if (state.history.length % 7 == 0 &&
                state.history.isNotEmpty &&
                state is Reseted &&
                _interstitialAd != null) {
              _interstitialAd?.show();
            }
          },
          buildWhen: (previous, current) {
            return true;
          },
          builder: (context, state) {
            return SafeArea(
                minimum: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BoardTurn(
                        currentPlayer: state.currentPlayer,
                        winner: state.playerWinner,
                        tie: state.board.matchResult == MatchResult.tie),
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
                ));
          },
        ));
  }
}
