import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:my_gallery/src/features/login/presentation/widgets/background_widgets.dart';
import 'package:my_gallery/src/features/login/presentation/widgets/login_form_widget.dart';
import 'dart:async';

import '../../../utils/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isKeyboardVisible = false;
  late StreamSubscription<bool> keyboardSubscription;
  double keyboardHeight = 0.0;

  @override
  void initState() {
    super.initState();

    var keyboardVisibilityController = KeyboardVisibilityController();
    // Query
    // print(
    //     'Keyboard visibility direct query: ${keyboardVisibilityController.isVisible}');

    // Subscribe
    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      setState(() {
        isKeyboardVisible = visible;
      });
      // print('Keyboard visibility update. Is visible: $visible');
    });
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewInsets = EdgeInsets.fromWindowPadding(
        WidgetsBinding.instance.window.viewInsets,
        WidgetsBinding.instance.window.devicePixelRatio);
    keyboardHeight = viewInsets.bottom;
    log('$totalWidth');
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: sizer(value: 426, isWidth: true),
        height: sizer(isWidth: false, value: 926),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: sizer(value: 426, isWidth: true),
                height: sizer(isWidth: false, value: 926),
                child: Stack(
                  children: [
                    const LoginScreenBackGroundWidgets(),
                    AnimatedPadding(
                      duration: const Duration(milliseconds: 350),
                      curve: Curves.easeInOut,
                      padding: EdgeInsets.only(
                        top: sizer(
                            isWidth: false,
                            value: isKeyboardVisible
                                ? (keyboardHeight / 1.3)
                                : 368),
                        left: sizer(isWidth: true, value: 41),
                      ),
                      child: const LoginFormWidget(),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
