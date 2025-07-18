import 'package:flutter/material.dart';
import 'package:flutter_samples/ui/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Light theme configuration - Yellow & Red Restaurant Theme
  ThemeData _buildLightTheme() {
    return ThemeData(
      useMaterial3: true,
      primarySwatch: Colors.orange,
      primaryColor: const Color(0xFFD32F2F), // Deep Red
      scaffoldBackgroundColor: const Color(
        0xFFFFFDE7,
      ), // Light Yellow Background
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFD32F2F), // Deep Red
        foregroundColor: Colors.white,
        elevation: 3,
        shadowColor: Colors.black26,
      ),
      cardTheme: const CardThemeData(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        color: Colors.white,
        shadowColor: Colors.black12,
      ),
      colorScheme: const ColorScheme.light(
        primary: Color(0xFFD32F2F), // Deep Red
        secondary: Color(0xFFFFC107), // Golden Yellow
        tertiary: Color(0xFFFF5722), // Orange Red
        surface: Colors.white,
        onSurface: Color(0xFF212121),
        onPrimary: Colors.white,
        onSecondary: Color(0xFF212121),
        background: Color(0xFFFFFDE7), // Light Yellow
        onBackground: Color(0xFF212121),
        error: Color(0xFFB71C1C),
        onError: Colors.white,
        outline: Color(0xFFBDBDBD),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFD32F2F),
          foregroundColor: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  // Dark theme configuration - Dark Restaurant Theme with Yellow & Red Accents
  ThemeData _buildDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      primarySwatch: Colors.red,
      primaryColor: const Color(0xFFFF5252), // Bright Red
      scaffoldBackgroundColor: const Color(0xFF1A1A1A), // Very Dark Background
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF2C2C2C), // Dark Grey
        foregroundColor: Color(0xFFFFC107), // Golden Yellow Text
        elevation: 3,
        shadowColor: Colors.black54,
      ),
      cardTheme: const CardThemeData(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        color: Color(0xFF2C2C2C), // Dark Card Background
        shadowColor: Colors.black54,
      ),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFFF5252), // Bright Red
        secondary: Color(0xFFFFC107), // Golden Yellow
        tertiary: Color(0xFFFFAB40), // Light Orange
        surface: Color(0xFF2C2C2C), // Dark Surface
        onSurface: Color(0xFFFFC107), // Yellow Text
        onPrimary: Colors.white,
        onSecondary: Color(0xFF1A1A1A),
        background: Color(0xFF1A1A1A), // Dark Background
        onBackground: Color(0xFFFFC107), // Yellow Text
        error: Color(0xFFFF1744),
        onError: Colors.white,
        outline: Color(0xFF616161),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF5252),
          foregroundColor: Colors.white,
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Management App',
      theme: _buildLightTheme(),
      darkTheme: _buildDarkTheme(),
      themeMode: ThemeMode.system, // Follows system theme
      routes: {RiveAppHome.route: (context) => const RiveAppHome()},
      home: const RiveAppHome(),
    );
  }
}
