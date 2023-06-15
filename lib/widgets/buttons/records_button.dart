import 'package:minimal_tic_tac_toe/common.dart';
import 'package:minimal_tic_tac_toe/screens/matches_history.dart';

class RecordsButton extends StatelessWidget {
  const RecordsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pushNamed(context, MatchesHistory.route);
        },
        icon: Semantics(
          label: "View Records",
          button: true,
          child: const Icon(Icons.history_edu_outlined),
        ));
  }
}
