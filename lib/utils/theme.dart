import 'package:flutter/material.dart';

class AppSizes {
  static double titleTextSize1 = 16;
  static double textWidgetPadding = 16;
  static double otpFieldHeight = 45;
  static double bigTextStyle = 24;

  static double dashboardExploreHeight = 180;

  static double textWidgetHeight = 60;
  AppSizes._privateConstructor();
  static final AppSizes _instance = AppSizes._privateConstructor();
  static AppSizes get instance => _instance;

  static const double splashScreenLogiSize = 200;
  static const double defaultTextSize = 14;
  static const double mediumTextSize = 12;
  static const double backButtonWidth = 10;
  static const double backButtonHeight = 16;
  static const double buttonPaddingVertical = 14;
  static const double buttonCornerRadius = 6;
}

class AppColors {
  AppColors._privateConstructor();
  static final AppColors _instance = AppColors._privateConstructor();
  static AppColors get instance => _instance;

  static const colorPrimary = Color(0xFF288363);
  static const colorPrimaryLight = Color(0xFF00C4D4);
  static const black = Color(0xFF222222);
  static const white = Color(0xFFFFFFFF);
  static const textColorBlack = Color(0xFF2B2B2E);
  static const textColorFade = Color(0xFF8E8E93);
  static const toggleAsh = Color(0xFFEAEAEA);
  static const borderColor = Color(0xFFF2F2F7);
  static const borderBoxColor = Color(0xFFDFDFDF);
  static const borderPromoColor = Color(0xFFCECFD1);
  static const promoCodeColor = Color(0xFFE33781);
  static const colorPrimaryDark = Color(0xff0E2D22);
  static const colorAccentLightFade = Color(0xffFDF1EE);
  static const colorAccentFade = Color(0xffFFD9CE);
  static const colorBlack = Color(0xff101010);
  static const paymentRadioButton = Color(0xff2E3191);
  static const colorAsh = Color(0xff888888);
  static const colorGrayDeep = Color(0xff727272);
  static const colorGray = Color(0xffF4F5F9);
  var colorTransparent = Color(0xffF4F5F9).withOpacity(0.0);
  static const colorLightBg = Color(0xffF4F5F9);
  static const colorTextFormButtons = Color(0xff888888);
  static const commentTextColor = Color(0xff848484);
  static const greyTextColor = Color(0xff6D6B6B);
  static const tabUnselectedColor = Color(0xFF9DA0A3);
  static const textAshBUttonColor = Color(0xFF3B4148);
  static const tabSelectedColor = Color(0xFF226CC3);
  static const explorePkgBg = Color(0xffE4F2F2);
  static const smallTextColor = Color(0xffA0A0A0);
  static const ashButtonColor = Color(0xffE6E7E8);
  static const ashTextColor = Color(0xff767676);
  static const bgColor = Color(0xffF5F5F5);
  static const takaColor = Color(0xff1F93C3);
  static const priceShowColor = Color(0xffE8F8FF);
  static const textLightColor = Color(0xff717171);
  static const textFieldTopColor = Color(0xff1C1C1E);
  static const colorError = Color(0xffe82b2b);
  static const colorAudioPermissionBg = Color(0xff455A64);
  static const colorGreen = Color(0xff39e32d);
  static const colorGreenDeep = Color(0xff5BB57A);
  static const googleColor = Color(0xffDF4A32);
  static const facebookColor = Color(0xff39579A);
}

class AppThemeData {
  AppThemeData._privateConstructor();
  static final AppThemeData _instance = AppThemeData._privateConstructor();
  static AppThemeData get instance => _instance;

  static ThemeData appMainThemeData() => ThemeData(
      primaryColor: AppColors.colorPrimary,
      backgroundColor: AppColors.white,
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: AppColors.colorPrimaryDark)),
      iconTheme: const IconThemeData(color: AppColors.colorPrimaryDark));
}
