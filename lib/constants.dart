// constants.dart
import 'package:flutter/material.dart';

const double kWidthPercentage = 0.5;

/// Padding de cualquier Widget
const double paddingSize = 5.0;
const EdgeInsets paddingAll = EdgeInsets.all(paddingSize);
const EdgeInsets paddingHorizontal =
    EdgeInsets.symmetric(horizontal: paddingSize);
const EdgeInsets paddingHorizontalBottom =
    EdgeInsets.only(left: paddingSize, right: paddingSize, bottom: paddingSize);
const EdgeInsets paddingHorizontalTop =
    EdgeInsets.only(left: paddingSize, right: paddingSize, top: paddingSize);
const EdgeInsets paddingVertical = EdgeInsets.symmetric(vertical: paddingSize);

/// Width maximo para hacer resposivo en web
const maxWidth = 640.0;
