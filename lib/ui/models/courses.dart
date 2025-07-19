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
      title: "Today's Special Menu",
      subtitle: "Fresh ingredients and authentic flavors await",
      caption: "8 dishes - Chef's choice",
      color: const Color(0xFFD32F2F), // Deep Red
      image: app_assets.topic_1,
    ),
    CourseModel(
      title: "Popular Dishes",
      subtitle:
          "Customer favorites and signature recipes prepared by our expert chefs",
      caption: "12 dishes - Top rated",
      color: const Color(0xFFFFC107), // Golden Yellow
      image: app_assets.topic_2,
    ),
    CourseModel(
      title: "New Seasonal Menu",
      subtitle:
          "Discover our latest seasonal offerings with fresh, locally-sourced ingredients and innovative recipes",
      caption: "15 dishes - Limited time",
      color: const Color(0xFFFF5722), // Orange Red
      image: app_assets.topic_1,
    ),
  ];

  static List<CourseModel> courseSections = [
    CourseModel(
      title: "Table Reservation",
      caption: "Book now - Available slots",
      color: const Color(0xFFFFEB3B), // Bright Yellow
      image: app_assets.topic_2,
    ),
    CourseModel(
      title: "Order Online",
      caption: "Delivery & Pickup - 30 mins",
      color: const Color(0xFFFF9800), // Orange
      image: app_assets.topic_1,
    ),
    CourseModel(
      title: "Chef's Recommendations",
      caption: "Must try - 5 star dishes",
      color: const Color(0xFFE91E63), // Pink Red
      image: app_assets.topic_2,
    ),
    CourseModel(
      title: "Special Offers",
      caption: "Save more - Limited time",
      color: const Color(0xFFFF6B35), // Red Orange
      image: app_assets.topic_1,
    ),
  ];
}
