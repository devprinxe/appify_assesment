import 'dart:math';

import 'package:appify_book/utils/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'PreferenceUtils.dart';
import 'constansts.dart';

int randomNumberGen() {
  var rnd = new Random();
  var next = rnd.nextDouble() * 1000000;
  while (next < 100000) {
    next *= 10;
  }

  return next.toInt();
}

Color getOrderStatusBgColor(String name) {
  switch (name) {
    case 'Pending':
      return AppColors.greyTextColor.withOpacity(0.2);
    case 'Confirmed':
      return Color(0xFFFFE104);
    case 'Cancelled':
      return Color(0xFFEC1D24);
    case 'Delivered':
      return Color(0xFF24AE5F);
    default:
      return AppColors.greyTextColor.withOpacity(0.2);
  }
}

Color getOrderStatusTextColor(String name) {
  switch (name) {
    case 'Pending':
      return AppColors.black;
    case 'Confirmed':
      return AppColors.black;
    case 'Delivered':
      return AppColors.white;
    case 'Cancelled':
      return AppColors.white;
    default:
      return AppColors.black;
  }
}

Future<bool> wasUserLoggedIn() async {
  await PreferenceUtils.init();
  var token = PreferenceUtils.getString(AppConstants.ACCESS_TOKEN);
  if (token.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}

bool isExpired(String? input) {
  try {
    var formattedDate = DateFormat("yyyy-MM-ddTHH:mm:ss").parse(input!);
    return formattedDate.isBefore(DateTime.now());
  } catch (e) {
    return false;
  }
}

String? getCurrentTimeToUTC() {
  // String startTime = "";

  String parsedString =
      DateFormat("yyyy-MM-ddTHH:mm:ss").format(DateTime.now());
  //startTime = parsedString.substring(0, parsedString.length - 1);
  return parsedString;
}

String? getDateTimeParsed(String? input,
    {String? parsedValue, String? formatValue}) {
  try {
    var formattedDate =
        DateFormat(parsedValue ?? "yyyy-MM-ddTHH:mm:ss").parse(input!);
    return DateFormat(formatValue ?? "dd MMM,yyyy").format(formattedDate);
  } catch (e) {
    return input;
  }
}

Future<void> updateLanguage(Locale locale, String name) async {
  Get.updateLocale(locale);
  await PreferenceUtils.init();
  await PreferenceUtils.setString(AppConstants.LANGUAGE, name);
}

dLog(String? tag, Object? object) {
  if (!kReleaseMode) {
    return debugPrint("$tag" + "==>" + "$object");
  }
}
