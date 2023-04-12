import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// import '../configs/app_configs.dart';

class SnackBarService {
  static SnackBarService instance = SnackBarService();

  SnackBarService();

  void showSnackBarError(String message) {
    Get.snackbar(
      '',
      '',
      margin: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      duration: const Duration(seconds: 5),
      titleText: Text(
        'Alert!',
        style: GoogleFonts.openSans(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 15.sp,
        ),
      ),
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
      messageText: Text(
        message,
        style: GoogleFonts.openSans(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 15.sp,
        ),
      ),
      snackPosition: SnackPosition.TOP,
      // snackStyle: SnackStyle.GROUNDED,
      backgroundColor: Colors.red[400],
      shouldIconPulse: true,
    );
  }

  void showSnackBarSuccess(String message) {
    Get.snackbar(
      '',
      '',
      margin: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      duration: const Duration(seconds: 3),
      titleText: Text(
        'Success',
        style: GoogleFonts.openSans(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 15.sp,
        ),
      ),
      messageText: Text(
        message,
        style: GoogleFonts.openSans(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 15.sp,
        ),
      ),
      snackPosition: SnackPosition.TOP,
      animationDuration: const Duration(milliseconds: 350),
      // forwardAnimationCurve: Curves.easeIn,
      // reverseAnimationCurve: Curves.easeOutBack,
      backgroundColor: Colors.green[400],
      // snackStyle: SnackStyle.GROUNDED,
    );
  }
}
