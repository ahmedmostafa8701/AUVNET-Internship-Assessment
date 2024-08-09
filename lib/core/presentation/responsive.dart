import 'package:flutter/cupertino.dart';

class Responsive {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    // print(_mediaQueryData.size.width);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double responsiveHeight(double inputHeight) {
  double screenHeight = Responsive.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 892.0) * screenHeight;
}

// Get the proportionate height as per screen size
double responsiveWidth(double inputWidth) {
  double screenWidth = Responsive.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 412.0) * screenWidth;
}