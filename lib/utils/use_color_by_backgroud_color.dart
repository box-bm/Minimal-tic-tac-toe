import 'dart:math';

import 'package:material_ui/material_ui.dart';

Color useColorByBackgroundColor(Color backgroundColor, {double bias = 0.0}) {
  final r = backgroundColor.r * 255.0;
  final g = backgroundColor.g * 255.0;
  final b = backgroundColor.b * 255.0;
  int v = sqrt(pow(r, 2) * 0.299 + pow(g, 2) * 0.587 + pow(b, 2) * 0.114)
      .round();

  bool useLightColor = v < 130 + bias ? true : false;

  if (useLightColor) {
    return Colors.white;
  } else {
    return Colors.black;
  }

}
