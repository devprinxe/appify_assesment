import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../client/base_state.dart';

class LoginScreenState extends BaseState {
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var countryCode = "".obs;
}
