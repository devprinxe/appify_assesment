import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../client/base_state.dart';

class HomeScreenState extends BaseState {
  TextEditingController phoneNumberController = TextEditingController();
  var isBalanceShow = false.obs;
  final TextEditingController referTextController =
      TextEditingController(text: '5FLK2M');

  var isLikes = false.obs;
  var showReaction = false.obs;

  var urls = <String>[
    'images/imag1.jpg',
    'images/image2.jpg',
    'images/image3.jpg',
    'images/image4.jpg',
    'images/image5.jpg',
    'images/image6.jpg',
  ];
}
