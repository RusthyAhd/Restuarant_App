import 'package:flutter/material.dart';

class RiveAppTheme {
  // Restaurant Theme Colors - Yellow & Red with White

  // Light Theme Colors
  static const Color accentColorLight = Color(0xFFFFC107); // Golden Yellow
  static const Color shadowLight = Color(0xFFBDBDBD); // Light Grey Shadow
  static const Color backgroundLight = Color(
    0xFFFFFDE7,
  ); // Light Yellow Background
  static const Color background2Light = Color(0xFFFFECB3); // Lighter Yellow

  // Dark Theme Colors
  static const Color accentColorDark = Color(0xFFFFC107); // Golden Yellow
  static const Color shadowDark = Color(0xFF000000); // Black Shadow
  static const Color backgroundDark = Color(0xFF1A1A1A); // Very Dark Background
  static const Color background2Dark = Color(0xFF2C2C2C); // Dark Grey

  // Restaurant Brand Colors
  static const Color primaryRed = Color(0xFFD32F2F); // Deep Red
  static const Color secondaryYellow = Color(0xFFFFC107); // Golden Yellow
  static const Color accentOrange = Color(0xFFFF5722); // Orange Red

  // Dynamic colors based on theme
  static Color getBackground(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? backgroundDark
        : backgroundLight;
  }

  static Color getBackground2(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? background2Dark
        : background2Light;
  }

  static Color getShadow(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? shadowDark.withOpacity(0.5)
        : shadowLight.withOpacity(0.3);
  }

  static Color getAccentColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? accentColorDark
        : accentColorLight;
  }

  static Color getPrimaryColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFFFF5252) // Bright Red for Dark Theme
        : primaryRed; // Deep Red for Light Theme
  }

  static Color getTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? accentColorDark // Yellow text in dark mode
        : const Color(0xFF212121); // Dark text in light mode
  }
}
