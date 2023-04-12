import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:my_gallery/src/controllers/routing.dart';
import 'package:my_gallery/src/helpers/bindings.dart';
import 'package:my_gallery/src/features/login/presentation/login_screen.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          defaultTransition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 500),
          debugShowCheckedModeBanner: false,
          initialBinding: HomeBindings(),
          // routeInformationParser: router.routeInformationParser,
          // routeInformationProvider: router.routeInformationProvider,
          // routerDelegate: router.routerDelegate,
          useInheritedMediaQuery: true,
          initialRoute: GetRoutes.getRouteLoginScreen(),
          getPages: GetRoutes.getRoutesList(),
          title: 'My Gallery',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          builder: (context, widget) {
            return ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(context, widget!),
              maxWidth: 2560,
              minWidth: 320,
              // // defaultScale: true,
              defaultScale: true,
              defaultScaleFactor: 1,
              // mediaQueryData:const MediaQueryData(),
              useShortestSide: true,

              breakpoints: const [
                ResponsiveBreakpoint.resize(300, name: MOBILE, scaleFactor: 1),
                ResponsiveBreakpoint.resize(320, name: MOBILE, scaleFactor: 1),
                ResponsiveBreakpoint.resize(350, name: MOBILE, scaleFactor: 1),
                ResponsiveBreakpoint.resize(360, name: MOBILE, scaleFactor: 1),
                ResponsiveBreakpoint.autoScale(375,
                    name: MOBILE, scaleFactor: 1),
                ResponsiveBreakpoint.resize(390, name: MOBILE, scaleFactor: 1),
                ResponsiveBreakpoint.resize(392, name: MOBILE, scaleFactor: 1),
                ResponsiveBreakpoint.resize(393, name: MOBILE, scaleFactor: 1),
                ResponsiveBreakpoint.resize(395, name: MOBILE, scaleFactor: 1),
                ResponsiveBreakpoint.resize(400, name: MOBILE, scaleFactor: 1),
                ResponsiveBreakpoint.resize(414, name: MOBILE, scaleFactor: 1),
                ResponsiveBreakpoint.resize(425, name: MOBILE, scaleFactor: 1),
                ResponsiveBreakpoint.resize(428, name: MOBILE, scaleFactor: 1),
                ResponsiveBreakpoint.resize(450, name: MOBILE, scaleFactor: 1),
                ResponsiveBreakpoint.resize(
                  500,
                  name: TABLET,
                  scaleFactor: 1,
                ),
                ResponsiveBreakpoint.resize(510, name: TABLET, scaleFactor: 1),
                ResponsiveBreakpoint.resize(520, name: TABLET, scaleFactor: 1),
                ResponsiveBreakpoint.resize(530, name: TABLET, scaleFactor: 1),
                ResponsiveBreakpoint.resize(540, name: TABLET, scaleFactor: 1),
                ResponsiveBreakpoint.resize(550, name: TABLET, scaleFactor: 1),
                ResponsiveBreakpoint.resize(554, name: TABLET, scaleFactor: 1),
                ResponsiveBreakpoint.resize(560, name: TABLET, scaleFactor: 1),
                ResponsiveBreakpoint.resize(566, name: TABLET, scaleFactor: 1),
                ResponsiveBreakpoint.resize(570, name: TABLET, scaleFactor: 1),
                ResponsiveBreakpoint.resize(585, name: TABLET, scaleFactor: 1),
                ResponsiveBreakpoint.resize(595, name: TABLET, scaleFactor: 1),
                ResponsiveBreakpoint.resize(600, scaleFactor: 1),
                ResponsiveBreakpoint.resize(610, scaleFactor: 1),
                ResponsiveBreakpoint.resize(612, scaleFactor: 1),
                ResponsiveBreakpoint.resize(615, scaleFactor: 1),
                ResponsiveBreakpoint.resize(620, scaleFactor: 1),
                ResponsiveBreakpoint.resize(650, scaleFactor: 1),
                ResponsiveBreakpoint.resize(690, scaleFactor: 1),
                ResponsiveBreakpoint.resize(700, scaleFactor: 1),
                ResponsiveBreakpoint.resize(710, scaleFactor: 1),
                ResponsiveBreakpoint.resize(720, scaleFactor: 1),
                ResponsiveBreakpoint.resize(750, scaleFactor: 1),
                ResponsiveBreakpoint.autoScale(768, scaleFactor: 1),
                ResponsiveBreakpoint.resize(790, scaleFactor: 1),
                ResponsiveBreakpoint.resize(795, scaleFactor: 1),
                ResponsiveBreakpoint.resize(799, scaleFactor: 1),
                ResponsiveBreakpoint.autoScale(800,
                    name: TABLET, scaleFactor: 1),
                ResponsiveBreakpoint.autoScale(820,
                    name: TABLET, scaleFactor: 1),
                ResponsiveBreakpoint.autoScale(829,
                    name: TABLET, scaleFactor: 1),
                ResponsiveBreakpoint.autoScale(850,
                    name: TABLET, scaleFactor: 1),
                ResponsiveBreakpoint.autoScale(890,
                    name: TABLET, scaleFactor: 1),
                ResponsiveBreakpoint.autoScale(900,
                    name: TABLET, scaleFactor: 1),
                ResponsiveBreakpoint.autoScale(920,
                    name: TABLET, scaleFactor: 1),
                ResponsiveBreakpoint.resize(950, name: TABLET, scaleFactor: 1),
                ResponsiveBreakpoint.resize(990, name: TABLET, scaleFactor: 1),
                ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                ResponsiveBreakpoint.resize(1200,
                    name: DESKTOP, scaleFactor: 1),
                ResponsiveBreakpoint.resize(1290,
                    name: DESKTOP, scaleFactor: 1),
                ResponsiveBreakpoint.resize(1291,
                    name: DESKTOP, scaleFactor: 1),
                ResponsiveBreakpoint.resize(1292,
                    name: DESKTOP, scaleFactor: 1),
                ResponsiveBreakpoint.resize(1293,
                    name: DESKTOP, scaleFactor: 1),
                ResponsiveBreakpoint.resize(1294,
                    name: DESKTOP, scaleFactor: 1),
                ResponsiveBreakpoint.resize(1295,
                    name: DESKTOP, scaleFactor: 1),
                ResponsiveBreakpoint.resize(1300,
                    name: DESKTOP, scaleFactor: 1),
                ResponsiveBreakpoint.resize(1400,
                    name: DESKTOP, scaleFactor: 1),
                ResponsiveBreakpoint.resize(1500,
                    name: DESKTOP, scaleFactor: 1),
                ResponsiveBreakpoint.resize(1600,
                    name: DESKTOP, scaleFactor: 1),
                ResponsiveBreakpoint.autoScale(1700,
                    name: 'XL', scaleFactor: 1),
                ResponsiveBreakpoint.autoScale(2460,
                    name: '4K', scaleFactor: 1),
                ResponsiveBreakpoint.autoScale(2560,
                    name: '4K', scaleFactor: 1),
              ],
            );
          },
          home: child,
        );
      },
      child: const LoginScreen(),
    );
  }
}
