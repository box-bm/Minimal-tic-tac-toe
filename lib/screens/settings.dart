import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  static String route = "/settings";

  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: Container(),
    );
  }
}
