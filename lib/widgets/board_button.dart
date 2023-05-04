import 'package:flutter/material.dart';

class BoardButton extends StatelessWidget {
  final bool tapped;
  final IconData? icon;
  final Color? color;
  final void Function() tapButton;
  const BoardButton(
      {super.key,
      this.tapped = false,
      this.icon,
      required this.tapButton,
      this.color});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        elevation: tapped ? 0 : 1,
        color: color?.withOpacity(0.5).withAlpha(60),
        child: InkWell(
          onTap: tapped ? null : tapButton,
          borderRadius: BorderRadius.circular(10),
          child: FittedBox(
            fit: BoxFit.fill,
            child: Icon(
              icon,
              color: color?.withAlpha(255),
            ),
          ),
        ),
      ),
    );
  }
}
