import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math' as math;

class RiveAppTheme {
  // Restaurant Glass Theme Colors - iOS 26 Inspired

  // Light Theme Colors
  static const Color accentColorLight = Color(0xFFFFC107); // Golden Yellow
  static const Color shadowLight = Color(0xFFBDBDBD); // Light Grey Shadow
  static const Color backgroundLight = Color(
    0xFFFFFDE7,
  ); // Light Yellow Background
  static const Color background2Light = Color(0xFFFFECB3); // Lighter Yellow

  // Dark Theme Colors with Glass Effect
  static const Color accentColorDark = Color(0xFFFFC107); // Golden Yellow
  static const Color shadowDark = Color(0xFF000000); // Black Shadow
  static const Color backgroundDark = Color(
    0xFF0A0A0A,
  ); // Deep Black Background
  static const Color background2Dark = Color(0xFF1C1C1E); // iOS-like Dark Grey
  static const Color glassDark = Color(0xFF2C2C2E); // Glass Surface Dark
  static const Color glassLight = Color(0xFFF2F2F7); // Glass Surface Light

  // Restaurant Brand Colors
  static const Color primaryRed = Color(0xFFD32F2F); // Deep Red
  static const Color secondaryYellow = Color(0xFFFFC107); // Golden Yellow
  static const Color accentOrange = Color(0xFFFF5722); // Orange Red
  static const Color warmBrown = Color(0xFF8D6E63); // Coffee Brown
  static const Color freshGreen = Color(0xFF4CAF50); // Fresh Green
  static const Color creamWhite = Color(0xFFFFFBE9); // Cream White

  // Glass Effect Colors
  static const Color glassWhite = Color(0x33FFFFFF); // Semi-transparent white
  static const Color glassBlack = Color(0x33000000); // Semi-transparent black
  static const Color glassBorder = Color(0x4DFFFFFF); // Glass border
  static const Color glassHighlight = Color(0x66FFFFFF); // Glass highlight

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

  static Color getGlassColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? glassDark
        : glassLight;
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
        ? Colors
            .white // White text in dark mode
        : const Color(0xFF212121); // Dark text in light mode
  }

  static Color getSecondaryTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.white.withOpacity(0.7) // Semi-transparent white in dark mode
        : const Color(0xFF757575); // Grey text in light mode
  }

  // Optimized Glass Effect Decorations with caching
  static final Map<String, BoxDecoration> _decorationCache = {};

  static BoxDecoration getGlassDecoration(
    BuildContext context, {
    double borderRadius = 16,
    double blur = 10,
    Color? color,
    Border? border,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cacheKey =
        'glass_${isDark}_${borderRadius}_${blur}_${color?.value}_${border?.hashCode}';

    return _decorationCache[cacheKey] ??= BoxDecoration(
      color: color ?? (isDark ? glassWhite : glassWhite),
      borderRadius: BorderRadius.circular(borderRadius),
      border:
          border ??
          Border.all(color: isDark ? glassBorder : glassBorder, width: 1),
      boxShadow: [
        BoxShadow(
          color: getShadow(context),
          blurRadius: math.min(blur, 15), // Limit blur radius for performance
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  static BoxDecoration getCardDecoration(
    BuildContext context, {
    double borderRadius = 20,
    bool isElevated = true,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cacheKey = 'card_${isDark}_${borderRadius}_${isElevated}';

    return _decorationCache[cacheKey] ??= BoxDecoration(
      color: isDark ? glassDark.withOpacity(0.7) : glassLight.withOpacity(0.9),
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(
        color: isDark ? glassBorder : glassBorder.withOpacity(0.5),
        width: 1,
      ),
      boxShadow:
          isElevated
              ? [
                BoxShadow(
                  color: getShadow(context),
                  blurRadius: 15, // Reduced from 20
                  offset: const Offset(0, 8), // Reduced from 10
                ),
                BoxShadow(
                  color:
                      isDark ? glassHighlight : glassHighlight.withOpacity(0.3),
                  blurRadius: 1,
                  offset: const Offset(0, 1),
                ),
              ]
              : null,
    );
  }

  // Gradient Decorations with caching
  static final Map<String, LinearGradient> _gradientCache = {};

  static LinearGradient getBackgroundGradient(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cacheKey = 'background_$isDark';

    return _gradientCache[cacheKey] ??= LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors:
          isDark
              ? [
                const Color(0xFF000000),
                const Color(0xFF1A1A1A),
                const Color(0xFF0D0D0D),
              ]
              : [
                const Color(0xFFFFFDE7),
                const Color(0xFFFFECB3),
                const Color(0xFFFFF8E1),
              ],
      stops: const [0.0, 0.5, 1.0],
    );
  }

  static LinearGradient getGlassGradient(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cacheKey = 'glass_$isDark';

    return _gradientCache[cacheKey] ??= LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors:
          isDark
              ? [
                glassWhite,
                glassWhite.withOpacity(0.1),
                glassWhite.withOpacity(0.05),
              ]
              : [
                glassWhite,
                glassWhite.withOpacity(0.3),
                glassWhite.withOpacity(0.1),
              ],
    );
  }

  static LinearGradient getButtonGradient() {
    return _gradientCache['button'] ??= const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFFFFC107), Color(0xFFFF8F00), Color(0xFFFF5722)],
    );
  }

  // Text Styles
  static TextStyle getHeadlineStyle(BuildContext context) {
    return TextStyle(
      fontSize: 28,
      fontFamily: "Poppins",
      fontWeight: FontWeight.bold,
      color: getTextColor(context),
      shadows: [
        Shadow(
          offset: const Offset(1, 1),
          blurRadius: 3,
          color: getShadow(context),
        ),
      ],
    );
  }

  static TextStyle getTitleStyle(BuildContext context) {
    return TextStyle(
      fontSize: 20,
      fontFamily: "Inter",
      fontWeight: FontWeight.w600,
      color: getTextColor(context),
    );
  }

  static TextStyle getBodyStyle(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontFamily: "Inter",
      fontWeight: FontWeight.w400,
      color: getTextColor(context),
    );
  }

  static TextStyle getCaptionStyle(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontFamily: "Inter",
      fontWeight: FontWeight.w400,
      color: getSecondaryTextColor(context),
    );
  }
}
