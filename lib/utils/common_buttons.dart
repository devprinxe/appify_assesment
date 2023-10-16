import 'package:appify_book/utils/root_containers.dart';
import 'package:appify_book/utils/text_style.dart';
import 'package:appify_book/utils/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CommonButtons {
  CommonButtons._privateConstructor();
  static final CommonButtons _instance = CommonButtons._privateConstructor();
  static CommonButtons get instance => _instance;

  TextButton getCommonTextButtons(
    String title,
    Function onPressed, {
    Color? bgColor,
    Color? textColor,
    double? width,
  }) =>
      TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(0),
        ),
        onPressed: () {
          onPressed.call();
        },
        child: Container(
            width: width ?? Get.width,
            decoration: ContainerBoxDecorations.instance
                .getButtonBoxDecoration(bgColor: bgColor),
            padding: const EdgeInsets.symmetric(
                vertical: AppSizes.buttonPaddingVertical),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: getTextStyleDisplay(
                    14, FontWeight.w600, textColor ?? AppColors.white),
              ),
            )),
      );

  TextButton getAshTextButtons(
    String title,
    Function onPressed, {
    Color? bgColor,
    Color? textColor,
  }) =>
      TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(0),
        ),
        onPressed: () {
          onPressed.call();
        },
        child: Container(
            width: Get.width,
            decoration:
                ContainerBoxDecorations.instance.getAshButtonBoxDecoration(),
            padding: const EdgeInsets.symmetric(
                vertical: AppSizes.buttonPaddingVertical),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: getTextStyleDisplay(
                    14, FontWeight.normal, AppColors.textAshBUttonColor),
              ),
            )),
      );
}
