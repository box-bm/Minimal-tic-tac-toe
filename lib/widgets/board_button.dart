import 'package:tik_tak_toe/common.dart';

class BoardButton extends StatelessWidget {
  final bool tapped;
  final bool disabled;
  final IconData? icon;
  final Color? color;
  final bool winner;
  final bool tie;
  final void Function() tapButton;

  const BoardButton({
    super.key,
    required this.tapButton,
    this.winner = false,
    this.tapped = false,
    this.disabled = false,
    this.tie = false,
    this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        elevation: getElevation(),
        color: getColor(),
        child: InkWell(
          onTap: tapped || disabled ? null : tapButton,
          borderRadius: BorderRadius.circular(10),
          child: FittedBox(
              fit: BoxFit.fill, child: Padding(padding: const EdgeInsets.all(2), child: Icon(icon, color: getIconColor()),)),
        ),
      ),
    );
  }

  double? getElevation() {
    if (winner) return 10;
    if (tie || tapped) return 0;
    return null;
  }

  Color? getColor() {
    if (tie) return color?.withAlpha(10);
    if (winner) return color;
    if (tapped) return color?.withOpacity(0.2);
    return null;
  }

  Color? getIconColor() {
    if (tie) return color?.withAlpha(40);
    if (winner) return Colors.white;
    if (tapped) return color;
    return null;
  }
}
