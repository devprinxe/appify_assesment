import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/db_constants.dart';
import '../../utils/routes.dart';
import 'otp_screen_state.dart';

class OtpScreenLogic extends GetxController {
  final state = OtpScreenState();

  @override
  void onInit() {
    super.onInit();
  }

  signUp() async {
    if (state.passwordController.text == state.confirmPasswordController.text) {
      state.isLoading.value = true;
      await Future.delayed(const Duration(seconds: 1));
      Get.offAndToNamed(MainAppRoutes.completeProfileScreen);
      state.isLoading.value = false;
    } else {
      Get.snackbar("Password Doesn't match", "Confirm password doesn't match",
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
