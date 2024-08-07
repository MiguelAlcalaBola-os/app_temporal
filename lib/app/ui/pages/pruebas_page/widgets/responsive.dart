import 'package:flutter/material.dart';

class Responsive {
  late double screenWidth;
  late double screenHeight;
  late double blockSizeHorizontal;
  late double blockSizeVertical;
  late double safeAreaHorizontal;
  late double safeAreaVertical;
  late double safeBlockHorizontal;
  late double safeBlockVertical;

  Responsive(BuildContext context) {
    var mediaQueryContext = MediaQuery.of(context);
    screenWidth = mediaQueryContext.size.width;
    screenHeight = mediaQueryContext.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    safeAreaHorizontal =
        mediaQueryContext.padding.left + mediaQueryContext.padding.right;
    safeAreaVertical =
        mediaQueryContext.padding.top + mediaQueryContext.padding.bottom;

    double screenWidthOnSafeArea = screenWidth - safeAreaHorizontal;
    double screenHeightOnSafeArea = screenHeight - safeAreaVertical;

    safeBlockHorizontal = screenWidthOnSafeArea / 100;
    safeBlockVertical = screenHeightOnSafeArea / 100;
  }

  double getSafeBlockSizeHorizontal(double percentage) {
    return safeBlockHorizontal * percentage;
  }

  double getSafeBlockSizeVertical(double percentage) {
    return safeBlockVertical * percentage;
  }
}
