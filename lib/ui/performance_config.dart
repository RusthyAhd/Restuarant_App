import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';
import 'dart:ui';

/// Performance configuration for the restaurant app
class PerformanceConfig {
  static void configurePerformance() {
    // Enable performance overlay in debug mode
    if (kDebugMode) {
      debugPaintSizeEnabled = false; // Disable paint debugging
      debugRepaintRainbowEnabled = false; // Disable repaint debugging
    }

    // Configure rendering settings
    RenderErrorBox.backgroundColor = Colors.transparent;
  }

  /// Constants for optimized blur values
  static const double lightBlur = 5.0;
  static const double mediumBlur = 10.0;
  static const double heavyBlur = 15.0;

  /// Constants for optimized shadow values
  static const double lightShadowBlur = 8.0;
  static const double mediumShadowBlur = 12.0;
  static const double heavyShadowBlur = 16.0;

  /// Animation durations
  static const Duration fastAnimation = Duration(milliseconds: 150);
  static const Duration normalAnimation = Duration(milliseconds: 250);
  static const Duration slowAnimation = Duration(milliseconds: 350);

  /// Optimized curves
  static const Curve fastCurve = Curves.easeOut;
  static const Curve normalCurve = Curves.easeInOut;
  static const Curve slowCurve = Curves.easeInOutCubic;
}

/// Widget wrapper that automatically adds RepaintBoundary for performance
class PerformantWidget extends StatelessWidget {
  final Widget child;
  final bool addRepaintBoundary;

  const PerformantWidget({
    Key? key,
    required this.child,
    this.addRepaintBoundary = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (addRepaintBoundary) {
      return RepaintBoundary(child: child);
    }
    return child;
  }
}

/// Optimized backdrop filter widget
class OptimizedBackdropFilter extends StatelessWidget {
  final Widget child;
  final double blur;

  const OptimizedBackdropFilter({
    Key? key,
    required this.child,
    this.blur = PerformanceConfig.mediumBlur,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Limit blur radius to improve performance
    final limitedBlur = blur.clamp(0.0, PerformanceConfig.heavyBlur);

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: limitedBlur, sigmaY: limitedBlur),
      child: child,
    );
  }
}
