import 'package:get/get.dart';

import 'otp_screen_logic.dart';

class OtpScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtpScreenLogic());
  }
}
