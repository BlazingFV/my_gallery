import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

double totalWidth = ScreenUtil().screenWidth;
double totalHeight = ScreenUtil().screenHeight;

sizer({required bool isWidth,required double value}) {
  if (isWidth) {
    return ScreenUtil().screenWidth * (value / 428);
  } else {
    return ScreenUtil().screenHeight * (value / 926);
  }
}

// sizeFit(bool width, double value, BuildContext context) {
//   if (width) {
//     return MediaQuery.of(context).size.width * (value / 375.0);
//   } else {
//     return MediaQuery.of(context).size.height * (value / 812.0);
//   }
// }
