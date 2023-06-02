import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/settings/sounds_cubit.dart';
import 'package:minimal_tic_tac_toe/common.dart';

class SoundSetting extends StatelessWidget {
  const SoundSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SoundsCubit, bool>(
      builder: (context, state) => ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
        leading:
            Icon(state ? Icons.volume_up_outlined : Icons.volume_off_outlined),
        title: Text(S.of(context).soundsEnabled),
        trailing: Switch(
            value: state,
            onChanged: (_) => context.read<SoundsCubit>().toggleSounds()),
      ),
    );
  }
}
