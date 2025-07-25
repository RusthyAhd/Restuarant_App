import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' hide LinearGradient, Image;
import '../theme.dart';
import '../assets.dart' as app_assets;

class SignInView extends StatefulWidget {
  const SignInView({Key? key, this.closeModal}) : super(key: key);

  final Function? closeModal;

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  late SMITrigger _successAnim;
  late SMITrigger _errorAnim;
  late SMITrigger _confettiAnim;

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  void _onCheckRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(
      artboard,
      "State Machine 1",
    );
    artboard.addController(controller!);
    _successAnim = controller.findInput<bool>("Check") as SMITrigger;
    _errorAnim = controller.findInput<bool>("Error") as SMITrigger;
  }

  void _onConfettiRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(
      artboard,
      "State Machine 1",
    );
    artboard.addController(controller!);
    _confettiAnim =
        controller.findInput<bool>("Trigger explosion") as SMITrigger;
  }

  void login() {
    setState(() {
      _isLoading = true;
    });

    bool isEmailValid = _emailController.text.trim().isNotEmpty;
    bool isPassValid = _passController.text.trim().isNotEmpty;
    bool isValid = isEmailValid && isPassValid;

    Future.delayed(const Duration(seconds: 1), () {
      isValid ? _successAnim.fire() : _errorAnim.fire();
    });

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
      if (isValid) _confettiAnim.fire();
    });

    if (isValid) {
      Future.delayed(const Duration(seconds: 4), () {
        widget.closeModal!();
        _emailController.text = "";
        _passController.text = "";
      });
    }
  }

  Widget _buildSocialLoginButton(String imagePath, String platform) {
    return GestureDetector(
      onTap: () {
        // Add social login functionality here
        print("Sign in with $platform");
      },
      child: Container(
        width: 60,
        height: 60,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black.withOpacity(0.1), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Image.asset(
          imagePath,
          width: 36,
          height: 36,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  constraints: const BoxConstraints(maxWidth: 600),
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [Colors.white.withOpacity(0.8), Colors.white10],
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(29),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: RiveAppTheme.getShadow(
                            context,
                          ).withOpacity(0.3),
                          offset: const Offset(0, 3),
                          blurRadius: 5,
                        ),
                        BoxShadow(
                          color: RiveAppTheme.getShadow(
                            context,
                          ).withOpacity(0.3),
                          offset: const Offset(0, 30),
                          blurRadius: 30,
                        ),
                      ],
                      color: CupertinoColors.secondarySystemBackground,
                      // This kind of give the background iOS style "Frosted Glass" effect,
                      // it works for this particular color, might not for other
                      backgroundBlendMode: BlendMode.luminosity,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Sign In",
                          style: TextStyle(fontFamily: "Poppins", fontSize: 34),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          "Welcome to our restaurant! Sign in to access exclusive menu items, special offers, and seamless ordering experience.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Email",
                            style: TextStyle(
                              color: CupertinoColors.secondaryLabel,
                              fontFamily: "Inter",
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          decoration: authInputStyle("icon_email"),
                          controller: _emailController,
                        ),
                        const SizedBox(height: 24),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Password",
                            style: TextStyle(
                              color: CupertinoColors.secondaryLabel,
                              fontFamily: "Inter",
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          obscureText: true,
                          decoration: authInputStyle("icon_lock"),
                          controller: _passController,
                        ),
                        const SizedBox(height: 24),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFF77D8E).withOpacity(0.5),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: CupertinoButton(
                            padding: const EdgeInsets.all(20),
                            color: const Color(0xFFF77D8E),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.arrow_forward_rounded),
                                SizedBox(width: 4),
                                Text(
                                  "Sign In",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {
                              if (!_isLoading) login();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: Row(
                            children: [
                              const Expanded(child: Divider()),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                child: Text(
                                  "OR",
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.3),
                                    fontSize: 15,
                                    fontFamily: "Inter",
                                  ),
                                ),
                              ),
                              const Expanded(child: Divider()),
                            ],
                          ),
                        ),
                        const Text(
                          "Or sign in with",
                          style: TextStyle(
                            color: CupertinoColors.secondaryLabel,
                            fontFamily: "Inter",
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildSocialLoginButton(
                              app_assets.logoEmail,
                              "Email",
                            ),
                            _buildSocialLoginButton(
                              app_assets.logoApple,
                              "Apple",
                            ),
                            _buildSocialLoginButton(
                              app_assets.logoGoogle,
                              "Google",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned.fill(
                  child: IgnorePointer(
                    ignoring: true,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        if (_isLoading)
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: RiveAnimation.asset(
                              app_assets.checkRiv,
                              onInit: _onCheckRiveInit,
                            ),
                          ),
                        Positioned.fill(
                          child: SizedBox(
                            width: 500,
                            height: 500,
                            child: Transform.scale(
                              scale: 3,
                              child: RiveAnimation.asset(
                                app_assets.confettiRiv,
                                onInit: _onConfettiRiveInit,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.center,
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      borderRadius: BorderRadius.circular(36 / 2),
                      minSize: 36,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(36 / 2),
                          boxShadow: [
                            BoxShadow(
                              color: RiveAppTheme.getShadow(
                                context,
                              ).withOpacity(0.3),
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Icon(Icons.close, color: Colors.black),
                      ),
                      onPressed: () {
                        widget.closeModal!();
                      },
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
}

// Common style for Auth Input fields email and password
InputDecoration authInputStyle(String iconName) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.white,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.black.withOpacity(0.1)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.black.withOpacity(0.1)),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    prefixIcon: Container(
      width: 24,
      height: 24,
      margin: const EdgeInsets.only(left: 12, right: 8),
      child: Image.asset(
        "assets/samples/ui/rive_app/images/$iconName.png",
        width: 20,
        height: 20,
        fit: BoxFit.contain,
      ),
    ),
    prefixIconConstraints: const BoxConstraints(minWidth: 44, minHeight: 44),
  );
}
