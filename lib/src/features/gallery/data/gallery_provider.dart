import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as client;
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_gallery/src/features/gallery/domain/gallery_model.dart';
import 'package:path_provider/path_provider.dart';

import '../../../configs/app_configs.dart';
import '../../../helpers/cache_helper.dart';
import '../../../services/snackbar_service.dart';
import '../../../shared/widgets/shared_loading_dialog.dart';

class GalleryProvider extends ChangeNotifier {
  final dio = client.Dio(client.BaseOptions(
    connectTimeout: const Duration(milliseconds: 30000),
    receiveTimeout: const Duration(milliseconds: 30000),
    baseUrl: AppConfigs.apiBaseUrl,
    followRedirects: false,
    validateStatus: (status) => true,
    headers: {
      // 'Content-Type': 'application/json',
      "Content-Type": "multipart/form-data",
      'Accept': 'application/json',
    },
  ));

  final CacheHelper cacheHelper = CacheHelper();
  GalleryModel galleryModel = GalleryModel();
  List<String> galleryImagesList = [];
  final ImagePicker picker = ImagePicker();
  File? imageFile;

  getUserGalleryImages() async {
    await cacheHelper.initSharedPrefs();
    try {
      client.Response response = await dio.request('/my-gallery',
          options: client.Options(
            method: 'GET',
            followRedirects: false,
            validateStatus: (status) => true,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': "Bearer ${await cacheHelper.getToken()}"
            },
          ));

      log('===Gallery Response=======${response.data}===Gallery Response=======');
      if (response.statusCode == 201 || response.statusCode == 200) {
        galleryModel = GalleryModel.fromJson(response.data);
        galleryImagesList = galleryModel.data!.images ?? [];

        // SnackBarService.instance.showSnackBarSuccess('Logged In Successfully ');

        // Get.offAllNamed(GetRoutes.getRouteGalleryScreen());
        notifyListeners();
      } else {
        SnackBarService.instance
            .showSnackBarError('${response.data['message']}');
        log('===Getting Images Error Response=======${response.data['error_message']}===Getting Images Error Response=======');
        notifyListeners();
      }
    } catch (e) {
      log('$e');
      // throw Exception(e);
    }
  }

  uploadImagesToGallery(File? imageFile) async {
    await cacheHelper.initSharedPrefs();
    try {
      showLoaderDialog('Uploading...');
      client.FormData body = client.FormData.fromMap({});
      if (imageFile != null) {
        body.files.add(MapEntry(
          'img',
          await client.MultipartFile.fromFile(imageFile.path,
              filename: imageFile.path.split('/').last),
        ));
      }
      client.Response response = await dio.request('/upload',
          data: body,
          options: client.Options(
            method: 'POST',
            followRedirects: false,
            validateStatus: (status) => true,
            headers: {
              "Content-Type": "multipart/form-data",
              'Accept': 'application/json',
              'Authorization': "Bearer ${await cacheHelper.getToken()}"
            },
          ));

      log('===Gallery upload Response=======${response.data}===Gallery upload Response=======');
      if (response.statusCode == 201 || response.statusCode == 200) {
        await getUserGalleryImages();
        Get.back(canPop: true, closeOverlays: true);
        // SnackBarService.instance.showSnackBarSuccess('Logged In Successfully ');
        await Future.delayed(const Duration(milliseconds: 500));
        // Get.offAllNamed(GetRoutes.getRouteGalleryScreen());
        notifyListeners();
      } else {
        Get.back();
        await Future.delayed(const Duration(milliseconds: 1500));
        SnackBarService.instance
            .showSnackBarError('${response.data['message']}');

        notifyListeners();
      }
    } catch (e) {
      log('$e');
      // throw Exception(e);
    }
  }

  FutureOr<File?> getImageFromGallery() async {
    try {
      final tempDir = await getTemporaryDirectory();
      final name = DateTime.now().toIso8601String();
      final path = "${tempDir.path}/$name";
      File? finalresult;
      await picker
          .pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
        preferredCameraDevice: CameraDevice.rear,
        requestFullMetadata: true,
      )
          .then((value) async {
        // if (mounted) {
        // setState(() {});
        finalresult = await testCompressAndGetFile(
            File(value!.path), '${path}Compressed.jpeg');
        await uploadImagesToGallery(finalresult);

        notifyListeners();
        // }
      });
      imageFile = finalresult;
    } catch (e) {
      // showCameraException(e);
    }
    return null;
  }

  FutureOr<File?> getImageFromCamera() async {
    try {
      final tempDir = await getTemporaryDirectory();
      final name = DateTime.now().toIso8601String();
      final path = "${tempDir.path}/$name";
      File? finalresult;
      await picker
          .pickImage(
        source: ImageSource.camera,
        imageQuality: 100,
        preferredCameraDevice: CameraDevice.rear,
        requestFullMetadata: true,
      )
          .then((value) async {
        // if (mounted) {
        // setState(() {});
        finalresult = await testCompressAndGetFile(
            File(value!.path), '${path}Compressed.jpeg');

        await uploadImagesToGallery(finalresult);
        notifyListeners();

        // }
      });
      imageFile = finalresult;
    } catch (e) {
      // showCameraException(e);
    }
    return null;
  }

  Future<File?> testCompressAndGetFile(File file, String targetPath) async {
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path, targetPath,
      quality: 85,
      // rotate: 180,
    );

    return result;
  }
}

showLoaderDialog(title) {
  Get.dialog(
    SharedLoadingDialog(
      title: title,
    ),
    barrierDismissible: true,
  );
}
