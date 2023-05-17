import 'package:flutter/material.dart';
import 'package:minimal_tic_tac_toe/models/theme_option.dart';

List<ThemeOption> themeOptions(BuildContext context) =>  [
      ThemeOption(ThemeMode.system, context),
      ThemeOption(ThemeMode.dark, context),
      ThemeOption(ThemeMode.light, context),
    ];
