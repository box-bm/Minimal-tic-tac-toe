import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/user/user_bloc.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is SignedIn || state is AuthIdle) {
          return const SizedBox();
        }
        return IconButton(
            onPressed: () => context.read<UserBloc>().add(SignIn()),
            icon: const Icon(Icons.sports_esports_outlined));
      },
    );
  }
}
