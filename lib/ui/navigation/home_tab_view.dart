import 'package:flutter/material.dart';
import '../components/hcard.dart';
import '../components/vcard.dart';
import '../components/glass_components.dart';
import '../components/restaurant_icons.dart';
import '../models/courses.dart';
import '../theme.dart';
import 'dart:ui';

class HomeTabView extends StatefulWidget {
  const HomeTabView({Key? key}) : super(key: key);

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  final List<CourseModel> _courses = CourseModel.courses;
  final List<CourseModel> _courseSections = CourseModel.courseSections;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          gradient: RiveAppTheme.getBackgroundGradient(context),
          borderRadius: BorderRadius.circular(30),
        ),
        child: CustomScrollView(
          slivers: [
            // Glass App Header
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 20,
                ),
                child: Column(
                  children: [
                    // Welcome Header with Glass Effect
                    GlassCard(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  gradient: RiveAppTheme.getButtonGradient(),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: RiveAppTheme.secondaryYellow
                                          .withOpacity(0.2), // Reduced opacity
                                      blurRadius: 10, // Reduced blur
                                      spreadRadius: 2, // Reduced spread
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  RestaurantIcons.chef,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Welcome to Our Restaurant!",
                                      style: RiveAppTheme.getTitleStyle(
                                        context,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "Taste the finest cuisine & experience",
                                      style: RiveAppTheme.getCaptionStyle(
                                        context,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GlassContainer(
                                borderRadius: 12,
                                padding: const EdgeInsets.all(8),
                                child: Icon(
                                  RestaurantIcons.order,
                                  color: RiveAppTheme.secondaryYellow,
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Quick Actions with Restaurant Icons
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            "Quick Actions",
                            style: RiveAppTheme.getTitleStyle(context),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Restaurant Features Grid
                    Container(
                      height: 120,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        scrollDirection: Axis.horizontal,
                        itemCount: RestaurantFeatures.getFeatures().length,
                        itemBuilder: (context, index) {
                          final feature =
                              RestaurantFeatures.getFeatures()[index];
                          return Container(
                            width: 200,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            child: AnimatedGlassCard(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: (feature['color'] as Color)
                                            .withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Icon(
                                        feature['icon'] as IconData,
                                        color: feature['color'] as Color,
                                        size: 24,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            feature['title'] as String,
                                            style: RiveAppTheme.getBodyStyle(
                                              context,
                                            ).copyWith(
                                              fontWeight: FontWeight.w600,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            feature['description'] as String,
                                            style: RiveAppTheme.getCaptionStyle(
                                              context,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Menu Categories
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          "Menu Categories",
                          style: RiveAppTheme.getTitleStyle(context),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 100,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: MenuCategories.getCategories().length,
                      itemBuilder: (context, index) {
                        final category = MenuCategories.getCategories()[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          child: MenuCategoryIcon(
                            icon: category['icon'] as IconData,
                            title: category['title'] as String,
                            itemCount: category['items'] as int,
                            isSelected: index == 0,
                            onTap: () {},
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Featured Courses with Glass Cards
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          "Featured Dishes",
                          style: RiveAppTheme.getTitleStyle(context),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 200,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: _courses.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 160,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          child: VCard(course: _courses[index]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Recent Orders
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          "Recent Orders",
                          style: RiveAppTheme.getTitleStyle(context),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),

            // Recent Items Grid
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 3.0,
                  mainAxisSpacing: 12,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  return HCard(section: _courseSections[index]);
                }, childCount: _courseSections.length),
              ),
            ),

            // Bottom Padding
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).padding.bottom + 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
