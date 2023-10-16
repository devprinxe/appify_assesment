import 'package:appify_book/Splash%20Screen/splash_screen_logic.dart';
import 'package:get/get.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenLogic());
  }
}
