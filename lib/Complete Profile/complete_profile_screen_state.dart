import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../client/base_state.dart';

class CompleteProfileScreenState extends BaseState {
  final ImagePicker picker = ImagePicker();
  XFile? pickedImage;
  var imageFile = File('No File').obs;
  var imagePath = 'No Data'.obs;
  var imageUrl = "".obs;
  var dob = "".obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController referCodeController = TextEditingController();
}
