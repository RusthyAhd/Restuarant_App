import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' hide LinearGradient;
import '../models/tab_item.dart';
import '../theme.dart';
import '../assets.dart' as app_assets;
import 'dart:ui';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({Key? key, required this.onTabChange}) : super(key: key);

  final Function(int tabIndex) onTabChange;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  final List<TabItem> _icons = TabItem.tabItemsList;

  int _selectedTab = 0;

  void _onRiveIconInit(Artboard artboard, index) {
    final controller = StateMachineController.fromArtboard(
      artboard,
      _icons[index].stateMachine,
    );
    artboard.addController(controller!);

    _icons[index].status = controller.findInput<bool>("active") as SMIBool;
  }

  void onTabPress(int index) {
    if (_selectedTab != index) {
      setState(() {
        _selectedTab = index;
      });
      widget.onTabChange(index);

      _icons[index].status!.change(true);
      Future.delayed(const Duration(seconds: 1), () {
        _icons[index].status!.change(false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              constraints: const BoxConstraints(maxWidth: 768, minHeight: 60),
              decoration: BoxDecoration(
                gradient: RiveAppTheme.getGlassGradient(context),
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: RiveAppTheme.glassBorder, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: RiveAppTheme.getShadow(context),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                  BoxShadow(
                    color: RiveAppTheme.glassHighlight,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(_icons.length, (index) {
                  TabItem icon = _icons[index];

                  return Expanded(
                    key: icon.id,
                    child: GestureDetector(
                      onTap: () => onTabPress(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 8,
                        ),
                        decoration:
                            _selectedTab == index
                                ? BoxDecoration(
                                  gradient: RiveAppTheme.getButtonGradient(),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: RiveAppTheme.secondaryYellow
                                          .withOpacity(0.4),
                                      blurRadius: 8,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                )
                                : null,
                        child: AnimatedOpacity(
                          opacity: _selectedTab == index ? 1 : 0.7,
                          duration: const Duration(milliseconds: 200),
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                height: 28,
                                width: 28,
                                child: RiveAnimation.asset(
                                  app_assets.iconsRiv,
                                  stateMachines: [icon.stateMachine],
                                  artboard: icon.artboard,
                                  onInit: (artboard) {
                                    _onRiveIconInit(artboard, index);
                                  },
                                ),
                              ),
                              if (_selectedTab == index)
                                Positioned(
                                  bottom: -8,
                                  child: Container(
                                    width: 4,
                                    height: 4,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white.withOpacity(0.8),
                                          blurRadius: 4,
                                          spreadRadius: 1,
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
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
