import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nb_utils/nb_utils.dart';

import '../utils/routes.dart';
import 'login_screen_state.dart';

class LoginScreenLogic extends GetxController {
  final state = LoginScreenState();

  login() async {
    state.isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    state.isLoading.value = false;
    Get.offAndToNamed(MainAppRoutes.completeProfileScreen);
    state.isLoading.value = false;
  }
}
