import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';




import '../../../../constants/provider_constans.dart';
import '../../../../shared/widgets/custom_text_field.dart';
import '../../../../utils/sizer.dart';

class LoginFormWidget extends ConsumerStatefulWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  ConsumerState<LoginFormWidget> createState() =>
      _LoginFormWidgetConsumerState();
}

class _LoginFormWidgetConsumerState extends ConsumerState<LoginFormWidget> {
  TextEditingController userNameTextController = TextEditingController();

  TextEditingController passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  bool isValidInput = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            width: sizer(value: 345, isWidth: true),
            height: sizer(isWidth: false, value: 388),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Colors.white.withOpacity(0.4),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: sizer(value: 241, isWidth: true),
                  margin: EdgeInsets.only(
                    // left: sizer(value: 93, isWidth: true),
                    top: sizer(value: 38, isWidth: false),
                  ),
                  child: AutoSizeText(
                    "LOG IN",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      color: const Color(0xff4A4A4A),
                      fontWeight: FontWeight.bold,
                      fontSize: 30.sp,
                    ), // minFontSize: 45,
                  ),
                ),
                SizedBox(height: sizer(isWidth: false, value: 30)),
                CustomTextField(
                  isValid: isValidInput,
                  labelText: 'username',
                  controller: userNameTextController,
                  hintText: 'username',
                  keyboardType: TextInputType.emailAddress,
                  obscuringFunction: () {},
                  onSaved: (value) {
                    ref.read(authProvider).setEmail(value!);
                    return null;
                  },
                  passwordVisible: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "username is required";
                    } else if (value.length < 6) {
                      return "please check username length";
                    }
                    return null;
                  },
                ),
                SizedBox(height: sizer(isWidth: false, value: 30)),
                CustomTextField(
                  isValid: isValidInput,
                  labelText: 'password',
                  controller: passwordTextController,
                  hintText: 'password',
                  keyboardType: TextInputType.visiblePassword,
                  obscuringFunction: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  onSaved: (value) {
                    ref.read(authProvider).setPassword(value!);

                    return null;
                  },
                  passwordVisible: isPasswordVisible,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "password is required";
                    } else if (value.length < 8) {
                      return "please check password length";
                    }
                    return null;
                  },
                ),
                SizedBox(height: sizer(isWidth: false, value: 30)),
                SizedBox(
                  width: sizer(value: 282.42, isWidth: true),
                  height: sizer(isWidth: false, value: 46.11),
                  child: ElevatedButton(
                    onPressed: () async {
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          isValidInput = true;
                        });
                        await ref.read(authProvider).loginUsingEmail();
                      } else {
                        setState(() {
                          isValidInput = false;
                        });
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff7BB3FF)),
                        elevation: MaterialStateProperty.all(0),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    child: AutoSizeText(
                      'SUBMIT',
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
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
