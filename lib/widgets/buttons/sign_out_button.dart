import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/user/user_bloc.dart';
import 'package:minimal_tic_tac_toe/common.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is! SignedIn) {
          return ElevatedButton.icon(
              onPressed: () {
                context.read<UserBloc>().add(SignIn());
              },
              icon: const Icon(Icons.sports_esports_outlined),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, foregroundColor: Colors.white),
              label: Text(S.of(context).signInGooglePlayGames));
        }
        return ElevatedButton.icon(
            onPressed: () {
              context.read<UserBloc>().add(SignOut());
            },
            icon: const Icon(Icons.output_outlined),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, foregroundColor: Colors.white),
            label: Text(S.of(context).signOutGooglePlayGames));
      },
    );
  }
}
