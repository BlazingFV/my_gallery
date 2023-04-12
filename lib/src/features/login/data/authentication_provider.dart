import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as client;
import 'package:get/get.dart';

import '../../../configs/app_configs.dart';
import '../../../controllers/routing.dart';
import '../../../helpers/cache_helper.dart';
import '../../../services/snackbar_service.dart';
import '../../../shared/widgets/shared_loading_dialog.dart';
import '../domain/user_model.dart';

class AuthenticationProvider extends ChangeNotifier {
  final dio = client.Dio(client.BaseOptions(
    connectTimeout: const Duration(milliseconds: 30000),
    receiveTimeout: const Duration(milliseconds: 30000),
    baseUrl: AppConfigs.apiBaseUrl,
    followRedirects: false,
    validateStatus: (status) => true,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  ));

  final CacheHelper cacheHelper = CacheHelper();

  UserModel userModel = UserModel();

  UserData userData = UserData();

  String _email = '';

  String _password = '';

  String _name = '';

  String getEmail() => _email;

  String getPassword() => _password;

  String getName() => _name;

  setEmail(String email) {
    _email = email;
    // log(_email);

    notifyListeners();
  }

  setPassword(String password) {
    _password = password;
    // log(_password);
    notifyListeners();
  }

  setName(String name) {
    _name = name;
    // log(_password);
    notifyListeners();
  }

  loginUsingEmail() async {
    await cacheHelper.initSharedPrefs();
    try {
      showLoaderDialog('Authenticating...');
      client.FormData body = client.FormData.fromMap({
        'email': _email,
        'password': _password,
        // "device_id": await cacheHelper.getFCMToken(),
      });

      client.Response response = await dio.request('/auth/login',
          data: body,
          options: client.Options(
            method: 'POST',
            followRedirects: false,
            validateStatus: (status) => true,
          ));

      log('===Login Response=======${response.data}===Login Response=======');
      if (response.statusCode == 201 || response.statusCode == 200) {
        userModel = UserModel.fromJson(response.data);
        userData = userModel.user!;
        setName(userData.name!);
        await Future.wait([
          cacheHelper.setToken(userModel.token ?? ''),
          cacheHelper.setName(userData.name ?? ''),
        ]);

        Get.back(canPop: true, closeOverlays: true);
        SnackBarService.instance.showSnackBarSuccess('Logged In Successfully ');
        await Future.delayed(const Duration(milliseconds: 500));
        Get.offAllNamed(GetRoutes.getRouteGalleryScreen());
        notifyListeners();
      } else {
        Get.back();
        await Future.delayed(const Duration(milliseconds: 1500));
        SnackBarService.instance
            .showSnackBarError('${response.data['message']}');
        log('===Login Error Response=======${response.data['error_message']}===Login Error Response=======');
        notifyListeners();
      }
    } catch (e) {
      log('$e');
      // throw Exception(e);
    }
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
