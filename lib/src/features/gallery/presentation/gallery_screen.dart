import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:my_gallery/src/constants/provider_constans.dart';
import 'package:my_gallery/src/features/gallery/presentation/widgets/custom_button.dart';
import 'package:my_gallery/src/features/gallery/presentation/widgets/custom_image_widget.dart';
import 'package:my_gallery/src/features/gallery/presentation/widgets/custom_upload_dialog.dart';
import 'package:my_gallery/src/features/gallery/presentation/widgets/gallery_background_widgets.dart';

import '../../../controllers/routing.dart';
import '../../../utils/sizer.dart';

class GalleryScreen extends ConsumerStatefulWidget {
  const GalleryScreen({super.key});

  @override
  ConsumerState<GalleryScreen> createState() => _GalleryScreenConsumerState();
}

class _GalleryScreenConsumerState extends ConsumerState<GalleryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ref.read(galleryProvider).getUserGalleryImages();
    });
  }

  @override
  Widget build(BuildContext context) {
    log('$totalWidth');

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: SizedBox(
          width: sizer(value: 428, isWidth: true),
          height: sizer(isWidth: false, value: 926),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  width: sizer(value: 428, isWidth: true),
                  height: sizer(isWidth: false, value: 926),
                  child: Stack(
                    children: [
                      GalleryBackgroundWidgets(),
                      Positioned(
                        left: sizer(value: 45, isWidth: true),
                        top: sizer(isWidth: false, value: 218),
                        child: Row(
                          children: [
                            CustomRoundedButton(
                              onTap: () {
                                Get.offAllNamed(
                                    GetRoutes.getRouteLoginScreen());
                              },
                              buttontitle: 'logout',
                              svgAssetPath: 'log_out.svg',
                            ),
                            SizedBox(
                              width: sizer(value: 50, isWidth: true),
                            ),
                            CustomRoundedButton(
                              onTap: () {
                                showUploadDialog();
                              },
                              buttontitle: 'upload',
                              svgAssetPath: 'upload_icon.svg',
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: sizer(value: 24, isWidth: true),
                        top: sizer(isWidth: false, value: 300.11),
                        child: SizedBox(
                          width: sizer(value: 372, isWidth: true),
                          height: sizer(isWidth: false, value: totalHeight),
                          child: GridView.builder(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            itemCount: ref
                                .watch(galleryProvider)
                                .galleryImagesList
                                .length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: sizer(isWidth: true, value: 24),
                              mainAxisSpacing: sizer(isWidth: false, value: 24),
                              crossAxisCount: 3,
                            ),
                            itemBuilder: (context, index) {
                              return CustomImageWidget(
                                imageUrl: ref
                                    .watch(galleryProvider)
                                    .galleryImagesList[index],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showUploadDialog() {
    showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black38,
      transitionDuration: const Duration(milliseconds: 350),
      pageBuilder: (ctx, anim1, anim2) => GlassmorphismDialog(
        title: 'tsts',
        message: 'tstst',
        pickFromGallery: () async {
          // print('clicked');
          await ref.read(galleryProvider).getImageFromGallery();
        },
        imageFromCamera: () async {
          await ref.read(galleryProvider).getImageFromCamera();
        },
      ),
      transitionBuilder: (ctx, anim1, anim2, child) => FadeTransition(
        opacity: anim1,
        child: child,
      ),
      context: context,
    );
  }
}
