import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';
import '../models/menu_item.dart';
import '../assets.dart' as app_assets;
import '../theme.dart';

class MenuRow extends StatelessWidget {
  const MenuRow({
    Key? key,
    required this.menu,
    this.selectedMenu = "Home",
    this.onMenuPress,
  }) : super(key: key);

  final MenuItemModel menu;
  final String selectedMenu;
  final Function? onMenuPress;

  void _onMenuIconInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(
      artboard,
      menu.riveIcon.stateMachine,
    );
    artboard.addController(controller!);
    menu.riveIcon.status = controller.findInput<bool>("active") as SMIBool;
  }

  void onMenuPressed() {
    if (selectedMenu != menu.title) {
      onMenuPress!();
      menu.riveIcon.status!.change(true);
      Future.delayed(const Duration(seconds: 1), () {
        menu.riveIcon.status!.change(false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // The menu button background that animates as we click on it
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: selectedMenu == menu.title ? 288 - 16 : 0,
          height: 56,
          curve: const Cubic(0.2, 0.8, 0.2, 1),
          decoration: BoxDecoration(
            color: RiveAppTheme.getPrimaryColor(context),
            borderRadius: BorderRadius.circular(10),
          ),
        ),

        CupertinoButton(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          pressedOpacity: 0.8, // Subtle touch effect
          onPressed: onMenuPressed,
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color:
                      selectedMenu == menu.title
                          ? Colors.white.withOpacity(0.2)
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: RiveAnimation.asset(
                  app_assets.iconsRiv,
                  stateMachines: [menu.riveIcon.stateMachine],
                  artboard: menu.riveIcon.artboard,
                  onInit: _onMenuIconInit,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  menu.title,
                  style: TextStyle(
                    color:
                        selectedMenu == menu.title
                            ? Colors.white
                            : Colors.white.withOpacity(0.8),
                    fontFamily: "Inter",
                    fontWeight:
                        selectedMenu == menu.title
                            ? FontWeight.w700
                            : FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
