import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pinput/pinput.dart';

import '../../utils/common_buttons.dart';
import '../../utils/constansts.dart';
import '../../utils/extensions.dart';
import '../../utils/theme.dart';
import '../utils/routes.dart';
import '../utils/text_style.dart';
import 'login_screen_logic.dart';

class LoginScreenView extends StatelessWidget {
  LoginScreenView({super.key});

  final logic = Get.find<LoginScreenLogic>();
  final state = Get.find<LoginScreenLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              iconTheme: const IconThemeData(color: AppColors.textColorBlack),
              title: Text(
                "Sign in",
                style:
                    getTextStyle(20, FontWeight.bold, AppColors.textColorBlack),
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () => Get.toNamed(MainAppRoutes.otpScreen),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don\'t have an account? ",
                      style: getTextStyle(
                          14.0, FontWeight.normal, AppColors.textColorBlack),
                    ),
                    Text(
                      "Sign Up",
                      style: getTextStyle(
                          14.0, FontWeight.bold, AppColors.colorPrimary),
                    ),
                  ],
                ),
              ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (_) {
                                  return Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          AppTextField(
                                            textFieldType: TextFieldType.EMAIL,
                                            controller:
                                                state.emailAddressController,
                                            maxLines: 5,
                                            decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintText:
                                                    "Enter email address"),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ElevatedButton(
                                              onPressed: () {
                                                finish(context);
                                                showModalBottomSheet(
                                                    context: context,
                                                    builder: (_) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(20.0),
                                                        child: Padding(
                                                          padding: EdgeInsets.only(
                                                              bottom: MediaQuery
                                                                      .of(context)
                                                                  .viewInsets
                                                                  .bottom),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Pinput(
                                                                length: 6,
                                                                showCursor:
                                                                    true,
                                                                onCompleted:
                                                                    (pin) =>
                                                                        print(
                                                                            pin),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    finish(
                                                                        context);
                                                                    showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (_) {
                                                                          return Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(20.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                children: [
                                                                                  AppTextField(
                                                                                    textFieldType: TextFieldType.PASSWORD,
                                                                                    decoration: const InputDecoration(
                                                                                        prefixIcon: Icon(Icons.lock_open),
                                                                                        border: OutlineInputBorder(
                                                                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                                                          borderSide: BorderSide(
                                                                                            color: AppColors.ashTextColor,
                                                                                          ),
                                                                                        ),
                                                                                        labelText: "New Password",
                                                                                        hintText: "Enter new password"),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: 10,
                                                                                  ),
                                                                                  AppTextField(
                                                                                    textFieldType: TextFieldType.PASSWORD,
                                                                                    decoration: const InputDecoration(
                                                                                        prefixIcon: Icon(Icons.lock_open),
                                                                                        border: OutlineInputBorder(
                                                                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                                                          borderSide: BorderSide(
                                                                                            color: AppColors.ashTextColor,
                                                                                          ),
                                                                                        ),
                                                                                        labelText: "Confirm Password",
                                                                                        hintText: "Retype new password"),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: 10,
                                                                                  ),
                                                                                  ElevatedButton(
                                                                                      onPressed: () {
                                                                                        finish(context);
                                                                                      },
                                                                                      child: Text("Reset Password"))
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          );
                                                                        });
                                                                  },
                                                                  child: Text(
                                                                      "Verify"))
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    });
                                              },
                                              child: Text(
                                                  "Send Verification code"))
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Text(
                            "Forgot Password?",
                            style: getTextStyle(
                                14.0, FontWeight.bold, AppColors.colorPrimary),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CommonButtons.instance
                        .getCommonTextButtons("Sign in", () => logic.login()),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Divider(),
                        Text(
                          "OR",
                          style: getTextStyle(
                              12.0, FontWeight.normal, AppColors.ashTextColor),
                        ),
                        Divider(),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        decoration: BoxDecoration(
                            color: AppColors.facebookColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.facebookF,
                              color: Colors.white,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text("Login with Facebook",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        decoration: BoxDecoration(
                            color: AppColors.googleColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.googlePlusG,
                              color: Colors.white,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text("Login with Google",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400)),
                            ),
                          ],
                        ),
                      ),
                    ),
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
