import 'package:flutter/material.dart';
import 'package:tik_tak_toe/screens/settings.dart';
import 'package:tik_tak_toe/screens/tik_tak_toe.dart';

class Presentation extends StatelessWidget {
  static String route = "presentation";

  const Presentation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const TextField(
            decoration:
                InputDecoration(labelText: "Player 1", hintText: "Player 1"),
          ),
          const TextField(
            decoration:
                InputDecoration(labelText: "Player 2", hintText: "Player 2"),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, TikTakToe.route);
              },
              child: const Text("Play!")),
          const Spacer(),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Settings.route);
                  },
                  icon: const Icon(Icons.settings)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
            ],
          )
        ],
      )),
    );
  }
}
