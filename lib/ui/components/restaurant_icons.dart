import 'package:flutter/material.dart';
import '../theme.dart';

class RestaurantIcons {
  // Food Category Icons
  static const IconData pizza = Icons.local_pizza;
  static const IconData burger = Icons.lunch_dining;
  static const IconData coffee = Icons.local_cafe;
  static const IconData dessert = Icons.cake;
  static const IconData salad = Icons.eco;
  static const IconData pasta = Icons.ramen_dining;
  static const IconData sushi = Icons.set_meal;
  static const IconData chicken = Icons.egg;
  static const IconData seafood = Icons.phishing;
  static const IconData vegetarian = Icons.local_florist;
  static const IconData drinks = Icons.local_bar;
  static const IconData drink = Icons.local_bar;
  static const IconData iceCream = Icons.icecream;
  static const IconData sandwich = Icons.lunch_dining;
  static const IconData soup = Icons.soup_kitchen;
  static const IconData bread = Icons.bakery_dining;
  static const IconData fish = Icons.set_meal;

  // Restaurant Service Icons
  static const IconData delivery = Icons.delivery_dining;
  static const IconData takeout = Icons.takeout_dining;
  static const IconData dineIn = Icons.restaurant;
  static const IconData reservation = Icons.event_seat;
  static const IconData chef = Icons.person_3;
  static const IconData waiter = Icons.person_4;
  static const IconData kitchen = Icons.kitchen;
  static const IconData menu = Icons.menu_book;
  static const IconData order = Icons.receipt_long;
  static const IconData payment = Icons.payment;
  static const IconData rating = Icons.star;
  static const IconData review = Icons.rate_review;

  // Time & Status Icons
  static const IconData clock = Icons.access_time;
  static const IconData fast = Icons.flash_on;
  static const IconData hot = Icons.whatshot;
  static const IconData new_item = Icons.fiber_new;
  static const IconData popular = Icons.trending_up;
  static const IconData discount = Icons.local_offer;

  // Quality & Features
  static const IconData organic = Icons.nature;
  static const IconData halal = Icons.verified;
  static const IconData spicy = Icons.local_fire_department;
  static const IconData vegan = Icons.grass;
  static const IconData glutenFree = Icons.no_meals;
  static const IconData fresh = Icons.water_drop;
}

class FoodIcons extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final double size;
  final bool hasGlow;
  final String? label;

  const FoodIcons({
    Key? key,
    required this.icon,
    this.color,
    this.size = 24,
    this.hasGlow = false,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget iconWidget = Icon(
      icon,
      color: color ?? RiveAppTheme.secondaryYellow,
      size: size,
    );

    if (hasGlow) {
      iconWidget = Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: (color ?? RiveAppTheme.secondaryYellow).withOpacity(0.5),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: iconWidget,
      );
    }

    if (label != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          iconWidget,
          const SizedBox(height: 4),
          Text(
            label!,
            style: TextStyle(
              fontSize: 12,
              fontFamily: "Inter",
              color: RiveAppTheme.getSecondaryTextColor(context),
            ),
          ),
        ],
      );
    }

    return iconWidget;
  }
}

