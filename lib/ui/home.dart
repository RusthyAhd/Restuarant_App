import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart' hide LinearGradient;
import 'dart:math' as math;
import 'dart:ui';
import 'navigation/custom_tab_bar.dart';
import 'navigation/home_tab_view.dart';
import 'on_boarding/onboarding_view.dart';
import 'navigation/side_menu.dart';
import 'theme.dart';
import 'components/restaurant_icons.dart';
import 'assets.dart' as app_assets;

// Optimized Custom painter for restaurant-themed background
class RestaurantBackgroundPainter extends CustomPainter {
  static Paint? _cachedPaint;
  static Size? _cachedSize;

  @override
  void paint(Canvas canvas, Size size) {
    // Only recreate paint if size changed
    if (_cachedPaint == null || _cachedSize != size) {
      _cachedPaint =
          Paint()
            ..style = PaintingStyle.fill
            ..shader = LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                RiveAppTheme.secondaryYellow.withOpacity(
                  0.03,
                ), // Reduced opacity
                RiveAppTheme.accentOrange.withOpacity(0.02),
                RiveAppTheme.warmBrown.withOpacity(0.01),
              ],
            ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
      _cachedSize = size;
    }

    // Draw fewer shapes for better performance
    canvas.drawCircle(
      Offset(size.width * 0.1, size.height * 0.2),
      size.width * 0.25, // Reduced size
      _cachedPaint!,
    );

