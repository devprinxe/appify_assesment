import 'package:appify_book/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootContainers {
  RootContainers._privateConstructor();
  static final RootContainers _instance = RootContainers._privateConstructor();
  static RootContainers get instance => _instance;

  SafeArea getScaffoldRootContainer<T extends Widget>(T childContainers,
          {BoxDecoration? boxDecoration}) =>
      SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Container(
            width: Get.width,
            height: Get.height,
            decoration: boxDecoration,
            child: childContainers,
          ),
        ),
      );
  BoxDecoration getBoxDecorations(Color color, double radius) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
        bottomLeft: Radius.circular(radius),
        bottomRight: Radius.circular(radius),
      ),
    );
  }
}

class ContainerBoxDecorations {
  ContainerBoxDecorations._privateConstructor();
  static final ContainerBoxDecorations _instance =
      ContainerBoxDecorations._privateConstructor();
  static ContainerBoxDecorations get instance => _instance;

  BoxDecoration getGradientBoxDecoration() =>
      const BoxDecoration(color: AppColors.colorPrimary);

  BoxDecoration getTextBorderStyle() => BoxDecoration(
        border: Border.all(
          color: AppColors.borderColor,
        ),
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
      );
  BoxDecoration getPromoTextBorderStyle() => BoxDecoration(
        border: Border.all(color: AppColors.borderPromoColor, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
      );
  BoxDecoration getBoxBorderStyle() => BoxDecoration(
        border: Border.all(
          color: AppColors.borderBoxColor,
        ),
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
      );

  BoxDecoration getTextBorderStyleBlue() => BoxDecoration(
        border: Border.all(
          color: AppColors.colorPrimary,
        ),
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
      );

  BoxDecoration getButtonBoxDecoration({Color? bgColor}) => BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.buttonCornerRadius),
        color: bgColor ?? AppColors.colorPrimary,
      );
  BoxDecoration getAshButtonBoxDecoration({Color? bgColor}) => BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.buttonCornerRadius),
        color: bgColor ?? AppColors.ashButtonColor,
      );

  BoxDecoration getImageBgBoxDecoration(String imagePath) => BoxDecoration(
          image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.cover,
      ));
}