class RestaurantBadge extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final double borderRadius;

  const RestaurantBadge({
    Key? key,
    required this.icon,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.iconColor,
    this.borderRadius = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor ?? RiveAppTheme.secondaryYellow.withOpacity(0.2),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: (backgroundColor ?? RiveAppTheme.secondaryYellow).withOpacity(
            0.3,
          ),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: iconColor ?? RiveAppTheme.secondaryYellow,
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontFamily: "Inter",
              fontWeight: FontWeight.w500,
              color: textColor ?? RiveAppTheme.getTextColor(context),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuCategoryIcon extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isSelected;
  final int? itemCount;

  const MenuCategoryIcon({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.isSelected = false,
    this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? RiveAppTheme.secondaryYellow.withOpacity(0.2)
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border:
              isSelected
                  ? Border.all(color: RiveAppTheme.secondaryYellow, width: 2)
                  : null,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient:
                        isSelected ? RiveAppTheme.getButtonGradient() : null,
                    color:
                        isSelected
                            ? null
                            : RiveAppTheme.getGlassColor(
                              context,
                            ).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow:
                        isSelected
                            ? [
                              BoxShadow(
                                color: RiveAppTheme.secondaryYellow.withOpacity(
                                  0.3,
                                ),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ]
                            : null,
                  ),
                  child: Icon(
                    icon,
                    color:
                        isSelected
                            ? Colors.white
                            : RiveAppTheme.secondaryYellow,
                    size: 24,
                  ),
                ),
                if (itemCount != null && itemCount! > 0)
                  Positioned(
                    top: -2,
                    right: -2,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: RiveAppTheme.accentOrange,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 20,
                        minHeight: 20,
                      ),
                      child: Text(
                        itemCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontFamily: "Inter",
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color:
                    isSelected
                        ? RiveAppTheme.secondaryYellow
                        : RiveAppTheme.getSecondaryTextColor(context),
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class RestaurantFeature extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color? color;

  const RestaurantFeature({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: RiveAppTheme.getGlassDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: (color ?? RiveAppTheme.secondaryYellow).withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: color ?? RiveAppTheme.secondaryYellow,
              size: 20,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontFamily: "Inter",
              fontWeight: FontWeight.w600,
              color: RiveAppTheme.getTextColor(context),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              fontFamily: "Inter",
              color: RiveAppTheme.getSecondaryTextColor(context),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuItemTag extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;

  const MenuItemTag({
    Key? key,
    required this.text,
    this.icon,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor ?? RiveAppTheme.freshGreen.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: (backgroundColor ?? RiveAppTheme.freshGreen).withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: textColor ?? RiveAppTheme.freshGreen),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: TextStyle(
              fontSize: 10,
              fontFamily: "Inter",
              fontWeight: FontWeight.w500,
              color: textColor ?? RiveAppTheme.freshGreen,
            ),
          ),
        ],
      ),
    );
  }
}

// Predefined Menu Categories
class MenuCategories {
  static List<Map<String, dynamic>> getCategories() {
    return [
      {'icon': RestaurantIcons.burger, 'title': 'Burgers', 'items': 12},
      {'icon': RestaurantIcons.pizza, 'title': 'Pizza', 'items': 8},
      {'icon': RestaurantIcons.pasta, 'title': 'Pasta', 'items': 15},
      {'icon': RestaurantIcons.salad, 'title': 'Salads', 'items': 10},
      {'icon': RestaurantIcons.coffee, 'title': 'Drinks', 'items': 25},
      {'icon': RestaurantIcons.dessert, 'title': 'Desserts', 'items': 18},
      {'icon': RestaurantIcons.sushi, 'title': 'Sushi', 'items': 20},
      {'icon': RestaurantIcons.chicken, 'title': 'Chicken', 'items': 14},
    ];
  }
}

// Predefined Restaurant Features
class RestaurantFeatures {
  static List<Map<String, dynamic>> getFeatures() {
    return [
      {
        'icon': RestaurantIcons.delivery,
        'title': 'Fast Delivery',
        'description': '30 min delivery',
        'color': RiveAppTheme.secondaryYellow,
      },
      {
        'icon': RestaurantIcons.fresh,
        'title': 'Fresh Ingredients',
        'description': 'Farm to table',
        'color': RiveAppTheme.freshGreen,
      },
      {
        'icon': RestaurantIcons.chef,
        'title': 'Expert Chefs',
        'description': '5-star cooking',
        'color': RiveAppTheme.accentOrange,
      },
      {
        'icon': RestaurantIcons.organic,
        'title': 'Organic',
        'description': '100% organic',
        'color': RiveAppTheme.warmBrown,
      },
    ];
  }
}
