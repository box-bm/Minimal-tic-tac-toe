import 'package:flutter/material.dart';

class BoardButton extends StatelessWidget {
  final bool tapped;
  final bool disabled;
  final IconData? icon;
  final Color? color;
  final bool winned;
  final void Function() tapButton;

  const BoardButton({
    super.key,
    required this.tapButton,
    this.winned = false,
    this.tapped = false,
    this.disabled = false,
    this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        elevation: winned
            ? 5
            : tapped
                ? 0
                : null,
        color: winned
            ? color
            : tapped
                ? color?.withOpacity(0.3)
                : null,
        child: InkWell(
          onTap: tapped || disabled ? null : tapButton,
          borderRadius: BorderRadius.circular(10),
          child: FittedBox(
            fit: BoxFit.fill,
            child: Icon(
              icon,
              color: winned ? Colors.white : color?.withAlpha(255),
            ),
          ),
        ),
      ),
    );
  }
}
