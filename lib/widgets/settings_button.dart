import 'package:minimal_tic_tac_toe/common.dart';
import 'package:minimal_tic_tac_toe/screens/settings.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: "Go to Settings button",
      button: true,
      child: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, Settings.route);
          },
          icon: const Icon(Icons.settings)),
    );
  }
}
