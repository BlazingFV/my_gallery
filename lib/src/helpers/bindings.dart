import 'package:get/get.dart';


import 'cache_helper.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CacheHelper(), fenix: true);
    // Get.lazyPut(() => UserController(),fenix: true);
  }
}
