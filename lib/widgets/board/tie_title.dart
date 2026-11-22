import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:minimal_tic_tac_toe/common.dart';

class TieTitle extends StatelessWidget {
  const TieTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        RotateAnimatedText(AppLocalizations.of(context).tie,
            textAlign: TextAlign.center,
            textStyle: Theme.of(context).textTheme.displayMedium),
        RotateAnimatedText(AppLocalizations.of(context).anyoneWins,
            textAlign: TextAlign.center,
            textStyle: Theme.of(context).textTheme.displayMedium)
      ],
      repeatForever: true,
      pause: const Duration(milliseconds: 300),
    );
  }
}
