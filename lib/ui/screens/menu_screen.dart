import 'package:flutter/material.dart';
import '../theme.dart';
import '../components/restaurant_icons.dart';
import 'dart:ui';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  int _selectedCategory = 0;

  final List<String> _categories = [
    'All',
    'Appetizers',
    'Main Course',
    'Desserts',
    'Beverages',
    'Specials',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: RiveAppTheme.getBackgroundGradient(context),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Glass AppBar
              _buildGlassAppBar(),

              // Category Tabs
              _buildCategoryTabs(),

              // Menu Items Grid
              Expanded(child: _buildMenuGrid()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGlassAppBar() {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            gradient: RiveAppTheme.getGlassGradient(context),
            border: Border(
              bottom: BorderSide(
                color: RiveAppTheme.glassBorder.withOpacity(0.3),
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: RiveAppTheme.glassWhite.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: RiveAppTheme.getTextColor(context),
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Our Menu',
                      style: RiveAppTheme.getTitleStyle(
                        context,
                      ).copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Discover our delicious offerings',
                      style: RiveAppTheme.getCaptionStyle(context),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: RiveAppTheme.getButtonGradient(),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  RestaurantIcons.menu,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedCategory == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategory = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                gradient: isSelected ? RiveAppTheme.getButtonGradient() : null,
                color:
                    !isSelected
                        ? RiveAppTheme.glassWhite.withOpacity(0.1)
                        : null,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color:
                      isSelected
                          ? Colors.transparent
                          : RiveAppTheme.glassBorder.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Text(
                _categories[index],
                style: TextStyle(
                  color:
                      isSelected
                          ? Colors.white
                          : RiveAppTheme.getTextColor(context),
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  fontFamily: "Inter",
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMenuGrid() {
    final menuItems = _getMenuItemsForCategory(_selectedCategory);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return _buildMenuItem(menuItems[index]);
        },
      ),
    );
  }

  Widget _buildMenuItem(MenuItem item) {
    return GestureDetector(
      onTap: () => _showItemDetails(item),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: RiveAppTheme.getCardDecoration(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image placeholder
                Expanded(
                  flex: 3,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [item.color, item.color.withOpacity(0.7)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Icon(
                            item.icon,
                            size: 48,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                        Positioned(
                          top: 12,
                          right: 12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '\$${item.price}',
                              style: TextStyle(
                                color: item.color,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                fontFamily: "Inter",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Item details
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: RiveAppTheme.getBodyStyle(
                            context,
                          ).copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.description,
                          style: RiveAppTheme.getCaptionStyle(context),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Row(
                              children: List.generate(5, (i) {
                                return Icon(
                                  i < item.rating
                                      ? Icons.star
                                      : Icons.star_border,
                                  size: 14,
                                  color: RiveAppTheme.secondaryYellow,
                                );
                              }),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                gradient: RiveAppTheme.getButtonGradient(),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showItemDetails(MenuItem item) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder:
          (context) => Container(
            decoration: BoxDecoration(
              gradient: RiveAppTheme.getBackgroundGradient(context),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: RiveAppTheme.getGlassGradient(context),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  item.color,
                                  item.color.withOpacity(0.7),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              item.icon,
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
                                  item.name,
                                  style: RiveAppTheme.getTitleStyle(context),
                                ),
                                Text(
                                  '\$${item.price}',
                                  style: RiveAppTheme.getBodyStyle(
                                    context,
                                  ).copyWith(
                                    color: RiveAppTheme.secondaryYellow,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Description',
                        style: RiveAppTheme.getBodyStyle(
                          context,
                        ).copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.description,
                        style: RiveAppTheme.getCaptionStyle(context),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${item.name} added to cart!'),
                                backgroundColor: RiveAppTheme.primaryRed,
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: RiveAppTheme.getButtonGradient(),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: const Text(
                              'Add to Cart',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Inter",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }

  List<MenuItem> _getMenuItemsForCategory(int categoryIndex) {
    // Sample menu items - you can replace with actual data
    final allItems = [
      MenuItem(
        name: 'Margherita Pizza',
        description: 'Fresh tomatoes, mozzarella, basil',
        price: 12.99,
        rating: 5,
        color: RiveAppTheme.primaryRed,
        icon: RestaurantIcons.pizza,
        category: 'Main Course',
      ),
      MenuItem(
        name: 'Caesar Salad',
        description: 'Crisp romaine lettuce, parmesan cheese',
        price: 8.99,
        rating: 4,
        color: RiveAppTheme.freshGreen,
        icon: RestaurantIcons.salad,
        category: 'Appetizers',
      ),
      MenuItem(
        name: 'Grilled Salmon',
        description: 'Fresh Atlantic salmon with herbs',
        price: 18.99,
        rating: 5,
        color: RiveAppTheme.accentOrange,
        icon: RestaurantIcons.fish,
        category: 'Main Course',
      ),
      MenuItem(
        name: 'Chocolate Cake',
        description: 'Rich chocolate cake with berries',
        price: 6.99,
        rating: 5,
        color: RiveAppTheme.warmBrown,
        icon: RestaurantIcons.dessert,
        category: 'Desserts',
      ),
      MenuItem(
        name: 'Fresh Orange Juice',
        description: 'Freshly squeezed orange juice',
        price: 4.99,
        rating: 4,
        color: RiveAppTheme.secondaryYellow,
        icon: RestaurantIcons.drink,
        category: 'Beverages',
      ),
      MenuItem(
        name: 'Beef Burger',
        description: 'Juicy beef patty with fresh vegetables',
        price: 14.99,
        rating: 5,
        color: RiveAppTheme.primaryRed,
        icon: RestaurantIcons.burger,
        category: 'Main Course',
      ),
      MenuItem(
        name: 'Chicken Wings',
        description: 'Spicy buffalo wings with ranch',
        price: 10.99,
        rating: 4,
        color: RiveAppTheme.accentOrange,
        icon: RestaurantIcons.chicken,
        category: 'Appetizers',
      ),
      MenuItem(
        name: 'Ice Cream Sundae',
        description: 'Vanilla ice cream with chocolate sauce',
        price: 5.99,
        rating: 4,
        color: RiveAppTheme.creamWhite,
        icon: RestaurantIcons.iceCream,
        category: 'Desserts',
      ),
    ];

    if (categoryIndex == 0) return allItems; // All category

    final categoryName = _categories[categoryIndex];
    return allItems.where((item) => item.category == categoryName).toList();
  }
}

class MenuItem {
  final String name;
  final String description;
  final double price;
  final int rating;
  final Color color;
  final IconData icon;
  final String category;

  MenuItem({
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.color,
    required this.icon,
    required this.category,
  });
}
