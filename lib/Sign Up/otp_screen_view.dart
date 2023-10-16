import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/common_buttons.dart';
import '../../utils/constansts.dart';
import '../../utils/extensions.dart';
import '../../utils/theme.dart';
import '../utils/text_style.dart';
import 'otp_screen_logic.dart';

class OtpScreenView extends StatelessWidget {
  OtpScreenView({super.key});

  final logic = Get.find<OtpScreenLogic>();
  final state = Get.find<OtpScreenLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              iconTheme: const IconThemeData(color: AppColors.textColorBlack),
              backgroundColor: Colors.white,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Image.asset(
                      "images/logo.png",
                      height: 100,
                      width: 100,
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Text(
                      "Sign Up",
                      style: getTextStyle(
                          18, FontWeight.bold, AppColors.textColorBlack),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    AppTextField(
                      textFieldType: TextFieldType.EMAIL,
                      controller: state.emailAddressController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              color: AppColors.ashTextColor,
                            ),
                          ),
                          labelText: "Email Address",
                          hintText: "Enter your email address"),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    AppTextField(
                      textFieldType: TextFieldType.PASSWORD,
                      controller: state.passwordController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock_open),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              color: AppColors.ashTextColor,
                            ),
                          ),
                          labelText: "Password",
                          hintText: "Enter your password"),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    AppTextField(
                      textFieldType: TextFieldType.PASSWORD,
                      controller: state.confirmPasswordController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock_open),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              color: AppColors.ashTextColor,
                            ),
                          ),
                          labelText: "Confirm Password",
                          hintText: "Enter your password again"),
                    ),
                    Container(
                      height: 50.0,
                      margin: const EdgeInsets.all(20.0),
                      child: CommonButtons.instance.getCommonTextButtons(
                          "Sign Up", () => logic.signUp()),
                    )
                  ],
                ),
              ),
            ),
          ),
          Obx(() {
            return LoadingOverlay(
                isLoading: state.isLoading.value,
                child: Container(
                    width: Get.width,
                    height: Get.height,
                    color: state.isLoading.value
                        ? AppColors.black.withAlpha(50)
                        : null));
          }),
        ],
      ),
    );
  }
}
