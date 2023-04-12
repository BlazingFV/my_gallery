import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/sizer.dart';

class CustomRoundedButton extends StatelessWidget {
  final String svgAssetPath;
  final String buttontitle;
  final VoidCallback onTap;
  const CustomRoundedButton({
    required this.buttontitle,
    required this.svgAssetPath,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: sizer(value: 145, isWidth: true),
        height: sizer(isWidth: false, value: 41),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            // stops: const [0, 1, 2],
            colors: [
              Colors.white.withOpacity(1),
              Colors.white.withOpacity(0.57),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            SizedBox(
              width: sizer(value: 15, isWidth: true),
            ),
            SvgPicture.asset(
              'assets/$svgAssetPath',
              width: sizer(value: 32.22, isWidth: true),
              height: sizer(isWidth: false, value: 28.83),
            ),
            SizedBox(
              width: sizer(value: 9.3, isWidth: true),
            ),
            AutoSizeText(
              buttontitle,
              textAlign: TextAlign.start,
              style: GoogleFonts.balooThambi2(
                color: const Color(0xff4A4A4A),
                fontWeight: FontWeight.w500,
                height: 1.3,
                fontSize: 20.sp,
              ),
              // minFontSize: 45,
            ),
          ],
        ),
      ),
    );
  }
}
