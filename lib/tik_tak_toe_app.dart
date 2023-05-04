import 'package:flutter/material.dart';
import 'package:tik_tak_toe/bloc_states.dart';
import 'package:tik_tak_toe/screens/tik_tak_toe.dart';

class TikTakToeApp extends StatefulWidget {
  const TikTakToeApp({super.key});

  @override
  State<TikTakToeApp> createState() => _TikTakToeAppState();
}

class _TikTakToeAppState extends State<TikTakToeApp> {
  @override
  Widget build(BuildContext context) {
    return BlocAppStates(
        child: MaterialApp(
            theme: ThemeData.light(useMaterial3: true),
            darkTheme: ThemeData.dark(useMaterial3: true),
            home: const TikTakToe()));
  }
}
