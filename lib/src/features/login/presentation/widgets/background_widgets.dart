import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../../utils/sizer.dart';

class LoginScreenBackGroundWidgets extends StatelessWidget {
  const LoginScreenBackGroundWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: sizer(isWidth: false, value: 59),
          left: sizer(isWidth: true, value: -197),
          // right: ,
          // bottom: 0,
          child: SizedBox(
            width: sizer(value: 468, isWidth: true),
            height: sizer(value: 594, isWidth: false),
            child: SizedBox(
              width: sizer(value: 468, isWidth: true),
              height: sizer(value: 594, isWidth: false),
              child: Container(
                width: sizer(value: 468, isWidth: true),
                height: sizer(value: 594, isWidth: false),
                decoration: const BoxDecoration(
                  color: Color(0xffEA94D7),
                  borderRadius: BorderRadius.all(Radius.elliptical(350, 250)),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffEA94D7).withOpacity(0.0)),
                  ),
                ),
              ),
              // fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: sizer(isWidth: false, value: 293.85),
          left: sizer(isWidth: true, value: -50.2),
          // right: ,
          // bottom: 0,
          child: SizedBox(
            width: sizer(value: 538.67, isWidth: true),
            height: sizer(value: 683.15, isWidth: false),
            child: Container(
              width: sizer(value: 538.67, isWidth: true),
              height: sizer(value: 683.15, isWidth: false),
              decoration: const BoxDecoration(
                color: Color(0xffFFDADA),
                borderRadius: BorderRadius.all(Radius.elliptical(550, 650)),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffFFDADA).withOpacity(0.0)),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: sizer(isWidth: false, value: -77),
          left: sizer(isWidth: true, value: 90),
          // right: ,
          // bottom: 0,
          child: SizedBox(
            width: sizer(value: 539, isWidth: true),
            height: sizer(value: 683, isWidth: false),
            child: Container(
              width: sizer(value: 539, isWidth: true),
              height: sizer(value: 683, isWidth: false),
              decoration: const BoxDecoration(
                color: Color(0xffddcdff),
                borderRadius: BorderRadius.all(Radius.elliptical(550, 650)),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffddcdff).withOpacity(0.0)),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: sizer(isWidth: false, value: 355.6),
          left: sizer(isWidth: true, value: 193.64),
          // right: ,
          // bottom: 0,
          child: SizedBox(
            width: sizer(value: 197.4, isWidth: true),
            height: sizer(value: 219.69, isWidth: false),
            child: Image.asset(
              "assets/ellipses_union.png",
              width: sizer(value: 197.4, isWidth: true),
              height: sizer(value: 219.69, isWidth: false),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Positioned(
          top: sizer(isWidth: false, value: 337),
          left: sizer(isWidth: true, value: 4),
          // right: ,
          // bottom: 0,
          child: SizedBox(
            width: sizer(value: 202.54, isWidth: true),
            height: sizer(value: 202.54, isWidth: false),
            child: Image.asset(
              "assets/image_vector.png",
              width: sizer(value: 202.54, isWidth: true),
              height: sizer(value: 202.54, isWidth: false),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Positioned(
          top: sizer(isWidth: false, value: 512),
          left: sizer(isWidth: true, value: -1),
          // right: ,
          // bottom: 0,
          child: SizedBox(
              width: sizer(value: 428, isWidth: true),
              height: sizer(value: 414, isWidth: false),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    // stops: const [0, 1, 2],
                    colors: [
                      Colors.white.withOpacity(1),
                      Colors.white.withOpacity(0.3),
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.1),
                    ],
                  ),
                ),
              )),
        ),
        Positioned(
          top: sizer(isWidth: false, value: 586),
          left: sizer(isWidth: true, value: 103),
          // right: ,
          // bottom: 0,
          child: SizedBox(
            width: sizer(value: 242.18, isWidth: true),
            height: sizer(value: 242.18, isWidth: false),
            child: Image.asset(
              "assets/video.png",
              width: sizer(value: 242.18, isWidth: true),
              height: sizer(value: 242.18, isWidth: false),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Positioned(
          top: sizer(isWidth: false, value: 206),
          left: sizer(isWidth: true, value: 127),
          // right: ,
          // bottom: 0,
          child: SizedBox(
            width: sizer(value: 183, isWidth: true),
            // height: sizer(value: 105, isWidth: false),
            child: AutoSizeText(
              "My\nGallery",
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                color: const Color(0xff4A4A4A),
                fontWeight: FontWeight.bold,
                fontSize: 50.sp,
              ),
              // minFontSize: 45,
            ),
          ),
        ),
        Positioned(
          top: sizer(isWidth: false, value: -140),
          left: sizer(isWidth: true, value: -72),
          // right: ,
          // bottom: 0,
          child: SizedBox(
            width: sizer(value: 375, isWidth: true),
            height: sizer(value: 358, isWidth: false),
            child: Image.asset(
              "assets/top_camera_logo.png",
              width: sizer(value: 375, isWidth: true),
              height: sizer(value: 358, isWidth: false),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
