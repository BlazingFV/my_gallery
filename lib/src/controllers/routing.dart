import 'package:get/get.dart';
import 'package:my_gallery/src/features/gallery/presentation/gallery_screen.dart';

import '../features/login/presentation/login_screen.dart';

class GetRoutes {
  static const String _loginScreen = '/';

  static const String _galleryScreen = '/gallery_screen';

  static String getRouteLoginScreen() => _loginScreen;

  static String getRouteGalleryScreen() => _galleryScreen;

  static List<GetPage> getRoutesList() => _routes;

  static final List<GetPage> _routes = [
    GetPage(
      name: _loginScreen,
      page: () => const LoginScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: _galleryScreen,
      page: () => const GalleryScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];
}
