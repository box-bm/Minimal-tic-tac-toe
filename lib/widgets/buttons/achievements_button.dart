import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_services/games_services.dart';
import 'package:minimal_tic_tac_toe/bloc/user/user_bloc.dart';
import 'package:minimal_tic_tac_toe/common.dart';

class AchievementsIconButton extends StatelessWidget {
  const AchievementsIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is SignedIn) {
          return IconButton(
            onPressed: () {
              Achievements.showAchievements();
            },
            icon: Semantics(
                button: true, child: const Icon(Icons.emoji_events_outlined)),
          );
        }
        return const SizedBox();
      },
    );
  }
}
