import 'package:appify_book/Splash%20Screen/splash_screen_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../utils/constansts.dart';
import '../utils/theme.dart';

class SplashScreenView extends StatelessWidget {
  SplashScreenView({Key? key}) : super(key: key);

  final logic = Get.find<SplashScreenLogic>();
  final state = Get.find<SplashScreenLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [AppColors.colorPrimary, AppColors.colorPrimaryDark],
          end: Alignment.topCenter,
          begin: Alignment.bottomCenter,
          tileMode: TileMode.repeated,
        )),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: AppSizes.splashScreenLogiSize,
                  height: AppSizes.splashScreenLogiSize,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('images/logo.png'))),
                ),
                flex: 9,
              ),
              const Expanded(
                child: LoadingIndicator(indicatorType: Indicator.ballScale),
                flex: 1,
              ),
              Expanded(
                child: Text(
                  AppStrings.APP_VERSION,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: AppColors.white),
                ),
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
