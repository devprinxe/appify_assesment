import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../utils/PreferenceUtils.dart';
import '../utils/constansts.dart';
import 'main_state.dart';

class MainLogic extends GetxController with WidgetsBindingObserver {
  final MainState state = MainState.init();

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    getLang();
    // listenToCallPort();
  }

  @override
  void onReady() {
    super.onReady();
    getAppSavedLocale();
  }

  @override
  void onClose() {
    super.onClose();
  }


  void getAppSavedLocale() async {
    await PreferenceUtils.init();
    var langValue = PreferenceUtils.getString(AppConstants.LANGUAGE, "Bangla");
    state.local.value = langValue;
    switch (langValue) {
      case "Bangla":
        state.appLocal.value = Locale('bn', 'BD');
        break;
      case "English":
        state.appLocal.value = Locale('en', 'US');
        break;
      case "":
        state.appLocal.value = Locale('bn', 'BD');
        break;
    }
  }

  bool isBngLang() {
    var langValue = PreferenceUtils.getString(AppConstants.LANGUAGE, "Bangla");

    bool isBang = true;
    switch (langValue) {
      case "Bangla":
        isBang = true;
        break;
      case "English":
        isBang = false;
        break;
      case "":
        isBang = true;
        break;
    }
    return isBang;
  }

  Future<void> getLang() async {
    await PreferenceUtils.init();
    var lang = PreferenceUtils.getString(AppConstants.LANGUAGE, "Bangla");

    for (var element in AppConstants.localeList) {
      if (element['name'] == lang) {
        await updateLanguage(element['locale'], element['name']);
        break;
      }
    }
  }

  Future<void> updateLanguage(Locale locale, String name) async {
    Get.updateLocale(locale);
    await PreferenceUtils.init();
    await PreferenceUtils.setString(AppConstants.LANGUAGE, name);
  }

  String replaceBanglaNumber(String input) {
    const bangla = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], bangla[i]);
    }

    return input;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    Fluttertoast.showToast(msg: 'DISPOSED');
    super.dispose();
  }
}
