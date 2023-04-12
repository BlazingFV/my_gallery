import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SharedLoadingDialog extends StatelessWidget {
  late String title;
  late double? loadingProgress;
  SharedLoadingDialog({Key? key, required this.title, this.loadingProgress})
      : super(key: key);
  // CategoryController controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      content: Builder(
        builder: (context) => Container(
          // height: Get.height * 0.2,
          width: Get.width * 1,
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
          constraints: BoxConstraints(
              maxHeight: Get.height * 0.25, minHeight: Get.height * 0.095),
          child: Row(
            children: [
              const CircularProgressIndicator(
                color: Colors.grey,
                // value: controller.downloadProgressDouble.value != 0.0
                //     ? controller.downloadProgressDouble.value / 100
                //     : null,
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: FittedBox(
                    child: AutoSizeText(
                      title,
                      style: GoogleFonts.openSans(
                        color: const Color(0xff4A4A4A),
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                      ),
                      textScaleFactor: Get.textScaleFactor,
                      maxFontSize: 12,
                      minFontSize: 8,
                      maxLines: 3,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // clipBehavior: Clip.hardEdge,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
