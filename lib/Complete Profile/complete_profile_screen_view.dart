import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/common_buttons.dart';
import '../../utils/constansts.dart';
import '../../utils/extensions.dart';
import '../../utils/theme.dart';
import '../utils/text_style.dart';
import 'complete_profile_screen_logic.dart';

class CompleteProfileScreenView extends StatelessWidget {
  CompleteProfileScreenView({super.key});

  final logic = Get.find<CompleteProfileScreenLogic>();
  final state = Get.find<CompleteProfileScreenLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              title: Text(
                "Complete Profile",
                style:
                    getTextStyle(16, FontWeight.bold, AppColors.textColorBlack),
              ),
              iconTheme: const IconThemeData(color: AppColors.textColorBlack),
              backgroundColor: Colors.white,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Center(
                      child: Text(
                    "Skip",
                    style: getTextStyle(
                        14, FontWeight.normal, AppColors.ashTextColor),
                  )),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Obx(() => InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    // ignore: sized_box_for_whitespace
                                    child: Container(
                                      height: 200.0,
                                      width: MediaQuery.of(context).size.width -
                                          80,
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () async {
                                                state.pickedImage = await state
                                                    .picker
                                                    .pickImage(
                                                        source: ImageSource
                                                            .gallery);
                                                state.imageFile.value = File(
                                                    state.pickedImage!.path);
                                                state.imagePath.value =
                                                    state.pickedImage!.path;
                                                Future.delayed(
                                                    const Duration(
                                                        milliseconds: 100), () {
                                                  Navigator.pop(context);
                                                });
                                              },
                                              child: const Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.photo_library_rounded,
                                                    size: 60.0,
                                                    color:
                                                        AppColors.colorPrimary,
                                                  ),
                                                  Text(
                                                    "Gallery",
                                                    style: TextStyle(
                                                      fontSize: 20.0,
                                                      color: AppColors
                                                          .colorPrimary,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 40.0,
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                state.pickedImage = await state
                                                    .picker
                                                    .pickImage(
                                                        source:
                                                            ImageSource.camera);
                                                state.imageFile.value = File(
                                                    state.pickedImage!.path);
                                                state.imagePath.value =
                                                    state.pickedImage!.path;
                                                Future.delayed(
                                                    const Duration(
                                                        milliseconds: 100), () {
                                                  Navigator.pop(context);
                                                });
                                              },
                                              child: const Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.camera,
                                                    size: 60.0,
                                                    color:
                                                        AppColors.ashTextColor,
                                                  ),
                                                  Text(
                                                    "Camera",
                                                    style: TextStyle(
                                                      fontSize: 20.0,
                                                      color: AppColors
                                                          .ashTextColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Center(
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: state.imagePath.value == 'No Data'
                                        ? const DecorationImage(
                                            image:
                                                AssetImage("images/user.png"),
                                            fit: BoxFit.cover)
                                        : DecorationImage(
                                            image: FileImage(
                                                state.imageFile.value),
                                            fit: BoxFit.cover,
                                          ),
                                    border: Border.all(
                                        color: AppColors.colorPrimaryDark),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.colorPrimaryDark),
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: const Icon(
                                    Icons.camera,
                                    color: AppColors.colorPrimaryDark,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: state.usernameController,
                      keyboardType: TextInputType.name,
                      enabled: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.colorPrimary)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.colorPrimary)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.colorPrimary)),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: "Enter Your Username",
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: state.firstNameController,
                      enabled: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.colorPrimary)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.colorPrimary)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.colorPrimary)),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: "Enter Your First Name",
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: state.lastNameController,
                      enabled: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.colorPrimary)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.colorPrimary)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.colorPrimary)),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: "Enter Your Last Name",
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: state.referCodeController,
                      readOnly: true,
                      onTap: () async {
                        var data = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        state.referCodeController.text =
                            data.toString().substring(0, 10);
                        state.dob.value = data.toString();
                      },
                      enabled: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.colorPrimary)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.colorPrimary)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.colorPrimary)),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: "Enter Your Date Of Birth",
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CommonButtons.instance
                        .getCommonTextButtons("Complete Profile", () async {
                      logic.completeProfile();
                    }),
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
