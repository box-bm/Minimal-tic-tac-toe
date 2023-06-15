import 'package:flutter/material.dart';

class GameLevelButton extends StatelessWidget {
  final IconData icon;
  final Widget label;
  final Function()? onPressed;
  final Color foreground;
  final Color background;

  const GameLevelButton({
    super.key,
    required this.icon,
    required this.label,
    required this.background,
    this.onPressed,
    this.foreground = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: label,
      style: ElevatedButton.styleFrom(
        backgroundColor: background,
        foregroundColor: foreground,
      ),
    );
  }
}
