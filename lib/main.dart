import 'package:flutter/material.dart';
import 'package:flutter_samples/ui/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Management App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: const Color(
          0xFFD84315,
        ), // Deep orange for restaurant theme
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFD84315),
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        cardTheme: const CardThemeData(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          color: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD84315),
          brightness: Brightness.light,
        ).copyWith(
          secondary: const Color(0xFFFF5722), // Bright orange accent
          surface: Colors.white,
          onSurface: const Color(0xFF212121),
        ),
      ),
      routes: {RiveAppHome.route: (context) => const RiveAppHome()},
      home: const RiveAppHome(),
    );
  }
}
