import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/animations/animation_samples_list.dart';
import 'package:flutter_samples/samples/animations/custom_caret/custom_caret.dart';
import 'package:flutter_samples/samples/ui/rive_app/home.dart';
import 'package:flutter_samples/samples/animations/grid_magnification/grid_magnification.dart';

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
      title: 'New Flutter Samples',
      theme: ThemeData(primarySwatch: Colors.yellow),
      routes: {
        RiveAppHome.route: (context) => const RiveAppHome(),
        AnimationSamplesList.route: (context) => const AnimationSamplesList(),
        GridMagnification.route: (context) => const GridMagnification(),
        CustomCaret.route: (context) => const CustomCaret(),
      },
      home: RiveAppHome(),
    );
  }
}
