import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/theme/current_theme_cubit.dart';
import 'package:minimal_tic_tac_toe/common.dart';
import 'package:minimal_tic_tac_toe/repository/theme_options.dart';

class SelectTheme extends StatelessWidget {
  const SelectTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentThemeCubit, ThemeMode>(
      builder: (context, state) => DropdownButtonFormField(
          decoration: InputDecoration(
              labelText: S.of(context).theme,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).textTheme.bodySmall?.color ??
                          Colors.red)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).textTheme.bodySmall?.color ??
                          Colors.red)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).textTheme.bodySmall?.color ??
                          Colors.red))),
          isExpanded: true,
          value: state,
          items: themeOptions(context)
              .map<DropdownMenuItem<ThemeMode>>((e) => DropdownMenuItem(
                    value: e.mode,
                    child: Text(e.name),
                  ))
              .toList(),
          onChanged: (e) => context.read<CurrentThemeCubit>().changeTheme(e!)),
    );
  }
}
