import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class CurrentThemeCubit extends Cubit<ThemeMode> {
  CurrentThemeCubit() : super(ThemeMode.system);

  changeTheme(ThemeMode themeMode) {
    emit(themeMode);
  }
}
