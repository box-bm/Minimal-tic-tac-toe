import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  changeTheme(ThemeMode themeMode) {
    emit(themeMode);
  }

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    var mode = json['mode'];

    switch (mode) {
      case "light":
        return ThemeMode.light;
      case "dark":
        return ThemeMode.dark;
      case "system":
        return ThemeMode.system;
      default:
        return ThemeMode.system;
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    String mode;
    switch (state) {
      case ThemeMode.light:
        mode = "light";
        break;
      case ThemeMode.dark:
        mode = "dark";
        break;
      case ThemeMode.system:
        mode = "system";
        break;
      default:
        mode = "system";
        break;
    }
    return {"mode": mode};
  }
}
