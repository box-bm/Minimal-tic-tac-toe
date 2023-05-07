import 'package:tik_tak_toe/common.dart';

class BoardButton extends StatelessWidget {
  final bool tapped;
  final bool disabled;
  final IconData? icon;
  final Color? color;
  final bool winned;
  final bool tie;
  final void Function() tapButton;

  const BoardButton({
    super.key,
    required this.tapButton,
    this.winned = false,
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
    if (winned) return 10;
    if (tie || tapped) return 0;
    return null;
  }

  Color? getColor() {
    if (tie) return color?.withAlpha(10);
    if (winned) return color;
    if (tapped) return color?.withOpacity(0.2);
    return null;
  }

  Color? getIconColor() {
    if (tie) return color?.withAlpha(40);
    if (winned) return Colors.white;
    if (tapped) return color;
    return null;
  }
}
