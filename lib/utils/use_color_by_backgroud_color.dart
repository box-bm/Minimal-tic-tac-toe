import 'dart:math';

import 'package:flutter/material.dart';

Color useColorByBackgroundColor(Color backgroundColor, {double bias = 0.0}) {
  int v = sqrt(pow(backgroundColor.red, 2) * 0.299 +
      pow(backgroundColor.green, 2) * 0.587 +
      pow(backgroundColor.blue, 2) * 0.114)
      .round();

  bool useLightColor = v < 130 + bias ? true : false;

  if (useLightColor) {
    return Colors.white;
  } else {
    return Colors.black;
  }

}