
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../utils/custom_scroll_behavior.dart';
import '../Home Screen/home_screen_binding.dart';
import '../Home Screen/home_screen_view.dart';
import '../Splash Screen/splash_screen_binding.dart';
import '../Splash Screen/splash_screen_view.dart';
import '../config/lang_config.dart';
import '../utils/routes.dart';
import '../utils/theme.dart';

import 'main_logic.dart';

class MainComponent extends StatelessWidget {
  MainLogic appController = Get.put(MainLogic(), permanent: true);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<MainLogic>();
    final state = Get.find<MainLogic>().state;
    //setUpCallKit(context);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        statusBarColor: Colors.black,
        systemStatusBarContrastEnforced: true,
        statusBarBrightness: Brightness.dark));
    return GetMaterialApp(
      title: "Appifybook",
      scrollBehavior: CustomScrollBehavior(),
      color: AppColors.white,
      locale: state.appLocal.value,
      debugShowCheckedModeBanner: false,
      translations: LangConfig(),
      initialRoute: MainAppRoutes.splashScreen,
      theme: AppThemeData.appMainThemeData(),
      getPages: _getPages(),
    );
  }

  List<GetPage<dynamic>> _getPages() {
    return [
      GetPage(
        name: MainAppRoutes.splashScreen,
        page: () => SplashScreenView(),
        binding: SplashScreenBinding(),
      ),
      GetPage(
        name: MainAppRoutes.homeScreen,
        page: () => HomeScreenView(),
        binding: HomeScreenBinding(),
      ),
    ];
  }
}
