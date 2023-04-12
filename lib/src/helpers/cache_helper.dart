import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper extends GetxController {
  SharedPreferences? sharedPreferences;
  String? accessToken;
  String? name;

  @override
  void onInit() async {
    await initSharedPrefs();

    await getToken();
    

    super.onInit();
  }

  initSharedPrefs() async {
    sharedPreferences = await SharedPreferences.getInstance();
    log('<====SharedPrefsController====>initalized Successfully<==== SharedPrefsController====> ');
  }

  getToken() async {
    await initSharedPrefs();
    accessToken = sharedPreferences?.getString('token');
    log('$accessToken========AccessToken');
    return accessToken;
  }

  Future setToken(String token) async {
    await initSharedPrefs();
    await sharedPreferences?.setString('token', token);
    getToken();
  }
   getName() async {
    await initSharedPrefs();
    name = sharedPreferences?.getString('name');
    log('$name========userName');
    return name;
  }

  Future setName(String name) async {
    await initSharedPrefs();
    await sharedPreferences?.setString('name', name);
    getName();
  }
}
