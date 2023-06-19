import 'package:minimal_tic_tac_toe/common.dart';
import 'package:minimal_tic_tac_toe/widgets/adds/add_banner.dart';
import 'package:minimal_tic_tac_toe/widgets/buttons/achievements_button.dart';
import 'package:minimal_tic_tac_toe/widgets/buttons/sign_in_button.dart';
import 'package:minimal_tic_tac_toe/widgets/levels/game_option_buttons.dart';
import 'package:minimal_tic_tac_toe/widgets/game_title.dart';
import 'package:minimal_tic_tac_toe/widgets/logo.dart';
import 'package:minimal_tic_tac_toe/widgets/buttons/rate_app_button.dart';
import 'package:minimal_tic_tac_toe/widgets/buttons/settings_button.dart';
import 'package:minimal_tic_tac_toe/widgets/buttons/share_button.dart';

class Presentation extends StatelessWidget {
  static String route = "presentation";

  const Presentation({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: "Start page",
      container: true,
      child: const Scaffold(
        body: SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Spacer(),
                Expanded(flex: 2, child: Logo()),
                SizedBox(height: 20),
                GameTitle(),
                Spacer(),
                GameOptionButtons(),
                Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShareButton(),
                    SettingsButton(),
                    RateAppButton(),
                    SignInButton(),
                    AchievementsIconButton(),
                  ],
                ),
                Spacer(),
                AddBanner(),
              ],
            )),
      ),
    );
  }
}
