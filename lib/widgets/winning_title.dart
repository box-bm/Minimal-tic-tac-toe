import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:minimal_tic_tac_toe/common.dart';

class WinningTitle extends StatelessWidget {
  final String? playerName;
  final Color? color;
  final int? playerNumber;
  const WinningTitle(
      {super.key, this.playerName, this.color, required this.playerNumber});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        FadeAnimatedText(S.of(context).winner,
            textStyle: Theme.of(context).textTheme.displaySmall,
            textAlign: TextAlign.center),
        FadeAnimatedText(
            (playerName ?? "").isEmpty
                ? S.of(context).player(playerNumber! + 1)
                : playerName ?? "",
            textAlign: TextAlign.center,
            textStyle: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(color: color))
      ],
      repeatForever: true,
      pause: const Duration(milliseconds: 300),
    );
  }
}
