import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../client/base_state.dart';
import '../utils/constansts.dart';

class MainState extends BaseState {

  var callId = '';
  MainState() {
    ///Initialize variables
  }

  var local = "Bangla".obs;
  var appLocal = const Locale("bn","BD").obs;
  int retryCount = 0;
  var methodChannel =  MethodChannel(AppConstants.METHOD_CHANNEL_NAME);

  static MainState get instance => _stateInstance ??= MainState();
  static MainState? _stateInstance;

  static MainState init()  {
    _stateInstance = MainState();
    return _stateInstance??MainState();
  }
}
