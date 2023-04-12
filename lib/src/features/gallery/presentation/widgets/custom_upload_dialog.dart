import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_gallery/src/utils/sizer.dart';

class GlassmorphismDialog extends StatelessWidget {
  final String title;
  final String message;
  final Function pickFromGallery;
  final Function imageFromCamera;

  const GlassmorphismDialog({
    super.key,
    required this.title,
    required this.message,
    required this.pickFromGallery,
    required this.imageFromCamera,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
          child: Container(
            width: sizer(value: 372, isWidth: true),
            height: sizer(value: 300, isWidth: false),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(32.0),
                border: Border.all(color: Colors.white, width: 0.6)),
            child: Material(
              elevation: 0,
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      // print('asas');
                      await pickFromGallery();
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 2,
                      fixedSize: Size(sizer(value: 186, isWidth: true),
                          sizer(value: 65, isWidth: false)),
                      backgroundColor: const Color(0xffEFD8F9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Row(children: [
                      // SizedBox(width: sizer(isWidth: true, value: 11.6)),
                      SvgPicture.asset('assets/gallery_icon.svg'),
                      SizedBox(width: sizer(isWidth: true, value: 4.6)),
                      AutoSizeText(
                        "Gallery",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.openSans(
                          color: const Color(0xff4A4A4A),
                          fontWeight: FontWeight.w700,
                          height: 1.3,
                          fontSize: 27.sp,
                        ),
                        // minFontSize: 45,
                      ),
                    ]),
                  ),
                  SizedBox(height: sizer(isWidth: false, value: 44)),
                  ElevatedButton(
                    onPressed: () {
                      imageFromCamera();
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 2,
                      fixedSize: Size(sizer(value: 194, isWidth: true),
                          sizer(value: 68.4, isWidth: false)),
                      backgroundColor: const Color(0xffEBF6FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    // SizedBox(width: sizer(isWidth: true, value: 2.6)),

                    child: Row(children: [
                      Image.asset(
                        'assets/camera_icon.png',
                        width: sizer(value: 45, isWidth: true),
                        height: sizer(value: 45, isWidth: false),
                      ),
                      AutoSizeText(
                        "Camera",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.openSans(
                          color: const Color(0xff4A4A4A),
                          fontWeight: FontWeight.w700,
                          height: 1.3,
                          fontSize: 26.sp,
                        ),
                        // minFontSize: 45,
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


//  ClipRRect(
//                     borderRadius: BorderRadius.circular(20),
//                     child: BackdropFilter(
//                       filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
//                       child: Container(
//                         width: sizer(value: 184, isWidth: true),
//                         height: sizer(value: 65, isWidth: false),
//                         decoration: BoxDecoration(
//                           color: const Color(0xffEFD8F9),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Row(children: [
//                           SizedBox(width: sizer(isWidth: true, value: 14.6)),
//                           SvgPicture.asset('assets/gallery_icon.svg'),
//                           SizedBox(width: sizer(isWidth: true, value: 4.6)),
//                           AutoSizeText(
//                             "Gallery",
//                             textAlign: TextAlign.start,
//                             style: GoogleFonts.openSans(
//                               color: const Color(0xff4A4A4A),
//                               fontWeight: FontWeight.w700,
//                               height: 1.3,
//                               fontSize: 27.sp,
//                             ),
//                             // minFontSize: 45,
//                           ),
//                         ]),
//                       ),
//                     ),
//                   ),