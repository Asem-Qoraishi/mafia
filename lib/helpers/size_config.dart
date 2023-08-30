import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? _screenWidth;
  static double? _screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    _screenWidth = _mediaQueryData!.size.width;
    _screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
  }
}

double getProportionateScreenHeight(double height) {
  double screenHeight = SizeConfig._screenHeight!;
  return (height / 932.0) * screenHeight;
}

double getProportionateScreenWidht(double width) {
  double screenWidth = SizeConfig._screenWidth!;
  return (width / 430.0) * screenWidth;
}
