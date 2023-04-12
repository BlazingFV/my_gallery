import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_gallery/src/constants/provider_constans.dart';
import 'package:path_drawing/path_drawing.dart';

import '../../../../utils/sizer.dart';
import 'custom_container_widget.dart';

class GalleryBackgroundWidgets extends ConsumerWidget {
  GalleryBackgroundWidgets({
    // required this.userName,
    super.key,
  });
  // final String userName;
  final svgData = parseSvgPathData(
      "M419.276,125.343c-1.709-2.2-7.425-9.124-19.033-14.036-18.8-7.939-26.2.8-57.592-4-7.247-1.114-17.187-3.113-26.143-10.5a46.151,46.151,0,0,1-8.6-9.381,57.327,57.327,0,0,1-7.11-18.963c-2.735-15.35,1.272-18.563-1-29.7-2.16-10.6-8.2-18.563-12.661-23.218C273.219.957,254.979.086,250.3,0H49.566A51.259,51.259,0,0,0,15.041,15.25,55.223,55.223,0,0,0,0,47.336V1385.682H427.973V145.034a46.539,46.539,0,0,0-8.7-19.691Z");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        Padding(
          padding: EdgeInsets.only(
            top: sizer(isWidth: false, value: 355.6),
            left: sizer(isWidth: true, value: 193.64),
          ),
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
        Padding(
          padding: EdgeInsets.only(
            top: sizer(isWidth: false, value: 337),
            left: sizer(isWidth: true, value: 4),
          ),
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
        Padding(
          padding: EdgeInsets.only(
            top: sizer(isWidth: false, value: 512),
            left: sizer(isWidth: true, value: 0),
          ),
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
        Padding(
          padding: EdgeInsets.only(
            top: sizer(isWidth: false, value: 586),
            left: sizer(isWidth: true, value: 103),
          ),
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
        Padding(
          padding: EdgeInsets.only(
            top: sizer(isWidth: false, value: 10),
            left: sizer(isWidth: true, value: 0),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: CustomPaint(
              size: Size(sizer(value: totalWidth, isWidth: true), totalHeight),
              painter: CustomContainerBackground(
                  path: svgData,
                  color: const Color.fromARGB(102, 255, 255, 255)),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: sizer(isWidth: false, value: 43),
            left: sizer(isWidth: true, value: 27),
          ),
          // right: ,
          // bottom: 0,
          child: SizedBox(
            width: sizer(value: 200, isWidth: true),
            // height: sizer(value: 105, isWidth: false),
            child: AutoSizeText(
              "Welcome\n${ref.watch(authProvider).getName()}",

              textAlign: TextAlign.start,
              style: GoogleFonts.balooThambi2(
                color: const Color(0xff4A4A4A),
                fontWeight: FontWeight.w500,
                height: 1.3,
                fontSize: 32.sp,
              ),
              // minFontSize: 45,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: sizer(isWidth: false, value: 40),
            left: sizer(isWidth: true, value: 355),
          ),
          // right: ,
          // bottom: 0,
          child: SizedBox(
              width: sizer(value: 66, isWidth: true),
              height: sizer(value: 66, isWidth: false),
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                // maxRadius: 40.r,
                child: Center(
                  child: Icon(
                    Icons.person_2,
                    size: 30,
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