    canvas.drawCircle(
      Offset(size.width * 0.9, size.height * 0.7),
      size.width * 0.2, // Reduced size
      _cachedPaint!,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Common Tab Scene for the tabs other than 1st one, showing only tab name in center
Widget commonTabScene(String tabName) {
  return Builder(
    builder:
        (context) => Container(
          decoration: BoxDecoration(
            gradient: RiveAppTheme.getBackgroundGradient(context),
          ),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 30,
                  ),
                  decoration: RiveAppTheme.getGlassDecoration(
                    context,
                    borderRadius: 30,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          gradient: RiveAppTheme.getButtonGradient(),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: RiveAppTheme.secondaryYellow.withOpacity(
                                0.3,
                              ),
                              blurRadius: 20,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Icon(
                          _getTabIcon(tabName),
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        tabName,
                        style: RiveAppTheme.getHeadlineStyle(context),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Coming Soon',
                        style: RiveAppTheme.getCaptionStyle(context).copyWith(
                          color: RiveAppTheme.secondaryYellow,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
  );
}

IconData _getTabIcon(String tabName) {
  switch (tabName.toLowerCase()) {
    case 'menu':
      return RestaurantIcons.menu;
    case 'orders':
      return RestaurantIcons.clock;
    case 'notifications':
      return RestaurantIcons.order;
    case 'profile':
      return RestaurantIcons.chef;
    default:
      return Icons.restaurant;
  }
}

class RiveAppHome extends StatefulWidget {
  const RiveAppHome({Key? key}) : super(key: key);

  static const String route = '/course-rive';

  @override
  State<RiveAppHome> createState() => _RiveAppHomeState();
}

class _RiveAppHomeState extends State<RiveAppHome>
    with TickerProviderStateMixin {
  late AnimationController? _animationController;
  late AnimationController? _onBoardingAnimController;
  late Animation<double> _onBoardingAnim;
  late Animation<double> _sidebarAnim;

  late SMIBool _menuBtn;

  bool _showOnBoarding = false;
  Widget _tabBody = Container(); // Will be set in initState
  final List<Widget> _screens = [
    const HomeTabView(),
    commonTabScene("Menu"),
    commonTabScene("Orders"),
    commonTabScene("Notifications"),
    commonTabScene("Profile"),
  ];

  final springDesc = const SpringDescription(
    mass: 0.1,
    stiffness: 40,
    damping: 5,
  );

  void _onMenuIconInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(
      artboard,
      "State Machine",
    );
    artboard.addController(controller!);
    _menuBtn = controller.findInput<bool>("isOpen") as SMIBool;
    _menuBtn.value = true;
  }

  void _presentOnBoarding(bool show) {
    if (show) {
      setState(() {
        _showOnBoarding = true;
      });
      final springAnim = SpringSimulation(springDesc, 0, 1, 0);
      _onBoardingAnimController?.animateWith(springAnim);
    } else {
      _onBoardingAnimController?.reverse().whenComplete(
        () => {
          setState(() {
            _showOnBoarding = false;
          }),
        },
      );
    }
  }

  void onMenuPress() {
    if (_menuBtn.value) {
      final springAnim = SpringSimulation(springDesc, 0, 1, 0);
      _animationController?.animateWith(springAnim);
    } else {
      _animationController?.reverse();
    }
    _menuBtn.change(!_menuBtn.value);

    SystemChrome.setSystemUIOverlayStyle(
      _menuBtn.value ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
    );
  }

  @override
  void initState() {
    // Reduced animation duration for faster loading
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150), // Reduced from 200
      upperBound: 1,
      vsync: this,
    );
    _onBoardingAnimController = AnimationController(
      duration: const Duration(milliseconds: 250), // Reduced from 350
      upperBound: 1,
      vsync: this,
    );

    // Use more efficient curve for better performance
    _sidebarAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController!, curve: Curves.easeOut),
    );

    _onBoardingAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _onBoardingAnimController!,
        curve: Curves.easeOut,
      ),
    );

    _tabBody = _screens.first;
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    _onBoardingAnimController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          // Enhanced background with glass effect
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RiveAppTheme.getBackgroundGradient(context),
              ),
              child: CustomPaint(painter: RestaurantBackgroundPainter()),
            ),
          ),
          RepaintBoundary(
            child: AnimatedBuilder(
              animation: _sidebarAnim,
              builder: (BuildContext context, Widget? child) {
                return Transform(
                  alignment: Alignment.center,
                  transform:
                      Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(
                          ((1 - _sidebarAnim.value) * -30) * math.pi / 180,
                        )
                        ..translate((1 - _sidebarAnim.value) * -300),
                  child: child,
                );
              },
              child: FadeTransition(
                opacity: _sidebarAnim,
                child: const SideMenu(),
              ),
            ),
          ),
          RepaintBoundary(
            child: AnimatedBuilder(
              animation: _showOnBoarding ? _onBoardingAnim : _sidebarAnim,
              builder: (context, child) {
                return Transform.scale(
                  scale:
                      1 -
                      (_showOnBoarding
                          ? _onBoardingAnim.value * 0.08
                          : _sidebarAnim.value * 0.1),
                  child: Transform.translate(
                    offset: Offset(_sidebarAnim.value * 265, 0),
                    child: Transform(
                      alignment: Alignment.center,
                      transform:
                          Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..rotateY(
                              (_sidebarAnim.value * 30) * math.pi / 180,
                            ),
                      child: child,
                    ),
                  ),
                );
              },
              child: _tabBody,
            ),
          ),
          AnimatedBuilder(
            animation: _sidebarAnim,
            builder: (context, child) {
              return Positioned(
                top: MediaQuery.of(context).padding.top + 20,
                right: (_sidebarAnim.value * -100) + 16,
                child: child!,
              );
            },
            child: GestureDetector(
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        gradient: RiveAppTheme.getButtonGradient(),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: RiveAppTheme.glassBorder,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: RiveAppTheme.getShadow(context),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        RestaurantIcons.chef,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              onTap: () {
                _presentOnBoarding(true);
              },
            ),
          ),
          RepaintBoundary(
            child: AnimatedBuilder(
              animation: _sidebarAnim,
              builder: (context, child) {
                return SafeArea(
                  child: Row(
                    children: [
                      // There's an issue/behaviour in flutter where translating the GestureDetector or any button
                      // doesn't translate the touch area, making the Widget unclickable, so instead setting a SizedBox
                      // in a Row to have a similar effect
                      SizedBox(width: _sidebarAnim.value * 216),
                      child!,
                    ],
                  ),
                );
              },
              child: GestureDetector(
                onTap: onMenuPress,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    width: 44,
                    height: 44,
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(44 / 2),
                      boxShadow: [
                        BoxShadow(
                          color: RiveAppTheme.getShadow(
                            context,
                          ).withOpacity(0.2),
                          blurRadius: 5,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: RiveAnimation.asset(
                      app_assets.menuButtonRiv,
                      stateMachines: const ["State Machine"],
                      animations: const ["open", "close"],
                      onInit: _onMenuIconInit,
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (_showOnBoarding)
            RepaintBoundary(
              child: AnimatedBuilder(
                animation: _onBoardingAnim,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(
                      0,
                      -(MediaQuery.of(context).size.height +
                              MediaQuery.of(context).padding.bottom) *
                          (1 - _onBoardingAnim.value),
                    ),
                    child: child!,
                  );
                },
                child: SafeArea(
                  top: false,
                  maintainBottomViewPadding: true,
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom + 18,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 40,
                          offset: const Offset(0, 40),
                        ),
                      ],
                    ),
                    child: OnBoardingView(
                      closeModal: () {
                        _presentOnBoarding(false);
                      },
                    ),
                  ),
                ),
              ),
            ),
          // White underlay behind the bottom tab bar
          IgnorePointer(
            ignoring: true,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedBuilder(
                animation: !_showOnBoarding ? _sidebarAnim : _onBoardingAnim,
                builder: (context, child) {
                  return Container(
                    height: 150,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          RiveAppTheme.getBackground(context).withOpacity(0),
                          RiveAppTheme.getBackground(context).withOpacity(
                            1 -
                                (!_showOnBoarding
                                    ? _sidebarAnim.value
                                    : _onBoardingAnim.value),
                          ),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: RepaintBoundary(
        child: AnimatedBuilder(
          animation: !_showOnBoarding ? _sidebarAnim : _onBoardingAnim,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(
                0,
                !_showOnBoarding
                    ? _sidebarAnim.value * 300
                    : _onBoardingAnim.value * 200,
              ),
              child: child,
            );
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomTabBar(
                onTabChange: (tabIndex) {
                  setState(() {
                    _tabBody = _screens[tabIndex];
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
