import 'package:flutter/material.dart';
import 'package:flutter_samples/ui/assets.dart' as app_assets;

class CourseModel {
  CourseModel({
    this.id,
    this.title = "",
    this.subtitle = "",
    this.caption = "",
    this.color = Colors.white,
    this.image = "",
  });

  UniqueKey? id = UniqueKey();
  String title, caption, image;
  String? subtitle;
  Color color;

  static List<CourseModel> courses = [
    CourseModel(
      title: "Animations in SwiftUI",
      subtitle: "Build and animate an iOS app from scratch",
      caption: "20 sections - 3 hours",
      color: const Color(0xFFD32F2F), // Deep Red
      image: app_assets.topic_1,
    ),
    CourseModel(
      title: "Build Quick Apps with SwiftUI",
      subtitle:
          "Apply your Swift and SwiftUI knowledge by building real, quick and various applications from scratch",
      caption: "47 sections - 11 hours",
      color: const Color(0xFFFFC107), // Golden Yellow
      image: app_assets.topic_2,
    ),
    CourseModel(
      title: "Build a SwiftUI app for iOS 15",
      subtitle:
          "Design and code a SwiftUI 3 app with custom layouts, animations and gestures using Xcode 13, SF Symbols 3, Canvas, Concurrency, Searchable and a whole lot more",
      caption: "21 sections - 4 hours",
      color: const Color(0xFFFF5722), // Orange Red
      image: app_assets.topic_1,
    ),
  ];

  static List<CourseModel> courseSections = [
    CourseModel(
      title: "State Machine",
      caption: "Watch video - 15 mins",
      color: const Color(0xFFFFEB3B), // Bright Yellow
      image: app_assets.topic_2,
    ),
    CourseModel(
      title: "Animated Menu",
      caption: "Watch video - 10 mins",
      color: const Color(0xFFFF9800), // Orange
      image: app_assets.topic_1,
    ),
    CourseModel(
      title: "Tab Bar",
      caption: "Watch video - 8 mins",
      color: const Color(0xFFE91E63), // Pink Red
      image: app_assets.topic_2,
    ),
    CourseModel(
      title: "Button",
      caption: "Watch video - 9 mins",
      color: const Color(0xFFFF6B35), // Red Orange
      image: app_assets.topic_1,
    ),
  ];
}
