import 'package:flutter/material.dart';
import 'ui/home.dart';
import 'ui/performance_config.dart';

void main() {
  PerformanceConfig.configurePerformance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Simplified dark theme configuration for better performance
  ThemeData _buildDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: const Color(0xFFFF5252), // Bright Red
      scaffoldBackgroundColor: const Color(0xFF1A1A1A), // Very Dark Background
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFFF5252), // Bright Red
        secondary: Color(0xFFFFC107), // Golden Yellow
        surface: Color(0xFF2C2C2C), // Dark Surface
        onSurface: Color(0xFFFFC107), // Yellow Text
        onPrimary: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Management App',
      theme: _buildDarkTheme(),
      themeMode: ThemeMode.dark,
      routes: {RiveAppHome.route: (context) => const RiveAppHome()},
      home: const RiveAppHome(),
    );
  }
}
