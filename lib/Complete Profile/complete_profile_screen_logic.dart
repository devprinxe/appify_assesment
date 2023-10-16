import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/db_constants.dart';
import '../utils/routes.dart';
import 'complete_profile_screen_state.dart';

class CompleteProfileScreenLogic extends GetxController {
  final state = CompleteProfileScreenState();

  @override
  void onInit() {
    super.onInit();
  }

  completeProfile() async {
    state.isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    state.isLoading.value = false;
    Get.toNamed(MainAppRoutes.homeScreen);
  }
}
