import 'dart:ui';

import 'package:get/get.dart';

class AppStrings {
  static String APP_COMMON_MOBILE_NUMBER = "Mobile Number";

  static String DEFAULT_COUNTRY_CODE = "+88";

  static String PHONE_NUMBER_HINT = "eg. 017XXXXXXXX";
  static String PHONE_NUMBER_HINT_FOR_BOOKING = "+88017XXXXXXXX";

  static String APP_COMMON_NEXT = "Next";
  static String APP_COMMON_SAVE = "Save";

  static String APP_COMMON_EDIT = "Edit";

  static String OTP_DIDNT_GET = "I didn’t get a code";
  static String NAME_HINT = "";
  static String PROMO_CODE_HINT = "Enter Promo Code".tr;
  static String EMAIL_HINT = "username@domain.dh";

  static String RESEND_NOW = "Resend now";
  static String RESEND_THE_OTP_AFTER = "Resend the otp after";
  AppStrings._privateConstructor();
  static final AppStrings _instance = AppStrings._privateConstructor();
  static AppStrings get instance => _instance;

  static const String APP_NAME = 'Rewardboss';

  static const String APP_VERSION = 'Version 1.0.0';
  static const String CONNECTION_TIME_OUT_ERROR =
      'Connection timeout with API server';
  static const String CONNECTION_CANCELED =
      'Request to API server was cancelled';
  static const String CONNECTION_TIME_OUT_ON_RECEIVED =
      'Receive timeout in connection with API server';
  static const String CONNECTION_TIME_OUT_ON_SEND =
      'Send timeout in connection with API server';
  static const String CONNECTION_ERROR_NO_INTERNET =
      'Connection to API server failed due to internet connection';
  static const String APP_QUIZ_INSTRUCTIONS = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
}

class AppConstants {
  static int OTP_RESEND_TIME = 5 * 60;
  static int HOME_WIDGET_TIME_DIFF = 5;

  static String ACCESS_TOKEN = 'access_token';
  static String ADMIN_EMAIL = 'princey01767@gmail.com';
  static String REFRESH_TOKEN = 'refresh_token';
  static String FCM_TOKEN = 'access_fcm_token';
  static String CALL_UUID = 'CALL_UUID';
  static String USER_DATA = 'user_data';
  static String HOME_WIDGET = 'home_widget';
  static String HOME_WIDGET_SET_TIME = 'home_widget_setTime';
  static String SERVICE_LIST = 'SERVICE_LIST';
  static String ResponseUserIdentify = 'ResponseUserIdentify';
  static String USER_SUB = 'userSub';
  static String callIdMain = '';
  static String callPort = 'CALLER_ID-10000';
  static String takaSign = '৳';
  static String CONSULT_NEW_PATIENT = 'CONSULT_NEW_PATIENT';
  static String CONSULT_ReturningPatientFee = 'CONSULT_ReturningPatientFee';
  static String CONSULT_FollowUpFee = 'CONSULT_FollowUpFee';
  static int UNLIMITED_COUNT = 999;
  static String AGORA_BOT_ID = "11111111111";

  static String IS_CHAT_SESSION_ACTIVE = "IS_CHAT_SESSION_ACTIVE";
  static String CHAT_EVENT_HANDLER = "UNIQUE_CHAT_EVENT_HANDLER";
  static String ON_CHAT_ENDED_CODE = "0XXXEI0";

  static int reCallMinTime = 33;

  static String METHOD_CHANNEL_NAME = "dh.health.digital.hospital";

  static String PATIENT_CHAT_HISTORY = "PATIENT_CHAT_HISTORY";
  static String PATIENT_VIDEO_CHAT_HISTORY = "PATIENT__VIDEO_CHAT_HISTORY";
  // static String CHAT_ACTIVATION_TIME = "PATIENT_CHAT_ACTIVE_SESSION_TIME";

  static String appVersion = 'V 1.1.0(10)';

  AppConstants._privateConstructor();
  static final AppConstants _instance = AppConstants._privateConstructor();
  static AppConstants get instance => _instance;

  static const int SPLASH_SCREEN_DURATION = 500;
  static const int CALL_SCREEN_DURATION = 3;

  static String VIDEO_CALL_STATE = 'video_call';
  static String AUDIO_CALL_STATE = 'audio_call';
  static String CHAT_STATE = 'chat';
  static String MY_SUBSCRIPTIONS = "my_subscriptions";
  static String MY_ACTIVE_SUBSCRIPTION = "my_active_subscription";
  static String MY_PRESCRIPTIONS = "MY_PRESCRIPTIONS";
  static String MY_ACTIVE_CHANNEL = "MY_ACTIVE_CHANNEL";
  static String MY_ACTIVE_CHANNEL_TOKEN = "MY_ACTIVE_CHANNEL_TOKEN";
  static String MY_ACTIVE_DR_NAME = "MY_ACTIVE_DR_NAME";
  static String MY_ACTIVE_DR_CONTACT = "MY_ACTIVE_DR_CONTACT";
  static String MY_ACTIVE_DR_BMDC = "MY_ACTIVE_DR_BMDC";
  static String MY_ACTIVE_CALL_TIME = "MY_ACTIVE_CALL_TIME";
  static String MY_ACTIVE_DR_PROFILE = "MY_ACTIVE_DR_PROFILE";
  static String STREAM_TYPE_VIDEO = 'VIDEO';
  static String STREAM_TYPE_AUDIO = 'AUDIO';
  static String STREAM_TYPE_CHAT = 'CHAT';

  static const LNG_ENG = 'en';
  static const LNG_BD = 'bd';
  static const LANGUAGE = 'language';

  static const LNG_ENG_DETAIL = 'English';
  static const LNG_BD_DETAIL = 'Bangla';

  static const List localeList = [
    {'name': LNG_BD_DETAIL, 'locale': Locale('bn', 'BD')},
    {'name': LNG_ENG_DETAIL, 'locale': Locale('en', 'US')},
  ];
}

class AppFlags {
  AppFlags._privateConstructor();
  static const AUDIO_CALL = 1;
  static const VIDEO_CALL = 2;
  static const CHAT = 3;

  static const AUDIO_CALL_ID = "AUDIO";
  static const VIDEO_CALL_ID = "VIDEO";
  static const CHAT_ID = "TEXT";
}
