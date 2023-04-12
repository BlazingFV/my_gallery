import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_gallery/src/utils/sizer.dart';

class CustomImageWidget extends StatelessWidget {
  final String imageUrl;
  const CustomImageWidget({
    super.key,
    required this.imageUrl,
  });

  // final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizer(isWidth: false, value: 108),
      width: sizer(isWidth: true, value: 108),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 4,
                spreadRadius: 2,
                offset: const Offset(0, 4))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: CachedNetworkImage(
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
              child: CircularProgressIndicator(
            value: downloadProgress.progress,
          )),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          imageUrl: imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
