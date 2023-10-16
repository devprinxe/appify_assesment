import 'dart:async';

import 'package:appify_book/Splash%20Screen/splash_screen_state.dart';
import 'package:get/get.dart';

import '../utils/routes.dart';

class SplashScreenLogic extends GetxController {
  final state = SplashScreenState();

  @override
  void onInit() {
    _splashTImer();
    super.onInit();
  }

  _splashTImer() async {
    Timer(const Duration(seconds: 2), () {
      Get.toNamed(MainAppRoutes.loginScreen);
    });
  }
}
