import 'package:get/get.dart';

import 'complete_profile_screen_logic.dart';

class CompleteProfileScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompleteProfileScreenLogic());
  }
}
