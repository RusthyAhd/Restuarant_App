import 'package:flutter/material.dart';
import '../components/menu_row.dart';
import '../models/menu_item.dart';
import '../theme.dart';
import '../screens/profile_screen.dart';
import '../screens/menu_screen.dart';
import '../screens/wallet_screen.dart';
import '../screens/help_screen.dart';
import 'dart:math' as math;
import 'dart:ui';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> with TickerProviderStateMixin {
  final List<MenuItemModel> _browseMenuIcons = MenuItemModel.menuItems;
  final List<MenuItemModel> _historyMenuIcons = MenuItemModel.menuItems2;
  String _selectedMenu = MenuItemModel.menuItems[0].title;
  bool _isDarkTheme = true;
  late AnimationController _themeToggleController;
  late Animation<double> _toggleAnimation;

  void onMenuPress(MenuItemModel menu) {
    setState(() {
      _selectedMenu = menu.title;
    });

    // Navigate based on menu selection
    switch (menu.title) {
      case "Menu":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MenuScreen()),
        );
        break;
      case "Wallet":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const WalletScreen()),
        );
        break;
      case "Help":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HelpScreen()),
        );
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    _themeToggleController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _toggleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _themeToggleController, curve: Curves.elasticOut),
    );
  }

  @override
  void dispose() {
    _themeToggleController.dispose();
    super.dispose();
  }

  void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });

    if (_isDarkTheme) {
      _themeToggleController.forward();
    } else {
      _themeToggleController.reverse();
    }
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: RiveAppTheme.getBackground2(context),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                color: RiveAppTheme.accentOrange,
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
              ),
            ),
            content: const Text(
              'Are you sure you want to leave the restaurant app?',
              style: TextStyle(color: Colors.white, fontFamily: "Inter"),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => _performLogout(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: RiveAppTheme.accentOrange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
    );
  }

  void _performLogout(BuildContext context) {
    // Close the dialog
    Navigator.pop(context);

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: RiveAppTheme.getBackground2(context),
        content: Row(
          children: [
            Icon(
              Icons.check_circle_outline,
              color: RiveAppTheme.secondaryYellow,
              size: 20,
            ),
            const SizedBox(width: 12),
            Text(
              'Thanks for visiting our restaurant!',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Inter",
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    // TODO: Implement actual logout functionality here:
    // 1. Clear user session/tokens
    // 2. Clear local storage/cache
    // 3. Navigate to login screen
    // 4. Reset user state

    // For now, we'll just close the drawer
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            bottom: math.max(MediaQuery.of(context).padding.bottom, 60),
          ),
          constraints: const BoxConstraints(maxWidth: 288),
          decoration: BoxDecoration(
            gradient: RiveAppTheme.getGlassGradient(context),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: RiveAppTheme.glassBorder.withOpacity(0.3),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: RiveAppTheme.getShadow(context),
                blurRadius: 25,
                offset: const Offset(0, 15),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileScreen(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.2),
                        foregroundColor: Colors.white,
                        child: const Icon(Icons.person_outline),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfileScreen(),
                            ),
                          );
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Ashu",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontFamily: "Inter",
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              "Software Engineer",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 15,
                                fontFamily: "Inter",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      MenuButtonSection(
                        title: "BROWSE",
                        selectedMenu: _selectedMenu,
                        menuIcons: _browseMenuIcons,
                        onMenuPress: onMenuPress,
                      ),
                      MenuButtonSection(
                        title: "HISTORY",
                        selectedMenu: _selectedMenu,
                        menuIcons: _historyMenuIcons,
                        onMenuPress: onMenuPress,
                      ),
                      // Logout Section
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 24,
                          right: 24,
                          top: 40,
                          bottom: 8,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "ACCOUNT",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 15,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            Divider(
                              color: Colors.white.withOpacity(0.1),
                              thickness: 1,
                              height: 1,
                              indent: 16,
                              endIndent: 16,
                            ),
                            // Logout Row
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              child: GestureDetector(
                                onTap: () => _showLogoutDialog(context),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 32,
                                      height: 32,
                                      decoration: BoxDecoration(
                                        color: RiveAppTheme.accentOrange
                                            .withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Icon(
                                        Icons.logout_outlined,
                                        color: RiveAppTheme.accentOrange,
                                        size: 20,
                                      ),
                                    ),
                                    const SizedBox(width: 14),
                                    Expanded(
                                      child: Text(
                                        "Logout",
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.9),
                                          fontSize: 17,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      color: Colors.white.withOpacity(0.5),
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Theme Toggle Row
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              child: GestureDetector(
                                onTap: _toggleTheme,
                                child: Row(
                                  children: [
                                    AnimatedBuilder(
                                      animation: _toggleAnimation,
                                      builder: (context, child) {
                                        return Container(
                                          width: 32,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color: Color.lerp(
                                              RiveAppTheme.primaryRed
                                                  .withOpacity(0.2),
                                              RiveAppTheme.secondaryYellow
                                                  .withOpacity(0.2),
                                              _toggleAnimation.value,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          child: AnimatedSwitcher(
                                            duration: const Duration(
                                              milliseconds: 300,
                                            ),
                                            transitionBuilder: (
                                              child,
                                              animation,
                                            ) {
                                              return RotationTransition(
                                                turns: animation,
                                                child: child,
                                              );
                                            },
                                            child: Icon(
                                              _isDarkTheme
                                                  ? Icons.dark_mode_outlined
                                                  : Icons.light_mode_outlined,
                                              key: ValueKey(_isDarkTheme),
                                              color:
                                                  _isDarkTheme
                                                      ? RiveAppTheme.primaryRed
                                                      : RiveAppTheme
                                                          .secondaryYellow,
                                              size: 20,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(width: 14),
                                    Expanded(
                                      child: Text(
                                        _isDarkTheme
                                            ? "Dark Theme"
                                            : "Light Theme",
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.9),
                                          fontSize: 17,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    AnimatedBuilder(
                                      animation: _toggleAnimation,
                                      builder: (context, child) {
                                        return Container(
                                          width: 50,
                                          height: 28,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              14,
                                            ),
                                            color: Color.lerp(
                                              Colors.grey[700],
                                              RiveAppTheme.freshGreen,
                                              _toggleAnimation.value,
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              AnimatedPositioned(
                                                duration: const Duration(
                                                  milliseconds: 300,
                                                ),
                                                curve: Curves.elasticOut,
                                                left: _isDarkTheme ? 24 : 2,
                                                top: 2,
                                                child: Container(
                                                  width: 24,
                                                  height: 24,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.2),
                                                        blurRadius: 4,
                                                        offset: const Offset(
                                                          0,
                                                          2,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuButtonSection extends StatelessWidget {
  const MenuButtonSection({
    Key? key,
    required this.title,
    required this.menuIcons,
    this.selectedMenu = "Home",
    this.onMenuPress,
  }) : super(key: key);

  final String title;
  final String selectedMenu;
  final List<MenuItemModel> menuIcons;
  final Function(MenuItemModel menu)? onMenuPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
            top: 40,
            bottom: 8,
          ),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 15,
              fontFamily: "Inter",
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              for (var menu in menuIcons) ...[
                Divider(
                  color: Colors.white.withOpacity(0.1),
                  thickness: 1,
                  height: 1,
                  indent: 16,
                  endIndent: 16,
                ),
                MenuRow(
                  menu: menu,
                  selectedMenu: selectedMenu,
                  onMenuPress: () => onMenuPress!(menu),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
