import 'package:minimal_tic_tac_toe/common.dart';
import 'package:minimal_tic_tac_toe/utils/rate_app.dart';

class RateAppButton extends StatelessWidget {
  const RateAppButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showStarRateDialog(context);
      },
      icon: Semantics(button: true, child: const Icon(Icons.star)),
    );
  }
}
